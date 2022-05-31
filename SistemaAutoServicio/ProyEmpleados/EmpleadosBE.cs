using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProyEmpleados
{
    public class EmpleadosBE
    {
        private String mvarcod_prv;
        public String Cod_prv
        {
            get { return mvarcod_prv; }
            set { mvarcod_prv = value; }
        }

        private String mvarcodAg_prv;
        public String CodAg_prv
        {
            get { return mvarcodAg_prv; }
            set { mvarcodAg_prv = value; }
        }

        private String mvarnom_prv;
        public String Nom_prv
        {
            get { return mvarnom_prv; }
            set { mvarnom_prv = value; }
        }

        private String mvarape_prv;
        public String Ape_prv
        {
            get { return mvarape_prv; }
            set { mvarape_prv = value; }
        }

        private String mvardirec_prv;
        public String Direc_prv
        {
            get { return mvardirec_prv; }
            set { mvardirec_prv = value; }
        }

        private String mvartelf_prv;
        public String Telf_prv
        {
            get { return mvartelf_prv; }
            set { mvartelf_prv = value; }
        }


    }
}
