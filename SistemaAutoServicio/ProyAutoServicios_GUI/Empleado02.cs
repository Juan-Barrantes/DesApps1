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

        }

        private void button1_Click(object sender, EventArgs e)
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

                objEmpleadosBE.Cod_prv = "";
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

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
