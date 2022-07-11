using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProyAutoServicio_BE
{
    public class ServicioBE
    {
        private String mvarcodServicio;
        public String codServicio
        {
            get { return mvarcodServicio; }
            set { mvarcodServicio = value; }
        }
        private String mvartipoServ;
        public String tipoServ
        {
            get { return mvartipoServ; }
            set { mvartipoServ = value; }
        }
        private String mvarprecio;
        public String precio
        {
            get { return mvarprecio; }
            set { mvarprecio = value; }
        }

        private String mvarusureg;
        public String usureg {
            get { return mvarusureg; }
            set { mvarusureg = value; }
        }

        private String mvarusu_ultMod;
        public String Usu_UltMod
        {
            get { return mvarusu_ultMod; }
            set { mvarusu_ultMod = value; }
        }
    }
}
