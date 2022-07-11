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
    public partial class Servicio03 : Form
    {
        ServicioBL objProveedorBL = new ServicioBL();
        ServicioBE objProveedorBE = new ServicioBE();

        public Servicio03()
        {
            InitializeComponent();
        }

        private String _Codigo;

        public String Codigo
        {
            get { return _Codigo; }
            set { _Codigo = value; }

        }

        private void Servicio03_Load(object sender, EventArgs e)
        {
            try
            {               
                objProveedorBE = objProveedorBL.ConsultarServicios(this.Codigo);

                txtCS.Text = objProveedorBE.codServicio.ToString();
                cboTipoServicio.Text = objProveedorBE.tipoServ;
                txtPrecio.Text = objProveedorBE.precio.ToString();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error : " + ex.Message);
            }
        }

        private void btnGrabar_Click(object sender, EventArgs e)
        {
            try
            {
                objProveedorBE.codServicio = txtCS.Text.Trim(); ;
                objProveedorBE.tipoServ = cboTipoServicio.Text.Trim();
                objProveedorBE.precio = txtPrecio.Text.Trim();
                objProveedorBE.Usu_UltMod = clsCredenciales.Usuario;

                if (objProveedorBL.ActualizarServicios(objProveedorBE) == true)
                {
                    this.Close();
                }
                else
                {
                    throw new Exception("No se actualizó el registro. Contacte con IT.");
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
