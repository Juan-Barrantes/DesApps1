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
        ClienteBL objProveedorBL = new ClienteBL();
        ClienteBE objProveedorBE = new ClienteBE();
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
                objProveedorBE = objProveedorBL.ConsultarProveedor(this._cod);

                txtDocIdent.Text = objProveedorBE.docIdentidad;
                txtTipoDoc.Text = objProveedorBE.tipoDocumento;
                txtApe.Text = objProveedorBE.apellidos;
                txtNom.Text = objProveedorBE.nombre;
                textDir.Text = objProveedorBE.direccion;
                textTel.Text = objProveedorBE.telefono;

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
                if (txtDocIdent.Text.Trim() == String.Empty)
                {
                    throw new Exception("El documento de identidad es obligatorio");
                }

                objProveedorBE.docIdentidad = txtDocIdent.Text.Trim();
                objProveedorBE.tipoDocumento = txtTipoDoc.Text.Trim();
                objProveedorBE.apellidos = txtApe.Text.Trim();
                objProveedorBE.nombre = txtNom.Text.Trim();
                objProveedorBE.direccion = textDir.Text.Trim();
                objProveedorBE.telefono = textTel.Text.Trim();

                if (objProveedorBL.ActualizarProveedor(objProveedorBE) == true)
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
