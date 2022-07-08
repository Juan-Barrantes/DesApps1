using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
//agregamos
using ProyAutoServicio_BL;
using ProyAutoServicio_BE;

namespace ProyAutoServicios_GUI
{
    public partial class Empleado03 : Form
    {
        EmpleadoBL objEmpleadoBL = new EmpleadoBL();
        EmpleadoBE objEmpleadoBE = new EmpleadoBE();

        public Empleado03()
        {
            InitializeComponent();
        }

        private int _Codigo;

        public int CodigoEmp
        {
            get { return _Codigo; }
            set { _Codigo = value; }
        }

        private void Empleado03_Load(object sender, EventArgs e)
        {
            try
            {
                objEmpleadoBE = objEmpleadoBL.ConsultarEmpleado(this.CodigoEmp);

                lblCod.Text = objEmpleadoBE.Cod_emp;                
                txtNombre.Text = objEmpleadoBE.Nom_prv;
                txtApellidos.Text = objEmpleadoBE.Ape_prv;
                txtDirec.Text = objEmpleadoBE.Direc_prv;
                mskTelef.Text = objEmpleadoBE.Telf_prv;
                cboCargo.Text = objEmpleadoBE.Cargo_prv; //-- editado
                txtEmail.Text = objEmpleadoBE.Email_prv;

                //cagamos ubigeo
                String id_Ubigeo = objEmpleadoBE.Id_Ubigeo;
                
                CargarUbigeo(id_Ubigeo.Substring(0, 2), id_Ubigeo.Substring(2, 2), id_Ubigeo.Substring(4, 2));

                int cod_age = objEmpleadoBE.CodAg_prv;
                CargarAgencia(cod_age);


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

        private void CargarAgencia(int CodAge)
        {
            AgenciaBL objAgenciaBL = new AgenciaBL();

            cboAgencia.DataSource = objAgenciaBL.Agencia_Direccion();
            cboAgencia.ValueMember = "codAgencia";
            cboAgencia.DisplayMember = "direccion";
            cboAgencia.SelectedValue = CodAge;
        }

        private void btnGuardarAct_Click(object sender, EventArgs e)
        {
            try
            {              

                if (mskTelef.MaskFull == false)
                {
                    throw new Exception("Complete el número telefónico");
                }

                objEmpleadoBE.Cod_emp = lblCod.Text;
                objEmpleadoBE.CodAg_prv = cboAgencia.SelectedIndex+1;
                objEmpleadoBE.Nom_prv = txtNombre.Text.Trim();
                objEmpleadoBE.Ape_prv = txtApellidos.Text.Trim();
                objEmpleadoBE.Direc_prv = txtDirec.Text.Trim();
                objEmpleadoBE.Telf_prv = mskTelef.Text.Trim();
                objEmpleadoBE.Email_prv = txtEmail.Text.Trim();
                objEmpleadoBE.Cargo_prv = cboCargo.SelectedValue.ToString();                

                objEmpleadoBE.Id_Ubigeo = cboDepartamento.SelectedValue.ToString() +
                                                              cboProvincia.SelectedValue.ToString() +
                                                              cboDistrito.SelectedValue.ToString();

                if (objEmpleadoBL.ActualizarEmpleado(objEmpleadoBE) == true)
                {
                    this.Close();
                }
                else
                {
                    throw new Exception("Registro NO actualizado, comuniquese con IT");
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show("Se ha producido el error: " + ex.Message);
            }
        }

        private void btnCancelarAct_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void cboDepartamento_SelectionChangeCommitted(object sender, EventArgs e)
        {
            CargarUbigeo(cboDepartamento.SelectedValue.ToString(), "01", "01");
        }

        private void cboProvincia_SelectionChangeCommitted(object sender, EventArgs e)
        {
            CargarUbigeo(cboDepartamento.SelectedValue.ToString(),
                               cboProvincia.SelectedValue.ToString(), "01");
        }

        private void cboAgencia_SelectionChangeCommitted(object sender, EventArgs e)
        {
            CargarAgencia(cboAgencia.SelectedIndex + 1);
        }
    }
}
