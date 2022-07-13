using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//
using System.Data;
using ProyAutoServicio_BL;

namespace ProySystemAutoServicioWEB_GUI.Mantenimiento.Cliente
{
    public partial class ConsultaCliente : System.Web.UI.Page
    {
        ClienteBL objClienteBL = new ClienteBL();
        //FacturaBL objFacturaBL = new FacturaBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsPostBack == false)
                {
                    cbotipoDocumento.DataSource = objClienteBL.ListarClienteDocs();
                    cbotipoDocumento.DataValueField = "tipoDocumento";
                    cbotipoDocumento.DataTextField = "tipoDocumento"; 
                    cbotipoDocumento.DataBind();



                }

            }
            catch (Exception ex)
            {

                lblMensaje.Text = "Error: " + ex.Message;
                mpMensaje.Show();
            }
        }

        protected void btnConsultar_Click(object sender, EventArgs e)
        {
            try
            {
                CargarDatos();
            }
            catch (Exception ex)
            {

                lblMensaje.Text = "Error: " + ex.Message;
                mpMensaje.Show();
            }
        }
        private void CargarDatos()
        {
            /*DataTable tabla = objFacturaBL.ListarConsultaServicios(cbotipoDocumento.SelectedValue.ToString(),
                            Convert.ToDateTime(txtFecRegistro.Text.Trim()));  
            grvClientes.DataSource = tabla;
            grvClientes.DataBind();

            lblRegistros.Text = "Cantidad de registros: " + tabla.Rows.Count.ToString();
            */
        }

        protected void grvClientes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvClientes.PageIndex = e.NewPageIndex;
            CargarDatos();
        }




      

    }
}