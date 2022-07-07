using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
// Agregamos los using...
using ProyAutoServicio_ADO;
using ProyAutoServicio_BE;
using System.Data;

namespace ProyAutoServicio_BL
{
    public class UbigeoBL
    {

        UbigeoADO objUbigeoADO = new UbigeoADO();

        public DataTable Ubigeo_Departamentos()
        {
            return objUbigeoADO.Ubigeo_Departamentos();
        }
        public DataTable Ubigeo_ProvinciasDepartamento(String strIdDepartamento)
        {
            return objUbigeoADO.Ubigeo_ProvinciasDepartamento(strIdDepartamento);
        }
        public DataTable Ubigeo_DistritosProvinciaDepartamento(String strIdDepartamento, String strIdProvincia)
        {
            return objUbigeoADO.Ubigeo_DistritosProvinciaDepartamento(strIdDepartamento, strIdProvincia);
        }
    }
}
