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
        ClienteBL objClienteBL = new ClienteBL();
        ClienteBE objClienteBE = new ClienteBE();
        public Cliente02()
        {
            InitializeComponent();
        }

        private void Cliente02_Load(object sender, EventArgs e)
        {
            try
            {
                CargarUbigeo("14", "01", "01");                
                cboTipoDoc.SelectedIndex = 0;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error : " + ex.Message);
            }
        }
        private void CargarUbigeo(String IdDepa, String IdProv, String IdDist)
        {
            UbigeoBL objUbigeoBL = new UbigeoBL();

            cboDepartamento.DataSource = objUbigeoBL.Ubigeo_Departamentos();
            cboDepartamento.ValueMember = "IdDepa";
            cboDepartamento.DisplayMember = "Departamento";
            cboDepartamento.SelectedValue = IdDepa;

            cboProvincia.DataSource = objUbigeoBL.Ubigeo_ProvinciasDepartamento(IdDepa);
            cboProvincia.ValueMember = "IdProv";
            cboProvincia.DisplayMember = "Provincia";
            cboProvincia.SelectedValue = IdProv;

            cboDistrito.DataSource = objUbigeoBL.Ubigeo_DistritosProvinciaDepartamento(IdDepa, IdProv);
            cboDistrito.ValueMember = "IdDist";
            cboDistrito.DisplayMember = "Distrito";
            cboDistrito.SelectedValue = IdDist;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                
                if(txtDoc.Text.Trim() == String.Empty)
                {
                    throw new Exception("Ingrerse número de documento");
                }
                if (mskTelf.MaskFull == false) // Si no llenaste la mascara
                {
                    throw new Exception("Ingrese 9 digitos para teléfono");

                }

                if (cboTipoDoc.SelectedIndex == 0)
                {
                    MessageBox.Show("Elija un tipo de documento");
                }
                
                objClienteBE.docIdentidad = txtDoc.Text.Trim();
                objClienteBE.tipoDocumento = cboTipoDoc.SelectedItem.ToString();//txtTipoDoc.Text.Trim();
                objClienteBE.apellidos = txtApe.Text.Trim();
                objClienteBE.nombre = txtNom.Text.Trim();
                objClienteBE.direccion = txtDir.Text.Trim();
                objClienteBE.telefono = mskTelf.Text.Trim();
                
                if(chkEstado.Checked == true)
                {
                    objClienteBE.est_cli = 1;
                }
                else
                {
                    objClienteBE.est_cli = 0;
                }


                objClienteBE.IdUbi = cboDepartamento.SelectedValue.ToString() +
                                                                cboProvincia.SelectedValue.ToString() +
                                                                cboDistrito.SelectedValue.ToString();

                objClienteBE.usureg = clsCredenciales.Usuario;

                if (objClienteBL.InsertarCliente(objClienteBE) == true)
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
                MessageBox.Show("Se ha producido el error: ._. " + ex.Message);
            }

        }

      
    }
}
