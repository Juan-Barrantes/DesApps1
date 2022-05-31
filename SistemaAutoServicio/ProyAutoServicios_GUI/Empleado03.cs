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
        EmpleadosBE objEmpleadoBE = new EmpleadosBE();

        public Empleado03()
        {
            InitializeComponent();
        }

        private String _Codigo;

        public String Codigo
        {
            get { return _Codigo; }
            set { _Codigo = value; }
        }

        private void Empleado03_Load(object sender, EventArgs e)
        {
            try
            {
                objEmpleadoBE = objEmpleadoBL.ConsultarEmpleado(this.Codigo);
                lblCod.Text = objEmpleadoBE.Cod_prv;
                txtCodAg.Text = objEmpleadoBE.CodAg_prv;
                txtNombre.Text = objEmpleadoBE.Nom_prv;
                txtApellidos.Text = objEmpleadoBE.Ape_prv;
                txtDirec.Text = objEmpleadoBE.Direc_prv;
                mskTelef.Text = objEmpleadoBE.Telf_prv;




            }
            catch (Exception ex)
            {
                MessageBox.Show("Error : " + ex.Message);
            }
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtCodAg.Text.Trim() == String.Empty)
                {
                    throw new Exception("El código de agencia es obligatorio");
                }

                if (mskTelef.MaskFull == false)
                {
                    throw new Exception("Complete el número telefónico");
                }

                objEmpleadoBE.Cod_prv = lblCod.Text;
                objEmpleadoBE.CodAg_prv = txtCodAg.Text.Trim();
                objEmpleadoBE.Nom_prv = txtNombre.Text.Trim();
                objEmpleadoBE.Ape_prv = txtApellidos.Text.Trim();
                objEmpleadoBE.Direc_prv = txtDirec.Text.Trim();
                objEmpleadoBE.Telf_prv = mskTelef.Text.Trim();

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

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
