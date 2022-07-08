using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProyAutoServicio_BE
{
    public class EmpleadoBE
    {
        //miebros privados
        private String mvarcodEmp_prv;
        private int mvarcodAg_prv;
        private String mvarnomEmp_prv;
        private String mvarapeEmp_prv;
        private String mvarIdUbi_prv;
        private String mvardirecEmp_prv;
        private String mvartelf_prv;
        private String mvarSueldoEmp;
        private DateTime mvarfecini;
        private DateTime mvarfecnac;
        private String mvarCargo;
        private String mvarEmail;
        private String mvarusu_registro;
        private DateTime mvarfec_registro;
        private DateTime mvarfec_ult_mod;
        private String mvarusu_ult_mod;
        private String mvarid_ubigeo;
        public String Id_Ubigeo
        {
            get { return mvarid_ubigeo; }
            set { mvarid_ubigeo = value; }
        }

        //propiedades
        public String Cod_emp
        {
            get { return mvarcodEmp_prv; }
            set { mvarcodEmp_prv = value; }
        }
        public int CodAg_prv
        {
            get { return mvarcodAg_prv; }
            set { mvarcodAg_prv = value; }
        }
        public String Nom_prv
        {
            get { return mvarnomEmp_prv; }
            set { mvarnomEmp_prv = value; }
        }       
        public String Ape_prv
        {
            get { return mvarapeEmp_prv; }
            set { mvarapeEmp_prv = value; }
        }        
        public String IdUbi_prv
        {
            get { return mvarIdUbi_prv; }
            set { mvarIdUbi_prv = value; }
        }
        public String Direc_prv
        {
            get { return mvardirecEmp_prv; }
            set { mvardirecEmp_prv = value; }
        }
        public String Telf_prv
        {
            get { return mvartelf_prv; }
            set { mvartelf_prv = value; }
        }
        public String Sueldo_prv
        {
            get { return mvarSueldoEmp; }
            set { mvarSueldoEmp = value; }
        }
        public DateTime fecIni
        {
            get { return mvarfecini; }
            set { mvarfecini = value; }
        }
        public DateTime fecNac
        {
            get { return mvarfecnac; }
            set { mvarfecnac = value; }
        }
        public String Cargo_prv
        {
            get { return mvarCargo; }
            set { mvarCargo = value; }
        }        
        public String Email_prv
        {
            get { return mvarEmail; }
            set { mvarEmail = value; }
        }        
        public String Usu_Registro
        {
            get { return mvarusu_registro; }
            set { mvarusu_registro = value; }
        }
        public DateTime Fec_Registro
        {
            get { return mvarfec_registro; }
            set { mvarfec_registro = value; }
        }
        public DateTime Fec_Ult_Mod
        {
            get { return mvarfec_ult_mod; }
            set { mvarfec_ult_mod = value; }
        }
        public String Usu_Ult_Mod
        {
            get { return mvarusu_ult_mod; }
            set { mvarusu_ult_mod = value; }
        }
    }
}
