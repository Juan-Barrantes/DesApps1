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


//
namespace ProyParcial
{
    public partial class Empleado01 : Form
    {
        EmpleadoBL objEmpleadoBL = new EmpleadoBL();
        DataView dtv;

        public Empleado01()
        {
            InitializeComponent();
        }

        public void CargarDatos(String strFiltro)
        {
            dtv.RowFilter = "nomTratante like '%" + strFiltro + "%'";
            dtgEmpleado.DataSource = dtv;

            lblTotal.Text = dtgEmpleado.Rows.Count.ToString();
        }

        private void Empleado01_Load(object sender, EventArgs e)
        {
            try
            {
                dtgEmpleado.AutoGenerateColumns = false;                
                dtv = objEmpleadoBL.ListarEmpleados().DefaultView;
                CargarDatos(String.Empty);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error:" + ex.Message + " Empleado01 Load");
            }
        }

        private void btnInsertar_Click(object sender, EventArgs e)
        {
            
            try
            {
                
                Empleado02 obj02 = new Empleado02();
                obj02.ShowDialog();

                dtv = objEmpleadoBL.ListarEmpleados().DefaultView;
                CargarDatos(txtFiltro.Text.Trim());
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error : " + ex.Message+" Empleado01 - btnInsertar");
            }
        }

        private void btnActualizar_Click(object sender, EventArgs e)
        {
            try
            {
                String strCod = dtgEmpleado.CurrentRow.Cells[0].Value.ToString();
                
                Empleado03 obj03 = new Empleado03();
                obj03.Codigo = strCod;
                obj03.ShowDialog();

                //se refresca
                dtv = objEmpleadoBL.ListarEmpleados().DefaultView;
                CargarDatos(txtFiltro.Text.Trim());

            }
            catch (Exception ex)
            {
                MessageBox.Show("Error : " + ex.Message+" empleado01 btnActualizar");
            }
        }

        private void txtFiltro_TextChanged(object sender, EventArgs e)
        {
            CargarDatos(txtFiltro.Text.Trim());
        }

        private void btnCerrar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void dtgEmpleado_DoubleClick(object sender, EventArgs e)
        {
            btnActualizar.PerformClick();
        }
    }
}
