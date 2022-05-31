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

        private String mvarmodo;
        public String modo
        {
            get { return mvarmodo; }
            set { mvarmodo = value; }
        }
    }
}
