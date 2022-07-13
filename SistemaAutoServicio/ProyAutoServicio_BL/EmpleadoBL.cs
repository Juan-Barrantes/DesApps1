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
    public class EmpleadoBL
    {
        EmpleadoADO objEmpleadoAdo = new EmpleadoADO();

        public Boolean InsertarEmpleado(EmpleadoBE objEmpleadosBE)
        {
            return objEmpleadoAdo.InsertarEmpleado(objEmpleadosBE);
        }
        public Boolean ActualizarEmpleado(EmpleadoBE objEmpleadosBE)
        {
            return objEmpleadoAdo.ActualizarEmpleado(objEmpleadosBE);
        }
        public Boolean EliminarEmpleado(String strcod)
        {
            return objEmpleadoAdo.EliminarEmpleado(strcod);
        }

        public EmpleadoBE ConsultarEmpleado(int strCod)
        {
            return objEmpleadoAdo.ConsultarEmpleado(strCod);
        }

        public DataTable ListarEmpleados()
        {
            return objEmpleadoAdo.ListarEmpleados();
        }

        public DataTable ListarEmpleadosCod(int codEmp)
        {
            return objEmpleadoAdo.ListarEmpleadosCod(codEmp);
        }
    }
}
