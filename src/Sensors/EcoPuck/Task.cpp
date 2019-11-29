//***************************************************************************
// Copyright 2007-2017 Universidade do Porto - Faculdade de Engenharia      *
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
// Author: renalberto                                                       *
//***************************************************************************

// DUNE headers.
#include <DUNE/DUNE.hpp>

namespace Sensors
{
  //! Stop sampling.
  static const char* c_cmd_stop = "!!!!!";
  //! Continuous sampling command.
  static const char* c_cmd_continuous = "$pkt=0";
  //! Disable memory command.
  static const char* c_cmd_no_mem = "$rec=0";
  //! No engineering column command.
  static const char* c_cmd_no_eng = "$cal=0";
  //! Store command.
  static const char* c_cmd_store = "$sto";
  //! Command to restart sampling after being stopped.
  static const char* c_cmd_restart = "$run";

  namespace EcoPuck
  {
    using DUNE_NAMESPACES;

    //! Task arguments.
    struct Arguments
    {
      //! GPIO state.
      bool state;
      //! Serial port device.
      std::string uart_dev;
      //! Serial port baud rate
      unsigned baud;
      //! Input timeout.
      double timeout;
      //! CDOM dark counts.
      unsigned dom_dc;
      //! CDOM scale factor.
      double dom_sf;
      //! Chlorophyll dark counts.
      unsigned chl_dc;
      //! Chlorophyll scale factor.
      double chl_sf;
      //! Scattering meter dark counts.
      unsigned obc_dc;
      //! Scattering meter scale factor.
      double obc_sf;
    };

    struct Task: public Tasks::Task
    {
      //! GPIO handle
      Hardware::GPIO* m_gpio;
      //! GPIO state
      bool m_gpio_state;
      //! Flag for GPIO activation
      bool m_activate;
      //! Serial port handle.
      SerialPort* m_uart;
      //! Watchdog.
      Counter<double> m_wdog;
      //! Dissolved Organic Matter.
      IMC::DissolvedOrganicMatter m_dom;
      //! Optical Backscattering Coefficient.
      IMC::OpticalBackscatter m_obc;
      //! Chlorophyll.
      IMC::Chlorophyll m_chl;
      //! Received data line.
      std::string m_line;
      //! Task arguments.
      Arguments m_args;
      
      //! Constructor.
      //! @param[in] name task name.
      //! @param[in] ctx context.
      Task(const std::string& name, Tasks::Context& ctx):
        Tasks::Task(name, ctx), 
        m_gpio(NULL),
        m_activate(false),
        m_uart(NULL)
      {
        paramActive(Tasks::Parameter::SCOPE_IDLE,
                    Tasks::Parameter::VISIBILITY_DEVELOPER);
                    
        // Define configuration parameters.
        param("GPIO - State", m_args.state)
        .defaultValue("1")
        .minimumValue("0")
        .maximumValue("1")
        .description("Set GPIO state");

        param("Serial Port - Device", m_args.uart_dev)
        .defaultValue("")
        .description("Serial port device used to communicate with the sensor");

        param("Serial Port - Baud Rate", m_args.baud)
        .defaultValue("19200")
        .description("Serial port Baud Rate");

        param("Input Timeout", m_args.timeout)
        .defaultValue("5.0")
        .minimumValue("2.0")
        .units(Units::Second)
        .description("Amount of seconds to wait for data before reporting an error");

        param("CDOM -- Dark Counts", m_args.dom_dc)
        .defaultValue("41")
        .description("Signal output of the meter in clean water with black tape over detector");

        param("CDOM -- Scale Factor", m_args.dom_sf)
        .defaultValue("0.0896")
        .description("Scale factor is used to derive instrument output concentration"
                     " from the raw signal output of the fluorometer");

        param("Chlorophyll -- Dark Counts", m_args.chl_dc)
        .defaultValue("44")
        .description("Signal output of the meter in clean water with black tape over detector");

        param("Chlorophyll -- Scale Factor", m_args.chl_sf)
        .defaultValue("0.0073")
        .description("Scale factor is used to derive instrument output concentration"
                     " from the raw signal output of the fluorometer");

        param("Scattering -- Dark Counts", m_args.obc_dc)
        .defaultValue("44")
        .description("Signal output of the meter in clean water with black tape over detector");

        param("Scattering -- Scale Factor", m_args.obc_sf)
        .defaultValue("1.824e-6")
        .description("Scale factor is used to derive instrument output concentration"
                     " from the raw signal output of the fluorometer");

        m_dom.type = IMC::DissolvedOrganicMatter::DT_COLORED;
        setEntityState(IMC::EntityState::ESTA_BOOT, Status::CODE_INIT);
      }

      //! Update internal state with new parameter values.
      void
      onUpdateParameters(void)
      {
        if (getEntityState() != IMC::EntityState::ESTA_NORMAL && paramChanged(m_args.state))
        {
          m_gpio_state = m_args.state;

          // If sensor has been turned on, activate the task
          // If sensor has been turned off, deactivate the task
          // SSRs are normally-closed (NC), so deactivation means GPIO state = 1
          if(m_args.state)
          {
            m_activate = false;
            requestDeactivation();
          }
          else
          {
            m_activate = true;
            requestActivation();
          }
        }

        if (paramChanged(m_args.timeout))
          m_wdog.setTop(m_args.timeout);
      }

