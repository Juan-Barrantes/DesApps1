using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProyAutoServicio_BE
{
    public class ClienteBE
    {
        private String mvardocIdentidad;
        public String docIdentidad
        {
            get { return mvardocIdentidad; }
            set { mvardocIdentidad = value; }
        }
        private String mvartipoDocumento;
        public String tipoDocumento
        {
            get { return mvartipoDocumento; }
            set { mvartipoDocumento = value; }
        }
        private String mvarapellidos;
        public String apellidos
        {
            get { return mvarapellidos; }
            set { mvarapellidos = value; }
        }

        private String mvarnombre;
        public String nombre
        {
            get { return mvarnombre; }
            set { mvarnombre = value; }
        }

        private String mvaridUbi;
        public String IdUbi
        {
            get { return mvaridUbi; }
            set { mvaridUbi = value; }
        }

        private String mvarDepartamento;
        public String Departamento
        {
            get { return mvarDepartamento; }
            set { mvarDepartamento = value; }
        }

        private String mvarProvincia;
        public String Provincia
        {
            get { return mvarProvincia; }
            set { mvarProvincia = value; }
        }

        private String mvarDistrito;
        public String Distrito
        {
            get { return mvarDistrito; }
            set { mvarDistrito = value; }
        }


        private String mvardireccion;
        public String direccion
        {
            get { return mvardireccion; }
            set { mvardireccion = value; }
        }

        private String mvartelefono;
        public String telefono
        {
            get { return mvartelefono; }
            set { mvartelefono = value; }
        }

        private String mvarusu_ult_mod;
        public String Usu_UltMod
        {
            get { return mvarusu_ult_mod; }
            set { mvarusu_ult_mod = value; }
        }

        private int mvarEst_cli;
        public int est_cli
        {
            get { return mvarEst_cli; }
            set { mvarEst_cli = value; }
        }

        private String mvarusureg;
        public String usureg
        {
            get { return mvarusureg; }
            set { mvarusureg = value; }
        }

        private String mvarmodo;
        public String modo
        {
            get { return mvarmodo; }
            set { mvarmodo = value; }
        }
    }
}
