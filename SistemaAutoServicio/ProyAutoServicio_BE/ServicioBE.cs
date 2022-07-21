using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProyAutoServicio_BE
{
    public class ServicioBE
    {
        private int mvarcodServicio;
        public int codServicio
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

        private String mvardir_ag;
        public String dir_ag
        {
            get { return mvardir_ag; }
            set { mvardir_ag = value; }
        }

        private double mvarprecio;
        public double precio
        {
            get { return mvarprecio; }
            set { mvarprecio = value; }
        }

        private String mvarusureg;
        public String usureg {
            get { return mvarusureg; }
            set { mvarusureg = value; }
        }

        private int mvarcodag;
        public int codag
        {
            get { return mvarcodag; }
            set { mvarcodag = value; }
        }

        private int mvartiempServ;
        public int temposerv
        {
            get { return mvartiempServ; }
            set { mvartiempServ = value; }
        }

        private String mvarusu_ultMod;
        public String Usu_UltMod
        {
            get { return mvarusu_ultMod; }
            set { mvarusu_ultMod = value; }
        }
    }
}
