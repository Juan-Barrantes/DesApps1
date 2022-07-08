using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProyAutoServicio_BE
{
    public class UsuarioBE
    {
        private String mvarname_usuario;
        private String mvarpass_usuario;              
        private DateTime mvarfec_registro;
        private String mvarusu_registro;
        private String mvarcargo_usuario;
        private int mvarnivel_usuario;

        //Propiedades
        public String Name_Usuario
        {
            get { return mvarname_usuario; }
            set { mvarname_usuario = value; }
        }
        public String Pass_Usuario
        {
            get { return mvarpass_usuario; }
            set { mvarpass_usuario = value; }
        }
        public DateTime Fec_Registro
        {
            get { return mvarfec_registro; }
            set { mvarfec_registro = value; }
        }
        public String Usu_Registro
        {
            get { return mvarusu_registro; }
            set { mvarusu_registro = value; }
        }

        public String Cargo_Usuario
        {
            get { return mvarcargo_usuario; }
            set { mvarcargo_usuario = value; }
        }
        public int Nivel_Usuario
        {
            get { return mvarnivel_usuario; }
            set { mvarnivel_usuario = value; }
        }

    }
}
