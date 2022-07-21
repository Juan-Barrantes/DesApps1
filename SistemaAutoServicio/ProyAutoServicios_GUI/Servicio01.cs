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


namespace ProyAutoServicios_GUI
{
    public partial class Servicio01 : Form
    {
        ServicioBL objServiciosBL = new ServicioBL();
        DataView dtv; // Para el filtro por razon social
        public Servicio01()
        {
            InitializeComponent();
        }

        public void CargarDatos(String strFiltro)
        {
            dtv.RowFilter = "tipoServ like '%" + strFiltro + "%'";
            dataGridView1.DataSource = dtv;
        }

        private void Servicio01_Load(object sender, EventArgs e)
        {
            dataGridView1.RowHeadersVisible = false;
            try
            {
                dtv = new DataView(objServiciosBL.ListarServicios());
                CargarDatos("");
            }
            catch (Exception ex)
            {

                MessageBox.Show("Error" + ex.Message);
            }
        }

        private void btnInsertar_Click(object sender, EventArgs e)
        {
            try
            {
                //Codifique
                Servicio02 obj02 = new Servicio02();
                obj02.ShowDialog();

                // Refrescar...
                dtv = objServiciosBL.ListarServicios().DefaultView;
                CargarDatos(String.Empty);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error : " + ex.Message);

            }
        }

        private void btnActualizar_Click(object sender, EventArgs e)
        {
            try
            {                
                String strCod = dataGridView1.CurrentRow.Cells[0].Value.ToString();

                Servicio03 obj03 = new Servicio03();
                obj03.Codigo = strCod;
                obj03.ShowDialog();

                // Refrescar...
                dtv = new DataView(objServiciosBL.ListarServicios());
                dtv = objServiciosBL.ListarServicios().DefaultView;
                CargarDatos(txtFiltro.Text.Trim());

            }
            catch (Exception ex)
            {
                MessageBox.Show("Error : " + ex.Message);

            }
        }

        private void btnSalir_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void dataGridView1_DoubleClick(object sender, EventArgs e)
        {
            btnActualizar.PerformClick();
        }

        private void txtFiltro_TextChanged(object sender, EventArgs e)
        {
            CargarDatos(txtFiltro.Text.Trim());
        }
    }
}
