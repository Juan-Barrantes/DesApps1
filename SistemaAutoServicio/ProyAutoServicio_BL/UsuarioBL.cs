using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//
using ProyAutoServicio_ADO;
using ProyAutoServicio_BE;

namespace ProyAutoServicio_BL
{
    public class UsuarioBL
    {
        UsuarioADO objUsuarioADO = new UsuarioADO();

        public UsuarioBE ConsultarUsuario(String strLogin)
        {
            return objUsuarioADO.ConsultarUsuario(strLogin);
        }
    }
}
