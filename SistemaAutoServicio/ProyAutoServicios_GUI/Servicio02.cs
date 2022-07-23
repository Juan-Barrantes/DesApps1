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
        ServicioBL objServicioBL = new ServicioBL();
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

                objServicioBE.tipoServ = txtServicio.Text.ToString();
                objServicioBE.precio = Convert.ToDouble( txtPrecio.Text.Trim());
                objServicioBE.codag = Convert.ToInt16(cboAgencia.SelectedIndex + 1);
                objServicioBE.temposerv = Convert.ToInt16( mskTiempoServ.Text.ToString());
                objServicioBE.usureg = clsCredenciales.Usuario;

              /* MessageBox.Show("tipo servicio:" + txtServicio.Text.ToString() + "\n precio: " + txtPrecio.Text.Trim() +
                    "\n cod agencia: " + cboAgencia.SelectedIndex + 1 +
                    "\n tiempo servicio: " + mskTiempoServ.Text.ToString() +
                    "\n usuario :" + clsCredenciales.Usuario);

                MessageBox.Show(objServicioBE.tipoServ + "\n " + objServicioBE.precio + "\n " + objServicioBE.temposerv +
                    "\n " + objServicioBE.codag + "\n " + objServicioBE.usureg);  */

                Console.WriteLine("tipo servicio: "+objServicioBE.tipoServ.GetType());
                Console.WriteLine("precio: " + objServicioBE.precio.GetType());
                Console.WriteLine("cod agencia: " + objServicioBE.codag.GetType());
                Console.WriteLine("tiempo servicio: " + objServicioBE.temposerv.GetType());
                Console.WriteLine("usuario q registra: " + objServicioBE.usureg.GetType());

                if (objServicioBL.InsertarServicios(objServicioBE) ==true)
                  {
                      this.Close();
                  }
                  else
                  {
                      throw new Exception("Registro NO insertado, comuniquese con IT");
                  }
                 


            }
            catch (Exception ex)
            {
                MessageBox.Show("Se ha producido el error --> : " + ex.Message);
            }
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void Servicio02_Load(object sender, EventArgs e)
        {
            CargarAgencia(1);
        }

        private void CargarAgencia(int CodAge)
        {
            AgenciaBL objAgenciaBL = new AgenciaBL();

            cboAgencia.DataSource = objAgenciaBL.Agencia_Direccion();
            cboAgencia.ValueMember = "codAgencia";
            cboAgencia.DisplayMember = "direccion";
            cboAgencia.SelectedValue = CodAge;
        }
    }
}
