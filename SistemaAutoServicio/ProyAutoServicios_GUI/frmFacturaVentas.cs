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
        FacturaBE objFactureBE = new FacturaBE();
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


            //Permitir q solo se agregue a la lista una vez
            //tomar un valor y preguntar si ya está en la otra lista
            /*
            String[] ServEleg = listServEleg.Items.OfType<String>().ToArray();
            String valueEleg = listServ.SelectedItem.ToString();

            if(ServEleg.Length==0)
            {
                listServEleg.Items.Add(listServ.SelectedItem);
                MessageBox.Show("se agregó - 1" + listServ.SelectedItem);
            }
            else
            {
                for (int i = 0; i < ServEleg.Length; i++)
                {
                    String valueListEleg = ServEleg[i];
                    if (valueEleg == valueListEleg)
                    {
                        MessageBox.Show("El servicio - 2" + valueEleg + " ya ha sido elegido");
                    }
                    else
                    {
                        listServEleg.Items.Add(listServ.SelectedItem);
                        MessageBox.Show("se agregó - 3" + valueListEleg);
                    }
                }
            }
            */

            
        }

        private void btnGenerar_Click(object sender, EventArgs e)
        {
            try
            {
                // generamos el comprobante
                objFactureBE.doc_ident = txtDoc.Text.Trim();
                objFactureBE.usu_reg = clsCredenciales.Usuario;

                if (objFacturaBL.InsertarComprobante(objFactureBE) == true)
                {
                    MessageBox.Show("Comprobante generado");
                }
                else
                {
                    throw new Exception("No se generó Factura, comuniquese con IT");
                }

            // insertamos en tb_Detalle_Servicio

                //en un array añadimos todos los servicios elegidos
                String[] ServEleg = listServEleg.Items.OfType<String>().ToArray();
                String ListaServ = "";
                
                for(int i = 0; i<ServEleg.Length; i++)
                {
                    ListaServ = ListaServ+"" + ServEleg[i]+",";
                }
//                MessageBox.Show("Array ServEleg: " + ListaServ);

                objFactureBE.lista_serv = ListaServ;
                objFactureBE.doc_ident = txtDoc.Text.Trim();

                if (objFacturaBL.InsertarDetalle_Servicio(objFactureBE) == true)
                {
                    MessageBox.Show("Servicios registrados: " + ListaServ);
                }
                else
                {
                    throw new Exception("Lista de servicios no registrados,comuniquese con IT");
                }


                /*
                for (int i = 0; i < ServEleg.Length; i++)
                {
                    String servicio = ServEleg[i];
                    objFactureBE.doc_ident = txtDoc.Text.Trim();
                    objFactureBE.tipo_serv = servicio;

                    if (objFacturaBL.InsertarDetalle_Servicio(objFactureBE) == true)
                    {
                        MessageBox.Show("Servicios registrados: "+servicio);
                    }
                    else
                    {
                        throw new Exception("Lista de servicios no registrados,comuniquese con IT");
                    }
                }*/

                //String ultFact = objFacturaBL.UltFactura().ToString();
                //MessageBox.Show("Factura N° "+ultFact+" generada, pase a caja a pagar", "Factura");

            }            

            catch (Exception ex)
            {
                MessageBox.Show("Se ha producido el error: " + ex.Message);
            }

        }

        private void btnQuitar_Click(object sender, EventArgs e)
        {
            listServEleg.SelectionMode = SelectionMode.MultiExtended;
            
            if(listServEleg.SelectedIndex > -1)
            {
                for(int i=0; i<listServEleg.SelectedItems.Count; i++)
                {
                    listServEleg.Items.Remove(listServEleg.SelectedItems[i].ToString());
                    i--;
                }

                //1001Arnaldo
                /*for (int i = listServEleg.SelectedIndices.Count - 1; i >= 0; i--)
                {
                    listServEleg.Items.RemoveAt(listServEleg.SelectedIndices[i]);
                } */
            }
            else
            {
                MessageBox.Show("Lista de servicios vacía");
            }

            
            
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }



}
