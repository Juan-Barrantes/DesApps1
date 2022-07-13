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
        ServicioBL objServicioBL = new ServicioBL();
        ServicioBE objServicioBE = new ServicioBE();

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
                objServicioBE = objServicioBL.ConsultarServicios(this.Codigo);

                txtCS.Text = objServicioBE.codServicio.ToString();
                txtTipoServ.Text = objServicioBE.tipoServ.ToString();
                mskPrecio.Text = objServicioBE.precio.ToString();
                mskTiempoEst.Text = objServicioBE.temposerv.ToString();

                int cod_age = objServicioBE.codag;
                CargarAgencia(cod_age);

            }
            catch (Exception ex)
            {
                MessageBox.Show("Error : load-servicio == " + ex.Message);
            }
        }

        private void CargarAgencia(int CodAge)
        {
            AgenciaBL objAgenciaBL = new AgenciaBL();

            cboAgencia.DataSource = objAgenciaBL.Agencia_Direccion();
            cboAgencia.ValueMember = "codAgencia";
            cboAgencia.DisplayMember = "direccion";
            cboAgencia.SelectedValue = CodAge;
        }

        private void btnGrabar_Click(object sender, EventArgs e)
        {
            try
            {
                objServicioBE.tipoServ = txtTipoServ.Text.Trim();
                objServicioBE.precio = Convert.ToInt16(mskPrecio);
                objServicioBE.temposerv = Convert.ToInt16(mskTiempoEst);
                objServicioBE.codag = cboAgencia.SelectedIndex + 1;
                objServicioBE.Usu_UltMod = clsCredenciales.Usuario;

                if (objServicioBL.ActualizarServicios(objServicioBE) == true)
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

        private void cboAgencia_SelectionChangeCommitted(object sender, EventArgs e)
        {
            CargarAgencia(cboAgencia.SelectedIndex+1);
        }
    }
}
