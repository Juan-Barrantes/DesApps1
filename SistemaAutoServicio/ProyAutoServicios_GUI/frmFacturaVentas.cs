using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;
using ProyAutoServicio_BL;
using ProyAutoServicio_BE;

namespace ProyAutoServicios_GUI
{
    public partial class frmFacturaVentas : Form
    {
        FacturaBL objFacturaBL = new FacturaBL();
        ClienteBL objClienteBL = new ClienteBL();
        ClienteBE objClienteBE = new ClienteBE();


        public frmFacturaVentas()
        {
            InitializeComponent();
        }

        private void frmFacturaVentas_Load(object sender, EventArgs e)
        {
            fillListBox();

            try
            {

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        void fillListBox()

        {

            string str = @"Server=DESKTOP-IIG3JHT\SQLEXPRESS; Database=bd_NegocioAutosA1;Integrated Security=true";

            SqlConnection con = new SqlConnection(str);

            string query = "select tipoServ from VW_Servicios";

            SqlCommand cmd = new SqlCommand(query, con);

            SqlDataReader dbr;

            try
            {
                con.Open();
                dbr = cmd.ExecuteReader();
                while (dbr.Read())
                {
                    string sname = (string)dbr["tipoServ"]; ; //name is coming from database

                    listServ.Items.Add(sname);
                }
            }
            catch (Exception es)
            {
                MessageBox.Show(es.Message);
            }

        }

        private void txtDoc_KeyPress(object sender, KeyPressEventArgs e)
        {
            try
            {
                if(e.KeyChar == 13)
                {
                    objClienteBE = objClienteBL.ConsultarCliente(txtDoc.Text.Trim());

                    if(objClienteBE.nombre == null)
                    {
                        lblApe.Text = "";
                        lblNombre.Text = "";
                        lblDireccion.Text = "";
                        MessageBox.Show("Cliente no existe", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                    else
                    {
                        lblApe.Text = objClienteBE.apellidos;
                        lblNombre.Text = objClienteBE.nombre;
                        lblDireccion.Text = objClienteBE.direccion;
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            listServEleg.Items.Add(listServ.SelectedItem);
        }
    }



}
