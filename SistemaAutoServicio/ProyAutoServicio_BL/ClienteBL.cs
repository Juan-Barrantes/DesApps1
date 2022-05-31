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

        public Boolean InsertarProveedor(ClienteBE objProveedorBE)
        {
            return objProveedorADO.InsertarProveedor(objProveedorBE);
        }
        public Boolean ActualizarProveedor(ClienteBE objProveedorBE)
        {
            return objProveedorADO.ActualizarProveedor(objProveedorBE);
        }
        public Boolean EliminarProveedor(String strcod)
        {
            return objProveedorADO.EliminarProveedor(strcod);
        }

        public ClienteBE ConsultarProveedor(String strcod)
        {
            return objProveedorADO.ConsultarProveedor(strcod);
        }

        public DataTable ListarProveedor()
        {
            return objProveedorADO.ListarProveedor();
        }

    }
}
