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
// Author: Alberto Dallolio                                                 *
//***************************************************************************

// ISO C++ 98 headers.
#include <cstring>
#include <cmath>
#include <vector>
#include <string>
#include <fstream>
#include <sstream>
// DUNE headers.
#include <DUNE/DUNE.hpp>

namespace Supervisors
{
  //! Insert short task description here.
  //!
  //! Insert explanation on task behaviour here.
  //! @author Alberto Dallolio
  namespace Grounding
  {
    using DUNE_NAMESPACES;

    struct Arguments
    {
      //! Digital Map Path.
      std::string path;
      //! Depth safety threshold.
      int threshold;
    };

    struct Task: public DUNE::Tasks::Task
    {
      std::vector<double> lon, lat;
      std::vector<int> depth;
      int m_depth_thr;
      double m_lat_map_spacing;
      double m_lon_map_spacing;
      //! Task arguments.
      Arguments m_args;

      //! Constructor.
      //! @param[in] name task name.
      //! @param[in] ctx context.
      Task(const std::string& name, Tasks::Context& ctx):
        DUNE::Tasks::Task(name, ctx),
        m_depth_thr(-30),
        m_lat_map_spacing(0.0),
        m_lon_map_spacing(0.0)
      {
        // Define configuration parameters.
        param("Digital Map Path", m_args.path)
        .defaultValue("/home/autonaut/autonaut-toolchain/L2/dune/misc/TrondheimsFjord.txt")
        .description("Path to the Digital Map");

        // Define configuration parameters.
        param("Safety Threshold", m_args.threshold)
        .defaultValue("-30")
        .description("Depth safety threshold.");

        bind<IMC::Abort>(this);
        bind<IMC::VehicleState>(this);
        bind<IMC::PlanSpecification>(this);
      }

      //! Update internal state with new parameter values.
      void
      onUpdateParameters(void)
      {
        if(paramChanged(m_args.threshold))
          m_depth_thr = m_args.threshold;
      }

      //! Initialize resources.
      void
      onResourceInitialization(void)
      {
        // Initialize entity state.
        setEntityState(IMC::EntityState::ESTA_NORMAL, Status::CODE_IDLE);

        readCoordFromFile(m_args.path);
      }

      /*void
      onDeactivation(void)
      {
        setEntityState(IMC::EntityState::ESTA_NORMAL, Status::CODE_IDLE);
      }*/

      void
      readCoordFromFile(std::string path)
      {
        std::fstream in(path);

        std::string line;
        double lon_val, lat_val, depth_val;

        while(std::getline(in, line))
        {
          std::istringstream iss(line);
          iss >> lon_val >> lat_val >> depth_val;
          lon.push_back((int)(lon_val / 0.0001) * 0.0001);
          lat.push_back((int)(lat_val / 0.0001) * 0.0001);
          depth.push_back((int)(depth_val / 0.0001) * 0.0001);
        }

        //spew("Coordinates %0.4f %0.4f %d",lat[719], lat[720], depth[0]);
        in.close();
      }

      void
      consume(const IMC::Abort* msg)
      {
        if (msg->getDestination() != getSystemId())
          return;

        if (isActive())
          requestDeactivation();
      }

      void
      consume(const IMC::VehicleState* msg)
      {
        //m_dr |= GOT_VSTATE;

        //m_serv_err = (msg->op_mode == IMC::VehicleState::VS_SERVICE) || (msg->op_mode == IMC::VehicleState::VS_ERROR);
      }

      void
      consume(const IMC::PlanSpecification* msg)
      {
        std::vector<IMC::Maneuver> maneuvers_list;

        std::vector<IMC::PlanManeuver*>::const_iterator itr;
        itr = msg->maneuvers.begin();

        Math::Matrix waypoints(msg->maneuvers.size(), 2);

        unsigned i=0;
        // Iterate through plan maneuvers
        for (; itr != msg->maneuvers.end(); ++itr)
        {
          // For now just to GoTos.
          const IMC::Goto* m = static_cast<const IMC::Goto*>((*itr)->data.get());
          spew("LAAAT LOOON: %0.4f %0.4f", Angles::degrees(m->lat), Angles::degrees(m->lon));

          waypoints(i,0) = m->lat;
          waypoints(i,1) = m->lon;
          i=i+1;
        }
        checkGrounding(waypoints);
      }

