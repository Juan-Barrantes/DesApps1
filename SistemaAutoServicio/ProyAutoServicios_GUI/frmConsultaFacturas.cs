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
    public partial class ConsultaFacturas : Form
    {
        FacturaBL objFacturaBL = new FacturaBL();
        ClienteBL objClienteBL = new ClienteBL();
        ClienteBE objClienteBE = new ClienteBE();
        public ConsultaFacturas()
        {
            InitializeComponent();
        }

        private void ConsultaFacturas_Load(object sender, EventArgs e)
        {
            try
            {

                // Desactivamos la generacion de columnas automaticas del datagrid...
                dtgFacturas.AutoGenerateColumns = false;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void btnConsultar_Click(object sender, EventArgs e)
        {
            try
            {
                //Llenamos el grid
                dtgFacturas.DataSource = objFacturaBL.ListarFacturasClienteFechas(txtCod.Text.Trim(), dtpFecIni.Value.Date, dtpFecFin.Value.Date);
                lblRegistros.Text = dtgFacturas.Rows.Count.ToString();

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void txtCod_KeyPress(object sender, KeyPressEventArgs e)
        {
            try
            {
                if (e.KeyChar == 13)// Si se pulsa enter
                {
                    // Consultamos...
                    objClienteBE = objClienteBL.ConsultarCliente(txtCod.Text.Trim());
                    //validamos la existencia del cliente
                    if (objClienteBE.docIdentidad == null)
                    {
                        lblNombre.Text = "";
                        lblDir.Text = "";
                        lblTel.Text = "";
                        lblUbicacion.Text = "";
                        lblEstado.Text = "";
                        lblRegistros.Text = "";
                        MessageBox.Show("Cliente no existe", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);

                    }
                    else
                    {
                        lblNombre.Text = objClienteBE.nombre + " "+objClienteBE.apellidos;
                        lblDir.Text = objClienteBE.direccion;
                        lblTel.Text = objClienteBE.telefono;
                        lblUbicacion.Text = objClienteBE.Departamento + "-" + objClienteBE.Provincia + "-" + objClienteBE.Distrito;
                        lblEstado.Text = objClienteBE.est_cli.ToString();

                    }

                }
            }
            catch (Exception ex)
            {

                MessageBox.Show("Error: " + ex.Message, "Error");
            }

        }
    }
    
}
