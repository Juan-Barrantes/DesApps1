using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ProyAutoServicio_BL;
using ProyAutoServicio_BE;

namespace ProyAutoServicios_GUI
{
    public partial class Servicio02 : Form
    {
        ServicioBL objProveedorBL = new ServicioBL();
        ServicioBE objServicioBE = new ServicioBE();

        public Servicio02()
        {
            InitializeComponent();
        }

        private void btnGrabar_Click(object sender, EventArgs e)
        {
            try
            {
                //Codifique
                // Cargamos las propiedades de la entidad de negocios...


                
                objServicioBE.tipoServ = cboTipoServicio.Text.Trim();
                objServicioBE.precio = txtPrecio.Text.Trim();
                objServicioBE.usureg = clsCredenciales.Usuario;


                if (objProveedorBL.InsertarServicios(objServicioBE) == true)
                {
                    this.Close();
                }
                else
                {
                    throw new Exception("No se inserto registro. Contacte con IT.");
                }


            }
            catch (Exception ex)
            {
                MessageBox.Show("Se ha producido el error: " + ex.Message);
            }
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
