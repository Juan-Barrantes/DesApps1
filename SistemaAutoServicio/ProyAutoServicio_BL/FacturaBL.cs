using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//agregamos
using System.Data;
using ProyAutoServicio_ADO;
using ProyAutoServicio_BE;

namespace ProyAutoServicio_BL
{
    public class FacturaBL
    {
        FacturaADO objFacturaADO = new FacturaADO();

        public Boolean InsertarComprobante(FacturaBE objFacturaBE)
        {
            return objFacturaADO.InsertarComprobante(objFacturaBE);
        }

        public Boolean ActualizarComprobante(FacturaBE objFacturaBE)
        {
            return objFacturaADO.ActualizarComprobante(objFacturaBE);
        }
        public FacturaBE ConsultarComprobante(int strCod)
        {
            return objFacturaADO.ConsultarComprobante(strCod);
        }

        public Boolean InsertarDetalle_Servicio(FacturaBE objFacturaBE)
        {
            return objFacturaADO.InsertarDetalle_Servicio(objFacturaBE);
        }

        public DataTable ListarComprobante_Cliente_Servicio()
        {
            return objFacturaADO.ListarComprobante_Cliente_Servicio();
        }
    }
}
