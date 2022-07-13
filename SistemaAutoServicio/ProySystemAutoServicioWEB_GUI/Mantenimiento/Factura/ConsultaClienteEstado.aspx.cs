using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//
using System.Data;
using ProyAutoServicio_BL;

namespace ProySystemAutoServicioWEB_GUI.Mantenimiento.Factura
{
    public partial class ConsultaClienteEstado : System.Web.UI.Page
    {
        // Creamos las instancias de los servicios involucrados....
        FacturaBL objFactura = new FacturaBL();
        ClienteBL objCliente = new ClienteBL();
        
        // Variable paginacion....
        String strText;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsPostBack == false)
                {

                    LlenarCombos();

                    //Llenamos la grilla, llamando al metodo con el flag en falso
                    Filtrar(false);

                }

            }
            catch (Exception ex)
            {
                lblMensaje.Text = ex.Message;
            }

        }

        private void LlenarCombos()
        {
            // Creamos un nuevo item de cliente
            DataTable dtCombos = new DataTable();
            DataRow drFila;

            // Llenamos la tabla de clientes
            dtCombos = objCliente.ListarCliente();
            // Creamos un nuevo item de cliente ....
            drFila = dtCombos.NewRow();
            drFila["docIdentidad"] = "X";
            drFila["nombre"] = "--Todos--";
            // Lo insertamos a la tabla de clientes en la posicion 0
            dtCombos.Rows.InsertAt(drFila, 0);
            // Enlazamos la lista al combo de clientes...
            cboCliente.DataSource = dtCombos;
            cboCliente.DataTextField = "nombre";
            cboCliente.DataValueField = "docIdentidad";
            cboCliente.DataBind();

  



        }

        private void Filtrar(Boolean blnFlag)
        {

            Int16 pagina = 0;
            String estado;
            String codcli;
            

            // Tamaño de pagina : 50
            Int16 intsize = 2;
            Int16 intnumpag;

            // Configuramos los parametros ....
            if (cboCliente.SelectedValue == "X") // si eligio Todos
            {
                codcli = "";

            }
            else
            {
                codcli = cboCliente.SelectedValue;
            }



            if (cboEstado.SelectedValue == "X") // si eligio todos
            {
                estado = "";
            }
            else
            {
                estado = cboEstado.SelectedValue;
            }

            // Si el flag este en verdadero es porque selecciono un numero de pagina del combo de paginas...
            if (blnFlag == true)
            {
                //Se obtiene el nro de pagina desde el dropdown menos 1

                strText = cboPaginas.SelectedItem.ToString();
                pagina = Convert.ToInt16(strText);
                pagina = Convert.ToInt16(pagina - 1);


            }
            else // caso contrario sera siempre la primera pagina
            {
                pagina = 0;

            }

            // Si el combo de paginas esta aun vacio , se carga todo sin filtros, obteniendo los primeros 50
            if (cboPaginas.Items.Count == 0)
            {
                grvFacturas.DataSource = objFactura.ListarFacturas_Paginacion("", "",  0);

            }
            else // caso contrario ya se genero un filtro, por eso se le pasan las variables del filtro al metodo
            {
                grvFacturas.DataSource = objFactura.ListarFacturas_Paginacion(codcli, estado, pagina);

            }
            grvFacturas.DataBind();

            // Obtenemos la cantidad de paginas...

            Int16 intNumReg;
            intNumReg = objFactura.NumPag_ListarFacturas_Paginacion(codcli, estado);


            //Se carga el numero de paginas
            String strValue = cboPaginas.Text;
            cboPaginas.Items.Clear();

            if (intNumReg == 0)
            {
                cboPaginas.Items.Add("0");
                cboPaginas.SelectedIndex = 0;
            }
            else
            {

                if (intNumReg % intsize == 0)
                {
                    intnumpag = Convert.ToInt16(intNumReg / intsize);

                }
                else
                {
                    intnumpag = Convert.ToInt16((intNumReg / intsize) + 1);
                }
                for (int indice = 1; indice <= intnumpag; indice = indice + 1)
                {
                    cboPaginas.Items.Add(indice.ToString());
                }

            }

            if (blnFlag == true)
            {
                cboPaginas.Text = strValue;
            }

            // Dormimos la aplicacion 2 segundos simulando la recarga de las paginas en un ambiente real....
            // NOTA : No hacer eso en produccion
            System.Threading.Thread.Sleep(2000);

        }


        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            try
            {
                Filtrar(false);
            }
            catch (Exception ex)
            {

                lblMensaje.Text = ex.Message;
            }
        }

        protected void cboPaginas_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Cuando hay paginas se llama al metodo con el flag en verdadero
            Filtrar(true);
        }
    }
}