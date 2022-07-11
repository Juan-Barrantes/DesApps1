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
    public partial class Cliente01 : Form
    {
        ClienteBL objClientesBL = new ClienteBL();
        DataView docI;

        public Cliente01()
        {
            InitializeComponent();
        }

        public void CargarDatos(String strFiltro)
        {

            docI.RowFilter = "nombre like '%" + strFiltro + "%'";
            dtgCliente.DataSource = docI;

            lblRegistros.Text = dtgCliente.Rows.Count.ToString();
        }

        private void Cliente01_Load(object sender, EventArgs e)
        {
            try
            {
                // Codifique
                // Definimos el dataview...
                docI = objClientesBL.ListarCliente().DefaultView;
                CargarDatos(String.Empty);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error:" + ex.Message);
            }
        }

        private void btnInsertar_Click(object sender, EventArgs e)
        {
            Cliente02 par02 = new Cliente02();
            par02.ShowDialog();

            docI = objClientesBL.ListarCliente().DefaultView;
            CargarDatos(txtFiltro.Text.Trim());
        }

        private void btnActualizar_Click(object sender, EventArgs e)
        {
            try
            {
                String strDoc = dtgCliente.CurrentRow.Cells[0].Value.ToString();


                Cliente03 obj03 = new Cliente03();
                obj03.docIdentidad = strDoc;
                obj03.ShowDialog();

                docI = objClientesBL.ListarCliente().DefaultView;
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

        private void txtFiltro_TextChanged(object sender, EventArgs e)
        {
            CargarDatos(txtFiltro.Text.Trim());
        }


    }
}
