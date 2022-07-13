using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//
using System.Data;
using ProyAutoServicio_BL;


namespace ProySystemAutoServicioWEB_GUI.Mantenimiento.Servicio
{
    public partial class ConsultaServicio : System.Web.UI.Page
    {
        //Declaramos instancias
        ServicioBL objServicioBL = new ServicioBL();
        //FacturaBL objFacturaBL = new FacturaBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            //Llenamos el combo de servicios

            try
            {
                if (Page.IsPostBack == false)
                {
                    cboTipoServicio.DataSource = objServicioBL.ListarServicios();
                    cboTipoServicio.DataValueField = "tipoServ";
                    cboTipoServicio.DataTextField = "tipoServ";
                    cboTipoServicio.DataBind();

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
            /*
            DataTable tabla = objFacturaBL.ListarConsultaServicios(cboTipoServicio.SelectedValue.ToString(),
                            Convert.ToDateTime(txtFecRegistro.Text.Trim()));
            grvConsulta.DataSource = tabla;
            grvConsulta.DataBind();

            lblRegistros.Text = "Cantidad de registros: " + tabla.Rows.Count.ToString();  */
        }

        protected void grvConsulta_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvConsulta.PageIndex = e.NewPageIndex;
            CargarDatos();
        }

    }
}
    
