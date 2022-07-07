using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
//agregamos - GUI
using ProyAutoServicio_BL;
using ProyAutoServicio_BE;

namespace ProyAutoServicios_GUI
{
    public partial class Empleado02 : Form
    {
        EmpleadoBL objEmpleadoBL = new EmpleadoBL();
        EmpleadosBE objEmpleadosBE = new EmpleadosBE();

        public Empleado02()
        {
            InitializeComponent();
        }

        private void Empleado02_Load(object sender, EventArgs e)
        {
            try
            {
                CargarUbigeo("14", "01", "01");
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

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtCodAg.Text.Trim() == String.Empty)
                {
                    throw new Exception("Ingrese codigo de Agencia");
                }

                if (mskTelef.MaskFull == false)
                {
                    throw new Exception("Llene el telefono con 9 digitos");
                }

                objEmpleadosBE.Cod_emp = "";
                objEmpleadosBE.CodAg_prv = txtCodAg.Text.Trim();
                objEmpleadosBE.Nom_prv = txtNombre.Text.Trim();
                objEmpleadosBE.Ape_prv = txtApellidos.Text.Trim();
                objEmpleadosBE.Direc_prv = txtDirec.Text.Trim();
                objEmpleadosBE.Telf_prv = mskTelef.Text;

                if (objEmpleadoBL.InsertarEmpleado(objEmpleadosBE) == true)
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
                MessageBox.Show("Se ha producido el error: " + ex.Message);
            }
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        
    }
}
