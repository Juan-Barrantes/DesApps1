using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using ProyAutoServicio_ADO;
using ProyAutoServicio_BE;

namespace ProyAutoServicio_BL
{
    public class ServicioBL
    {
        ServicioADO objServicioADO = new ServicioADO();

        public Boolean InsertarServicios(ServicioBE objServicioBE)
        {
            return objServicioADO.InsertarServicios(objServicioBE);
        }
        public Boolean ActualizarServicios(ServicioBE objProveedorBE)
        {
            return objServicioADO.ActualizarServicios(objProveedorBE);
        }
        public Boolean EliminarServicios(String strcod)
        {
            return objServicioADO.EliminarServicios(strcod);
        }

        public ServicioBE ConsultarServicios(String strcod)
        {
            return objServicioADO.ConsultarServicios(strcod);
        }

        public DataTable ListarServicios()
        {
            return objServicioADO.ListarServicios();
        }

        public DataTable ServicioPrecio()
        {
            return objServicioADO.ServicioPrecio();
        }

    }

}
