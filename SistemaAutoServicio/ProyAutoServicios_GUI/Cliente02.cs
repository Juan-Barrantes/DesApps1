using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ProyAutoServicio_BE;
using ProyAutoServicio_BL;

namespace ProyAutoServicios_GUI
{
    
    public partial class Cliente02 : Form
    {
        ClienteBL objProveedorBL = new ClienteBL();
        ClienteBE objProveedorBE = new ClienteBE();
        public Cliente02()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                objProveedorBE.docIdentidad = txtDoc.Text.Trim();
                objProveedorBE.tipoDocumento = txtTipoDoc.Text.Trim();
                objProveedorBE.apellidos = txtApe.Text.Trim();
                objProveedorBE.nombre = txtNom.Text.Trim();
                objProveedorBE.direccion = txtDir.Text.Trim();
                objProveedorBE.telefono = txtTel.Text.Trim();

                if (objProveedorBL.InsertarProveedor(objProveedorBE) == true)
                {
                    this.Close();
                }
                else
                {
                    throw new Exception("No se registró el registro. Contacte con IT.");
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show("Se ha producido el error: " + ex.Message);
            }

        }
    }
}
