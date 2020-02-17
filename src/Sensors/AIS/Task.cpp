//***************************************************************************
// Copyright 2007-2019 Universidade do Porto - Faculdade de Engenharia      *
// Laboratório de Sistemas e Tecnologia Subaquática (LSTS)                  *
//***************************************************************************
// This file is part of DUNE: Unified Navigation Environment.               *
//                                                                          *
// Commercial Licence Usage                                                 *
// Licencees holding valid commercial DUNE licences may use this file in    *
// accordance with the commercial licence agreement provided with the       *
// Software or, alternatively, in accordance with the terms contained in a  *
// written agreement between you and Faculdade de Engenharia da             *
// Universidade do Porto. For licensing terms, conditions, and further      *
// information contact lsts@fe.up.pt.                                       *
//                                                                          *
// Modified European Union Public Licence - EUPL v.1.1 Usage                *
// Alternatively, this file may be used under the terms of the Modified     *
// EUPL, Version 1.1 only (the "Licence"), appearing in the file LICENCE.md *
// included in the packaging of this file. You may not use this work        *
// except in compliance with the Licence. Unless required by applicable     *
// law or agreed to in writing, software distributed under the Licence is   *
// distributed on an "AS IS" basis, WITHOUT WARRANTIES OR CONDITIONS OF     *
// ANY KIND, either express or implied. See the Licence for the specific    *
// language governing permissions and limitations at                        *
// https://github.com/LSTS/dune/blob/master/LICENCE.md and                  *
// http://ec.europa.eu/idabc/eupl.html.                                     *
//***************************************************************************
// Author: José Braga                                                       *
//***************************************************************************

// ISO C++ 98 headers.
#include <cstring>
#include <algorithm>
#include <cstddef>
#include <sstream>
#include <string>
#include <vector>

// DUNE headers.
#include <DUNE/DUNE.hpp>

// LibAIS headers.
#include <ais/ais.h>

// Local headers.
#include "ShipTypeCode.hpp"

namespace Sensors
{
  //! Device driver for AIS receivers.
  namespace AIS
  {
    using DUNE_NAMESPACES;

    //! Read buffer size.
    static const size_t c_read_buffer_size = 82;
    //! NMEA 5 body index.
    static const size_t c_nmea5_body_index = 15;
    //! NMEA 5 trailing chunk in first fragment.
    static const size_t c_nmea5_trail = 5;
    //! Line termination character.
    static const char c_line_term = '\n';

    //! %Task arguments.
    struct Arguments
    {
      //! Serial port device.
      std::string uart_dev;
      //! Serial port baud rate.
      unsigned uart_baud;
    };

    struct Task: public DUNE::Tasks::Task
    {
      //! Serial port handle.
      IO::Handle* m_handle;
      //! Task arguments.
      Arguments m_args;
      //! Current line.
      std::string m_line;
      //! Saved first part of NMEA 5 class message.
      std::string m_nmea5_fg;
      //! Waiting fragment.
      bool m_nmea5_wait_fg;
      //! Vehicle Type.
      std::map<int, std::string> m_systems;

      Task(const std::string& name, Tasks::Context& ctx):
        DUNE::Tasks::Task(name, ctx),
        m_handle(NULL),
        m_nmea5_wait_fg(false)
      {
        // Define configuration parameters.
        param("Serial Port - Device", m_args.uart_dev)
        .defaultValue("")
        .description("Serial port device used to communicate with the sensor");

        param("Serial Port - Baud Rate", m_args.uart_baud)
        .defaultValue("38400")
        .description("Serial port baud rate");
      }

      void
      onResourceAcquisition(void)
      {
        try
        {
          if (!openSocket()) // Check if instead of serial is a tcp port
          {
            m_handle = new SerialPort(m_args.uart_dev, m_args.uart_baud);
            m_handle->flush();
          }
        }
        catch (...)
        {
          throw RestartNeeded(DTR(Status::getString(CODE_COM_ERROR)), 5);
        }
      }

      //! Check if we have a TCP socket as device input argument.
      //! @return true if it is a TCP socket, false otherwise.
      bool
      openSocket(void)
      {
        char addr[128] = {0};
        unsigned port = 0;

        if (std::sscanf(m_args.uart_dev.c_str(), "tcp://%[^:]:%u", addr, &port) != 2)
          return false;

        TCPSocket* sock = new TCPSocket;
        sock->connect(addr, port);
        m_handle = sock;
        return true;
      }

      void
      onResourceRelease(void)
      {
        Memory::clear(m_handle);
      }

