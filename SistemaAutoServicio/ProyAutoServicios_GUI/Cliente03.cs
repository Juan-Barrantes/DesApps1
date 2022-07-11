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
    public partial class Cliente03 : Form
    {
        ClienteBL objClienteBL = new ClienteBL();
        ClienteBE objClienteBE = new ClienteBE();
        public Cliente03()
        {
            InitializeComponent();
        }

        private String _cod;
        public String docIdentidad
        {
            get { return _cod; }
            set { _cod = value; }

        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void Cliente03_Load(object sender, EventArgs e)
        {
            try
            {
                // Codifique...
                //Mostramos los datos del proveedor que se desea actualizar...
                objClienteBE = objClienteBL.ConsultarCliente(this._cod);

                txtDocIdent.Text = objClienteBE.docIdentidad;
                txtTipoDoc.Text = objClienteBE.tipoDocumento;
                txtApe.Text = objClienteBE.apellidos;
                txtNom.Text = objClienteBE.nombre;
                textDir.Text = objClienteBE.direccion;
                mskTelf.Text = objClienteBE.telefono;

                if(objClienteBE.est_cli == 1)
                {
                    chkEstado.Checked = true;
                }

                String id_Ubigeo = objClienteBE.IdUbi;

                CargarUbigeo(id_Ubigeo.Substring(0, 2), id_Ubigeo.Substring(2, 2), id_Ubigeo.Substring(4, 2));
                


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

        private void btnGrabar_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtDocIdent.Text.Trim() == String.Empty)
                {
                    throw new Exception("El documento de identidad es obligatorio");
                }

                objClienteBE.docIdentidad = txtDocIdent.Text.Trim();
                objClienteBE.tipoDocumento = txtTipoDoc.Text.Trim();
                objClienteBE.apellidos = txtApe.Text.Trim();
                objClienteBE.nombre = txtNom.Text.Trim();
                objClienteBE.direccion = textDir.Text.Trim();
                objClienteBE.telefono = mskTelf.Text.Trim();
                objClienteBE.Usu_UltMod = clsCredenciales.Usuario;
                if (chkEstado.Checked == true)
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


                if (objClienteBL.ActualizarCliente(objClienteBE) == true)
                {
                    this.Close();
                }
                else
                {
                    throw new Exception("No se actualizo el registro. Contacte con IT.");
                }


            }
            catch (Exception ex)
            {
                MessageBox.Show("Se ha producido el error: " + ex.Message);
            }
        }


    }
}