      void
      checkGrounding(const Math::Matrix& waypoints_list)
      {
        std::vector<int> lookup_index;
        std::vector<double> lat_diff;
        std::vector<double> lon_diff;
        int occurrencies = std::count(lat.begin(),lat.end(),lat[0]); //assume fixed!

        for(unsigned int k=0;k<lat.size()/occurrencies; k++)
        {
          lat_diff.push_back(lat[k*occurrencies]);
          lookup_index.push_back(k*occurrencies);
        }

        //! Both are constant all along the map.
        m_lat_map_spacing = WGS84::distance(Angles::radians(lat_diff[0]), Angles::radians(lon[0]), 0.0, Angles::radians(lat_diff[1]), Angles::radians(lon[0]), 0.0);
        m_lon_map_spacing = WGS84::distance(Angles::radians(lat_diff[0]), Angles::radians(lon[0]), 0.0, Angles::radians(lat_diff[0]), Angles::radians(lon[1]), 0.0);

        spew("LAT SPACING: %f", m_lat_map_spacing);
        spew("LON SPACING: %f", m_lon_map_spacing);

        //spew("LATITUDES %0.4f %0.4f %0.4f %0.4f %d",lat_diff[0], lat_diff[1], lat_diff[2], lat_diff[3], lat_diff.size());
        //spew("INDEXES %d %d %d %d %d",lookup_index[0], lookup_index[1], lookup_index[2], lookup_index[3], lookup_index.size());

        for(int i=0; i<1; i++) //waypoints_list.rows()
        {
          double lat_d = Angles::degrees(waypoints_list(i,0));
          double lon_d = Angles::degrees(waypoints_list(i,1));

          double lat_prev_distance=10000.0;
          double lon_prev_distance=10000.0;
          double lat_distance;
          double lon_distance;
          unsigned int j;
          int a;

          for(j=0; j<lat_diff.size(); j++)
          {
            lat_distance = std::fabs(lat_d-lat_diff[j]);
            
            if(lat_distance<=lat_prev_distance)
              lat_prev_distance = lat_distance;
            else
              break; // here j-1 is the minimum!
          }

          //spew("CLOSEST LAT: %f", lat_diff[j-1]);
          //spew("INDEX LAT: %d", lookup_index[j-1]);
          //spew("FIRST LON: %f", lon[lookup_index[j-1]]);
          //spew("LAST LON: %f", lon[lookup_index[j-1]+occurrencies-1]);

          //Search for the closest longitude from lookup_index[j-1] to lookup_index[j-1+occurrencies].
          for(a=lookup_index[j-1]; a<(lookup_index[j-1]+occurrencies-1); a++)
          {
            lon_distance = std::fabs(lon_d-lon[a]);
            if(lon_distance<lon_prev_distance)
              lon_prev_distance = lon_distance;
            else
              break; // here a-1 is the minimum!
          }

          spew("QUERY LAT %0.4f LON %0.4f", Angles::degrees(waypoints_list(i,0)), Angles::degrees(waypoints_list(i,1)));
          spew("CLOSEST LOCATION: %0.4f %0.4f %d IN LINE %d", lon[a-1], lat[a-1], depth[a-1], a-1);
          spew("DISTANCE FROM QUERIED POINT: %f", WGS84::distance(waypoints_list(i,0), waypoints_list(i,1), 0, Angles::radians(lat[a-1]), Angles::radians(lon[a-1]), 0));

          //double bearing_to_closest, range_to_closest;
          //WGS84::getNEBearingAndRange(waypoints_list(i,0),waypoints_list(i,1),Angles::radians(lat[a-1]),Angles::radians(lon[a-1]),&bearing_to_closest,&range_to_closest);
          //spew("BEARING AND RANGE TO CLOSEST: %f %f", Angles::degrees(bearing_to_closest), range_to_closest);
          double north_to_closest, east_to_closest, down_to_closest;
          WGS84::displacement(waypoints_list(i,0),waypoints_list(i,1),0,Angles::radians(lat[a-1]),Angles::radians(lon[a-1]),0, &north_to_closest, &east_to_closest, &down_to_closest);
          spew("NORTH AND EAST TO CLOSEST: %f %f", north_to_closest, east_to_closest);

          double north_to_next, east_to_next, down_to_next;
          WGS84::displacement(waypoints_list(i,0),waypoints_list(i,1),0,waypoints_list(i+1,0),waypoints_list(i+1,1),0, &north_to_next, &east_to_next, &down_to_next);
          spew("NORTH AND EAST TO NEXT: %f %f", north_to_next, east_to_next);

          int quadrant_closest = returnQuadrant(north_to_closest, east_to_closest);
          int quadrant_next = returnQuadrant(north_to_next, east_to_next);

          spew("QUADRANT CLOSEST: %d", quadrant_closest);
          spew("QUADRANT NEXT: %d", quadrant_next);

          double north_closest_to_next, east_closest_to_next, down_closest_to_next;

          // ASSUME DISTANCE TO NEXT WP > DISTANCE TO CLOSEST!!!!

          std::vector<double> lat_close_to_line;
          std::vector<double> lon_close_to_line;
          std::vector<double> their_depth;

          switch(quadrant_closest)
          {
            case 2:
              if(quadrant_next==4) //! Search points +N and +E
              {
                spew("YUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU");
                // Both north and east displacements must be positive!
                WGS84::displacement(Angles::radians(lat[a-1]),Angles::radians(lon[a-1]),0,waypoints_list(i+1,0),waypoints_list(i+1,1),0, &north_closest_to_next, &east_closest_to_next, &down_closest_to_next);
                
                spew("NORTH CLOSEST TO NEXT: %f", north_closest_to_next);
                spew("EAST CLOSEST TO NEXT: %f", east_closest_to_next);

                if(std::fabs(east_closest_to_next)<=m_lon_map_spacing || north_closest_to_next<=m_lat_map_spacing) //Should not be.
                {
                  break;
                } else
                { // index before = higher LAT but lower LONG.
                  int number_of_lon_points = std::floor(std::fabs(east_closest_to_next)/m_lon_map_spacing); //(int)
                  int number_of_lat_points =  std::floor(north_closest_to_next/m_lat_map_spacing); //(int)

                  spew("HOW MANY LAT POINTS: %d", number_of_lat_points);
                  spew("HOW MANY LON POINTS: %d", number_of_lon_points);

                  int c;
                  int b;
                  double range;
                  double bearing_to_next_wp;
                  double bearing_to_possible_closest;
                  double bearing_prev_diff = 10000.0;

                  WGS84::getNEBearingAndRange(waypoints_list(i,0), waypoints_list(i,1),waypoints_list(i+1,0), waypoints_list(i+1,1),&bearing_to_next_wp,&range);

                  for(b=0; b<number_of_lat_points; b++)
                  {
                    for(c=0; c<number_of_lon_points; c++)
                    {
                      WGS84::getNEBearingAndRange(waypoints_list(i,0), waypoints_list(i,1),Angles::radians(lat_diff[j-2-b]),Angles::radians(lon[a-1-c]),&bearing_to_possible_closest,&range);
                      double bearing_diff = std::fabs(bearing_to_next_wp-bearing_to_possible_closest);

                      if(bearing_diff<bearing_prev_diff)
                        bearing_prev_diff = bearing_diff;
                      else
                        break; // closest point for LAT lat_diff[j-2-b] is lon[lookup_index[j-2+c-1]
                    }
                    lon_close_to_line.push_back(lon[a-1-c+1]);
                    lat_close_to_line.push_back(lat_diff[j-2-b]);
                    their_depth.push_back(depth[a-1-c+1]);

                    spew("CLOSEST LOCATION: LAT %f LON %f DEPTH %d", lat_diff[j-2-b], lon[a-1-c+1], depth[a-1-c+1]);
                  }
                }
              }
              break;
          }

        }
      }

      int
      returnQuadrant(int north, int east)
      {
        int quad;
        if(north>=0.0 && east>=0.0)
          quad = 1;
        if(north<0.0 && east>0.0)
          quad = 2;
        if(north<=0.0 && east<=0.0)
          quad = 3;
        if(north>0.0 && east<0.0)
          quad = 4;

        return quad;
      }

      //! Main loop.
      void
      onMain(void)
      {
        setEntityState(IMC::EntityState::ESTA_NORMAL, Status::CODE_ACTIVE);
        while (!stopping())
        {
          waitForMessages(1.0);
        }
      }
    };
  }
}

DUNE_TASK
