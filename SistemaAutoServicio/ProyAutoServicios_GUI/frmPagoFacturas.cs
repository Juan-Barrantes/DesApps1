using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
//
using ProyAutoServicio_BL;

namespace ProyAutoServicios_GUI
{
    public partial class frmPagoFacturas : Form
    {
        FacturaBL objFacturaBL = new FacturaBL();
        DataView dtv;
        public frmPagoFacturas()
        {
            InitializeComponent();
        }

        public void CargarDatos(String strFiltro)
        {
            dtv.RowFilter = "docIdentidad like '%" + strFiltro + "%'";
            grvFacturas.DataSource = dtv;

            lblTotal.Text = grvFacturas.Rows.Count.ToString();
        }

        private void frmPagoFacturas_Load(object sender, EventArgs e)
        {
            try
            {
                dtv = objFacturaBL.ListarFacturasPendientes().DefaultView;
                CargarDatos("");
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message);
            }
        }

        private void btnVerDetalle_Click(object sender, EventArgs e)
        {
            try
            {
                int int_codComp = Convert.ToInt32(grvFacturas.CurrentRow.Cells[0].Value);
                String int_docIdent = Convert.ToString(grvFacturas.CurrentRow.Cells[1].Value);

                frmPagoFacturas02 objFactDet = new frmPagoFacturas02();
                objFactDet.CodFactPen = int_codComp;
                objFactDet.doc_identidad = int_docIdent;
                objFactDet.ShowDialog();

                dtv = objFacturaBL.ListarFacturasPendientes().DefaultView;
                CargarDatos(txtFiltro.Text.Trim());
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message);
            }
        }

        private void txtFiltro_TextChanged(object sender, EventArgs e)
        {
            try
            {
                CargarDatos(txtFiltro.Text.Trim());
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message);
            }
        }

        private void btnSalir_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void grvFacturas_DoubleClick(object sender, EventArgs e)
        {
            btnVerDetalle.PerformClick();
        }
    }
}
