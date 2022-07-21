using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProyAutoServicio_BE
{
    public class FacturaBE
    {
        private String mvardoc_ident;
        public String doc_ident
        {
            get { return mvardoc_ident; }
            set { mvardoc_ident = value; }
        }
        private String mvartipo_serv;
        public String tipo_serv
        {
            get { return mvartipo_serv; }
            set { mvartipo_serv = value; }
        }

        private String mvarnombre;
        public String nombre
        {
            get { return mvarnombre; }
            set { mvarnombre = value; }
        }

        private String mvarape;
        public String apellido
        {
            get { return mvarape; }
            set { mvarape = value; }
        }
        private DateTime mvarfechaEmision;
        public DateTime fec_ini
        {
            get { return mvarfechaEmision; }
            set { mvarfechaEmision = value; }
        }

        private String mvarusu_reg;
        public String usu_reg
        {
            get { return mvarusu_reg; }
            set { mvarusu_reg = value; }
        }

        private String mvarcod_serv;
        public String cod_serv
        {
            get { return mvarcod_serv; }
            set { mvarcod_serv = value; }
        }

        private int mvarcod_compr;
        public int cod_compr
        {
            get { return mvarcod_compr; }
            set { mvarcod_compr = value; }
        }

        private int varestado;
        public int estado
        {
            get { return varestado; }
            set { varestado = value; }
        }

        private String mvarusu_ult_mod;
        public String usu_ult_mod
        {
            get { return mvarusu_ult_mod; }
            set { mvarusu_ult_mod = value; }
        }
    }
}
