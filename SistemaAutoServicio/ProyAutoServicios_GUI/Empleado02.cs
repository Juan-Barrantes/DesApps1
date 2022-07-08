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
        EmpleadoBE objEmpleadoBE = new EmpleadoBE();

        public Empleado02()
        {
            InitializeComponent();
        }

        private void Empleado02_Load(object sender, EventArgs e)
        {
            try
            {
                CargarUbigeo("14", "01", "01");
                CargarAgencia(1);
                cboCargo.SelectedIndex = 0;
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


            private void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
              
                if (mskTelef.MaskFull == false)
                {
                    throw new Exception("Llene el telefono con 9 digitos");
                }
                /*if (mskFecIni.MaskFull == false)
                {
                    throw new Exception("Ingrese la fecha con el formato YYYY/MM/DD");
                } */
                if(cboCargo.SelectedIndex == 0)
                {
                    throw new Exception("Seleccione un cargo");
                }

                //objEmpleadosBE.Cod_emp = "";
                objEmpleadoBE.CodAg_prv = cboAgencia.SelectedIndex+1;
                objEmpleadoBE.Nom_prv = txtNombre.Text.Trim();
                objEmpleadoBE.Ape_prv = txtApellidos.Text.Trim();
                objEmpleadoBE.Direc_prv = txtDirec.Text.Trim();
                objEmpleadoBE.Telf_prv = mskTelef.Text;
                objEmpleadoBE.fecIni = Convert.ToDateTime(dtpFecIni.Text);
                objEmpleadoBE.fecNac = Convert.ToDateTime(dtpFecNac.Text);
                
                int indexCarg = cboCargo.SelectedIndex;
                if(indexCarg == 0)
                {
                    MessageBox.Show("Elija un cargo");
                }
                else
                {
                    objEmpleadoBE.Cargo_prv = cboCargo.SelectedItem.ToString();
                }      

                objEmpleadoBE.Email_prv = txtEmail.Text.Trim();
             
                objEmpleadoBE.IdUbi_prv = cboDepartamento.SelectedValue.ToString() +
                                                                cboProvincia.SelectedValue.ToString() +
                                                                cboDistrito.SelectedValue.ToString();

                objEmpleadoBE.Usu_Registro = "userTest"; //ClsCredenciales.Usuario; 

                if (objEmpleadoBL.InsertarEmpleado(objEmpleadoBE) == true)
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

        private void cboDepartamento_SelectionChangeCommitted(object sender, EventArgs e)
        {
            // Refrescamos 
            CargarUbigeo(cboDepartamento.SelectedValue.ToString(), "01", "01");

        }

        private void cboProvincia_SelectionChangeCommitted(object sender, EventArgs e)
        {
            // Refrescamos 
            CargarUbigeo(cboDepartamento.SelectedValue.ToString(), cboProvincia.SelectedValue.ToString(), "01");

        }

        private void cboAgencia_SelectionChangeCommitted(object sender, EventArgs e)
        {
            CargarAgencia(cboAgencia.SelectedIndex+1);
        }
    }
}
