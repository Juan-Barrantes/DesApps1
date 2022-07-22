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
using ProyAutoServicio_BE;

namespace ProyAutoServicios_GUI
{
    public partial class frmPagoFacturas02 : Form
    {
        FacturaBL objFacturaBL = new FacturaBL();
        FacturaBE objFacturaBE = new FacturaBE();

        public frmPagoFacturas02()
        {
            InitializeComponent();
        }

        private int _codFact;
        public int CodFactPen
        {
            get { return _codFact; }
            set { _codFact = value; }
        }
        private String docIdent;
        public String doc_identidad
        {
            get { return docIdent; }
            set { docIdent = value; }
        }

        private void frmPagoFacturas02_Load(object sender, EventArgs e)
        {
            try
            {
                objFacturaBE = objFacturaBL.ConsultarFacturaPendiente(this.CodFactPen, this.doc_identidad);

                lblNumFact.Text = objFacturaBE.cod_compr.ToString();
                lblNumDoc.Text = objFacturaBE.doc_ident;
                lblNomCliente.Text = objFacturaBE.nomcli_compl;
                lblPrecio.Text = objFacturaBE.precio.ToString();

            }
            catch (Exception ex)
            {
                MessageBox.Show("Error : " + ex.Message);
            }
        }

        private void btnPagar_Click(object sender, EventArgs e)
        {
            try
            {
                objFacturaBE.cod_compr =Convert.ToInt16(lblNumFact.Text);
                objFacturaBE.doc_ident = lblNumDoc.Text;
                objFacturaBE.usu_ult_mod = clsCredenciales.Usuario;

              //  MessageBox.Show("Factura N° " + lblNumFact.Text + " pagada"+"\n usuario:"+clsCredenciales.Usuario);

                if (objFacturaBL.ActualizarComprobante(objFacturaBE) == true)
                {
                    MessageBox.Show("Factura N° " + lblNumFact.Text+" pagada");
                    this.Close();
                } 
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error : " + ex.Message);
            }
        }
    }
}
