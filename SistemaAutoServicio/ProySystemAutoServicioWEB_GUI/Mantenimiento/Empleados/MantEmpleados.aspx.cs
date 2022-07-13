using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//agregamos
using ProyAutoServicio_BL;
using ProyAutoServicio_BE;
using System.Data;

namespace ProySystemAutoServicioWEB_GUI.Mantenimiento
{
    public partial class MantEmpleados : System.Web.UI.Page
    {
        EmpleadoBL objEmpleadoBL = new EmpleadoBL();
        EmpleadoBE objEmpleadoBE = new EmpleadoBE();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                
                
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: " + ex.Message;
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
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Ocurrió un error, consulte con TI')", true);
            }
        }

        private void CargarDatos()
        {

            DataTable tabla = objEmpleadoBL.ListarEmpleadosCod(Convert.ToInt16( txtCod.Text)) ;
            grvEmpleados.DataSource = tabla;
            grvEmpleados.DataBind();
        
        }

        protected void grvConsulta_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvEmpleados.PageIndex = e.NewPageIndex;
            CargarDatos();
        }
    }
}