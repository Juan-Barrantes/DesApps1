using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProyAutoServicio_BL;
using ProyAutoServicio_BE;
using System.Globalization;

namespace SitioVentasWEB_GUI.Consultas
{
    public partial class ConsultasFacturas : System.Web.UI.Page
    {
        ClienteBL objClienteBL = new ClienteBL();
        ClienteBE objClienteBE = new ClienteBE();
        FacturaBL objFacturaBL = new FacturaBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                btnConsultar.Enabled = false;
            }

        }

        protected void btnConsultar_Click(object sender, EventArgs e)
        {
            
            try
            {

                //Llenamos el grid
                grvFacturas.DataSource = 
                    objFacturaBL.ListarFacturasClienteFechas(txtdoc.Text.Trim(), 
                    Convert.ToDateTime( txtFecIni.Text.Trim()), 
                    Convert.ToDateTime( txtFecFin.Text.Trim()));

                //DateTime.ParseExact(CreationDateTextBox.Text, "DD-MMM-YYYY",null);

                grvFacturas.DataSource = objFacturaBL.ListarFacturasClienteFechas(txtdoc.Text.Trim(),
                      Convert.ToDateTime(txtFecIni.Text.Trim()), Convert.ToDateTime(txtFecFin.Text.Trim()));
                grvFacturas.DataBind();
                lblRegistros.Text = "Cantidad de facturas : " + grvFacturas.Rows.Count.ToString();
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: " + ex.Message;
                mpMensaje.Show();
            }
        }

        protected void btnBuscar_Click(object sender, ImageClickEventArgs e)
        {
            try
            {

                // Consultamos...
                objClienteBE = objClienteBL.ConsultarCliente(txtdoc.Text.Trim());

                // Validamos la existencia del cliente
                if (objClienteBE.docIdentidad == null)
                {
                    txtUbigeo.Text = "";
                    txtDir.Text = "";
                    txtTel.Text = "";
                    txtNombre.Text = "";
                    txtEstado.Text = "";
                    lblRegistros.Text = "";
                    btnConsultar.Enabled = false;
                    // Mostramos el mensaje el el lblMensaje del panel y lanzamos el modal de mensajes
                    lblMensaje.Text = "Cliente no existe";
                    mpMensaje.Show();
                }
                else
                {
                    txtNombre.Text = objClienteBE.nombre + "-" + objClienteBE.apellidos;
                    txtDir.Text = objClienteBE.direccion;
                    txtTel.Text = objClienteBE.telefono;
                    txtUbigeo.Text = objClienteBE.Departamento + "-" + objClienteBE.Provincia + "-" + objClienteBE.Distrito;

                    txtEstado.Text = objClienteBE.est_cli.ToString();
                    btnConsultar.Enabled = true;
                    lblRegistros.Text = "";
                }

            }
            catch (Exception ex)
            {

                lblMensaje.Text = "Error: " + ex.Message;
                mpMensaje.Show();

            }
        }
    }
}