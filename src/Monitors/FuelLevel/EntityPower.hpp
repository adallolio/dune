//***************************************************************************
// Copyright 2007-2014 Universidade do Porto - Faculdade de Engenharia      *
// Laboratório de Sistemas e Tecnologia Subaquática (LSTS)                  *
//***************************************************************************
// This file is part of DUNE: Unified Navigation Environment.               *
//                                                                          *
// Commercial Licence Usage                                                 *
// Licencees holding valid commercial DUNE licences may use this file in    *
// accordance with the commercial licence agreement provided with the       *
// Software or, alternatively, in accordance with the terms contained in a  *
// written agreement between you and Universidade do Porto. For licensing   *
// terms, conditions, and further information contact lsts@fe.up.pt.        *
//                                                                          *
// European Union Public Licence - EUPL v.1.1 Usage                         *
// Alternatively, this file may be used under the terms of the EUPL,        *
// Version 1.1 only (the "Licence"), appearing in the file LICENCE.md       *
// included in the packaging of this file. You may not use this work        *
// except in compliance with the Licence. Unless required by applicable     *
// law or agreed to in writing, software distributed under the Licence is   *
// distributed on an "AS IS" basis, WITHOUT WARRANTIES OR CONDITIONS OF     *
// ANY KIND, either express or implied. See the Licence for the specific    *
// language governing permissions and limitations at                        *
// https://www.lsts.pt/dune/licence.                                        *
//***************************************************************************
// Author: Pedro Calado                                                     *
//***************************************************************************

#ifndef MONITORS_FUELLEVEL_ENTITYPOWER_HPP_INCLUDED_
#define MONITORS_FUELLEVEL_ENTITYPOWER_HPP_INCLUDED_

// ISO C++ 98 headers.
#include <cstring>

// DUNE headers.
#include <DUNE/DUNE.hpp>

namespace Monitors
{
  namespace FuelLevel
  {
    using DUNE_NAMESPACES;

    //! Entity Power for Fuel Level
    class EntityPower
    {
    public:
      EntityPower(unsigned ent, float power = 0.0):
        m_ent(ent),
        m_power(power)
      { }

      unsigned
      getEntity(void) const
      {
        return m_ent;
      }

      float
      getPower(void) const
      {
        return m_power;
      }

    private:
      //! Entity number
      unsigned m_ent;
      //! Entity estimated power consumption
      float m_power;
    };

    bool
    operator<(const EntityPower& ep1,
              const EntityPower& ep2)
    {
      return ep1.getEntity() < ep2.getEntity();
    }

    bool
    operator==(const EntityPower& ep1,
               const EntityPower& ep2)
    {
      return ep1.getEntity() == ep2.getEntity();
    }
  }
}

#endif
