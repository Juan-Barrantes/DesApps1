using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//agregamos:
using System.Data;
using ProyAutoServicio_ADO;
using ProyAutoServicio_BE;

namespace ProyAutoServicio_BL
{
    public class ClienteBL
    {
        ClienteADO objProveedorADO = new ClienteADO();

        public Boolean InsertarCliente(ClienteBE objProveedorBE)
        {
            return objProveedorADO.InsertarCliente(objProveedorBE);
        }
        public Boolean ActualizarCliente(ClienteBE objProveedorBE)
        {
            return objProveedorADO.ActualizarCliente(objProveedorBE);
        }
        public Boolean EliminarCliente(String strcod)
        {
            return objProveedorADO.EliminarCliente(strcod);
        }

        public ClienteBE ConsultarCliente(String strcod)
        {
            return objProveedorADO.ConsultarCliente(strcod);
        }

        public DataTable ListarCliente()
        {
            return objProveedorADO.ListarCliente();
        }

    }
}