      //! Process AIS NMEA message.
      void
      process(std::string nmea_msg)
      {
        // Remove carriage return.
        nmea_msg.erase(std::remove(nmea_msg.begin(), nmea_msg.end(), '\r'), nmea_msg.end());

        // Log NMEA msg.
        IMC::DevDataText text;
        text.value = nmea_msg;
        dispatch(text);

        // AIS message.
        IMC::AisInfo ais_msg;

        // Ignore messages concerning own vessel.
        if(nmea_msg[0]=='!')
        {
          // Get body of NMEA message.
          //trace("AIS RAW MESSAGE: %s", nmea_msg.c_str());

          std::string nmea_payload = GetBody(nmea_msg.c_str());

          ais_msg.msg_type = nmea_payload[0];

          //trace("AIS MESSAGE PAYLOAD: %s", nmea_payload.c_str());

          //trace("AIS MESSAGE TYPE %c", nmea_payload[0]);

          // Position Report Class A.
          if ((nmea_payload[0] == '1') ||
              (nmea_payload[0] == '2') ||
              (nmea_payload[0] == '3'))
          {
            Ais1_2_3 msg(nmea_payload.c_str(), GetPad(nmea_msg));

            // We are able to send a message with ship information.
            IMC::RemoteSensorInfo rsi;
            rsi.id = static_cast<std::ostringstream*>(&(std::ostringstream() << msg.mmsi))->str();

            // Find ship type.
            std::map<int, std::string>::iterator itr = m_systems.find(msg.mmsi);
            if (itr != m_systems.end())
            {
              ais_msg.sensor_class = itr->second;
              rsi.sensor_class = itr->second;
            }

            rsi.lat = Angles::radians(msg.y);
            rsi.lon = Angles::radians(msg.x);
            rsi.heading = Angles::radians(msg.cog);
            dispatch(rsi);

            ais_msg.mmsi = std::to_string(msg.mmsi);
            //ais_msg.callsign = "NO CALLSIGN";
            //ais_msg.name = "NO NAME";
            ais_msg.nav_status = msg.nav_status;
            //ais_msg.type_and_cargo = 000;
            ais_msg.lat = Angles::radians(msg.y);
            ais_msg.lon = Angles::radians(msg.x);
            ais_msg.course = Angles::radians(msg.cog);
            ais_msg.speed = Angles::radians(msg.sog);
            
            // Navigational status has to be interpreted here or in CAS.
            //trace("AIS1_2_3: %d %d %f %f %f %f", msg.mmsi, msg.nav_status, msg.y, msg.x, msg.cog, msg.sog);

            //spew("PAYLOAD AIS1_2_3: %s", nmea_payload.c_str());
            //spew("RSI - Vessel(mmsi): %s (lon,lat,heading, speed): %f %f %0.2f %0.2f", rsi.id.c_str(),  c_degrees_per_radian*rsi.lon, c_degrees_per_radian*rsi.lat ,c_degrees_per_radian*rsi.heading, msg.sog);

          } else if (nmea_payload[0] == '5' && !m_nmea5_wait_fg) // Static and Voyage Related Data, first fragment.
          {
            nmea_msg.erase(nmea_msg.size() - c_nmea5_trail - 1, c_nmea5_trail);
            m_nmea5_fg = nmea_msg;
            m_nmea5_wait_fg = true;
            return;
          } else
          {
            trace("MISSED MESSAGE!!!!!!!!!!!!!!: %s", nmea_msg.c_str());
          }

          // Static and Voyage Related Data, second fragment.
          if (m_nmea5_wait_fg)
          {
            nmea_msg.erase(0, c_nmea5_body_index);
            nmea_msg = m_nmea5_fg.append(nmea_msg);
            nmea_payload = GetBody(nmea_msg.c_str());
            //trace("PAYLOAD AIS5: %s", nmea_payload.c_str());
          }

          // Static and Voyage Related Data, second fragment.
          if (m_nmea5_wait_fg)
          {
            m_nmea5_wait_fg = false;
            Ais5 msg(nmea_payload.c_str(), GetPad(nmea_msg));

            // Add system MMSI and Type if not existent.
            std::map<int, std::string>::iterator itr = m_systems.find(msg.mmsi);
            if (itr != m_systems.end())
              return;
            
            ais_msg.mmsi = std::to_string(msg.mmsi);
            ais_msg.callsign = msg.callsign;
            ais_msg.name = msg.name;
            //ais_msg.nav_status = 000;
            ais_msg.type_and_cargo = msg.type_and_cargo;
            ais_msg.a = msg.dim_a;
            ais_msg.b = msg.dim_b;
            ais_msg.c = msg.dim_c;
            ais_msg.d = msg.dim_d;
            ais_msg.draught = msg.draught;            

            m_systems[msg.mmsi] = ShipTypeCode::translate(msg.type_and_cargo);
          }
          dispatch(ais_msg);
        }
      }

      void
      onMain(void)
      {
        std::vector<char> bfr;
        bfr.resize(c_read_buffer_size);

        while (!stopping())
        {
          consumeMessages();

          if (!Poll::poll(*m_handle, 1.0))
            continue;

          size_t rv = m_handle->read(&bfr[0], bfr.size());
          if (rv == 0)
          {
            setEntityState(IMC::EntityState::ESTA_ERROR, Status::CODE_COM_ERROR);
            throw RestartNeeded(DTR("I/O error"), 5);
          }

          for (size_t i = 0; i < rv; ++i)
          {
            // Detected line termination.
            if (bfr[i] == c_line_term)
            {
              process(m_line);
              setEntityState(IMC::EntityState::ESTA_NORMAL, Status::CODE_ACTIVE);
              m_line.clear();
            }
            else
            {
              m_line.push_back(bfr[i]);
            }
          }
        }
      }
    };
  }
}

DUNE_TASK