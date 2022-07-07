using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//
using ProyAutoServicio_ADO;
using ProyAutoServicio_BE;
using System.Data;

namespace ProyAutoServicio_BL
{
    public class AgenciaBL
    {
        AgenciaADO objAgenciaADO = new AgenciaADO();

        public DataTable Agencia_Direccion()
        {
            return objAgenciaADO.Agencia_Direccion();
        }
    }
}