      //! Reserve entity identifiers.
      void
      onEntityReservation(void)
      {
        m_dom.setSourceEntity(reserveEntity("EcoPuck Dissolved Organic Matter"));
        m_obc.setSourceEntity(reserveEntity("EcoPuck Optical Backscattering Coefficient"));
        m_chl.setSourceEntity(reserveEntity("EcoPuck Chlorophyll"));
      }
      
      //! Acquire resources.
      void
      onResourceAcquisition(void)
      {
        try
        {
          m_uart = new SerialPort(m_args.uart_dev, m_args.baud);
          m_uart->setCanonicalInput(true);

          m_gpio = new Hardware::GPIO(66);
          m_gpio->setDirection(Hardware::GPIO::GPIO_DIR_OUTPUT);
          m_gpio->setValue(0);
        }
        catch (std::runtime_error& e)
        {
          throw RestartNeeded(e.what(), 30);
        }
      }

      //! Initialize resources.
      void
      onResourceInitialization(void)
      {
        sendCommand(c_cmd_stop);
        sendCommand(c_cmd_continuous);
        sendCommand(c_cmd_no_mem);
        sendCommand(c_cmd_no_eng);
        sendCommand(c_cmd_store);
        sendCommand(c_cmd_restart);
        setEntityState(IMC::EntityState::ESTA_NORMAL, Status::CODE_ACTIVE);
        m_wdog.reset();
      }

      //! Release resources.
      void
      onResourceRelease(void)
      {
        sendCommand(c_cmd_stop);
        Memory::clear(m_uart);
        Memory::clear(m_gpio);
      }

      //! Process incoming sentence.
      //! @param[in] msg sentence.
      void
      process(const std::string& msg)
      {
        unsigned obc, chl, dom;
        int rv = std::sscanf(msg.c_str(),"%*s\t%*s\t%*u\t%u\t%*u\t%u\t%*u\t%u\t%*u\r\n",
                             &obc, &chl, &dom);

        if (rv == 3)
        {
          trace("counts: chlor: %u | cdom: %u | scatter: %u", chl, dom, obc);

          double tstamp = Clock::getSinceEpoch();
          m_obc.setTimeStamp(tstamp);
          m_chl.setTimeStamp(tstamp);
          m_dom.setTimeStamp(tstamp);
          m_obc.value = m_args.obc_sf * (double)(obc - m_args.obc_dc);
          m_chl.value = m_args.chl_sf * (double)(chl - m_args.chl_dc);
          m_dom.value = m_args.dom_sf * (double)(dom - m_args.dom_dc);

          dispatch(m_obc, DF_KEEP_TIME);
          dispatch(m_dom, DF_KEEP_TIME);
          dispatch(m_chl, DF_KEEP_TIME);

          debug("output: chlor: %0.2f | cdom: %0.2f | scatter: %0.2f",
                m_chl.value, m_dom.value, m_obc.value);

          setEntityState(IMC::EntityState::ESTA_NORMAL, Status::CODE_ACTIVE);
          m_wdog.reset();
        }
        else
        {
          trace("unable to parse: '%s'", msg.c_str());
        }
      }

      //! Send command to device.
      //! @param[in] cmd command to send.
      void
      sendCommand(const std::string& cmd)
      {
        if (m_uart == NULL)
          return;

        std::string bfr(cmd + "\r\n");
        m_uart->write(bfr.c_str(), bfr.size());
        spew("sent: '%s'", sanitize(bfr).c_str());
      }

      //! Check serial port for incoming transmissions.
      void
      listen(void)
      {
        if (m_uart == NULL)
          return;

        char bfr[256];

        if (!Poll::poll(*m_uart, 2.0))
          return;

        size_t rv = m_uart->readString(bfr, sizeof(bfr));

        for (size_t i = 0; i < rv; ++i)
        {
          m_line.push_back(bfr[i]);

          // Detect line termination.
          if (bfr[i] == '\n')
          {
            spew("recv: %s", sanitize(m_line).c_str());
            process(m_line);
            m_line.clear();
          }
        }
      }

      //! Main loop.
      void
      onMain(void)
      {
        // Wait for resource acquisition and initialization
        while(getEntityState() != IMC::EntityState::ESTA_NORMAL);
        
        // Run while task is active
        while(!stopping())
        {
          if(m_activate)
          {
            trace("Activating sensor");
            m_gpio->setValue(0);
          } else
          {
            trace("Deactivating sensor");
            m_gpio->setValue(1);
          }
        
          // Get data from sensor
          listen();

          trace("EcoPuck Dissolved Organic Matter: %.2f", m_dom.value);
          trace("EcoPuck OBC: %.2f", m_obc.value);
          trace("EcoPuck Chlorophyll: %.2f", m_chl.value);

          // Not received communication for a while
          if (m_wdog.overflow())
          {
            setEntityState(IMC::EntityState::ESTA_ERROR, Status::CODE_COM_ERROR);
            throw RestartNeeded(DTR(Status::getString(CODE_COM_ERROR)), 5);
          }

          // Sleep for 1s
          Delay::wait(1.0);
        }

        // When stopping task, turn sensor off
        m_gpio->setValue(1);
      }
    };
  }
}

DUNE_TASK
