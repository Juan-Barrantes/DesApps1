using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//
using System.Data;
using System.Data.SqlClient;
using ProyAutoServicio_BE;

namespace ProyAutoServicio_ADO
{
    public class FacturaADO
    {
        // Insumos.....
        ConexionADO MiConexion = new ConexionADO();
        SqlConnection cnx = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter ada;
        SqlDataReader dtr;

        //Comprobante

        public Boolean InsertarComprobante(FacturaBE objFacturaBE)
        {
            cnx.ConnectionString = MiConexion.GetCnx();
            cmd.Connection = cnx;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "usp_InsertarComprobante";
            cmd.Parameters.Clear();

            try
            {
                cmd.Parameters.AddWithValue("@docIdentidad", objFacturaBE.doc_ident);
                cmd.Parameters.AddWithValue("@usu_reg", objFacturaBE.usu_reg);

                // abrir conexion y ejecutar:
                cnx.Open();
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (SqlException x)
            {
                throw new Exception(x.Message);
                return false;
            }
            finally
            {
                if (cnx.State == ConnectionState.Open)
                {
                    cnx.Close();
                }
            }
        }

        public Boolean ActualizarComprobante(FacturaBE objFacturaBE)
        {
            cnx.ConnectionString = MiConexion.GetCnx();
            cmd.Connection = cnx;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "usp_ActualizarComprobante";
            cmd.Parameters.Clear();

            try
            {
                cmd.Parameters.AddWithValue("@codComprob", objFacturaBE.cod_compr);                
                cmd.Parameters.AddWithValue("@usu_ult_mod", objFacturaBE.usu_ult_mod);

                cnx.Open();
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (SqlException x)
            {
                throw new Exception(x.Message);
                return false;
            }
            finally
            {
                if (cnx.State == ConnectionState.Open)
                {
                    cnx.Close();
                }
            }
        }

        public FacturaBE ConsultarComprobante(int strCod)
        {
            FacturaBE objFacturaBE = new FacturaBE();
            cnx.ConnectionString = MiConexion.GetCnx();
            cmd.Connection = cnx;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "usp_ConsultarComprobante";
            cmd.Parameters.Clear();

            try
            {
                cmd.Parameters.AddWithValue("@codComprob", strCod);
                
                //abrir conexion
                cnx.Open();
                dtr = cmd.ExecuteReader();

                if (dtr.HasRows == true)
                {
                    dtr.Read();
                    objFacturaBE.cod_compr =Convert.ToInt16( dtr["codComprobante"]);
                    objFacturaBE.doc_ident = dtr["docIdentidad"].ToString();
                    objFacturaBE.nombre = dtr["nombre"].ToString();
                    objFacturaBE.apellido = dtr["apellidos"].ToString();
                    objFacturaBE.fec_ini =Convert.ToDateTime( dtr["fechaEmision"].ToString());
                    objFacturaBE.estado = Convert.ToInt16( dtr["cargo"]);
                }
                dtr.Close();
                return objFacturaBE;
            }
            catch (SqlException x)
            {
                throw new Exception(x.Message);
                
            }
            finally
            {
                if (cnx.State == ConnectionState.Open)
                {
                    cnx.Close();
                }
            }
        }

        public DataTable ListarFacturasClienteFechas(String strCod, DateTime fecini, DateTime fecfin)
        {
            DataSet dts = new DataSet();
            cnx.ConnectionString = MiConexion.GetCnx();
            cmd.Connection = cnx;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "usp_ListarFacturasClienteFechas";
            cmd.Parameters.Clear();

            //Agregamos parametros
            cmd.Parameters.AddWithValue("@docIdentidad", strCod);
            cmd.Parameters.AddWithValue("@fecIni", fecini);
            cmd.Parameters.AddWithValue("@fecFin", fecfin);

            try
            {
                //Codifique
                SqlDataAdapter ada = new SqlDataAdapter(cmd);
                ada.Fill(dts, "FacturasCliente");

                return dts.Tables["FacturasCliente"];

            }
            catch (SqlException ex)
            {
                throw new Exception(ex.Message);
            }

        }

            //tb_Detalle_Servicio
            public Boolean InsertarDetalle_Servicio(FacturaBE objFacturaBE)
        {
            cnx.ConnectionString = MiConexion.GetCnx();
            cmd.Connection = cnx;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "usp_InsertarListaServiciosxCliente";
            cmd.Parameters.Clear();

            try
            {
                cmd.Parameters.AddWithValue("@docIdente", objFacturaBE.doc_ident);
                cmd.Parameters.AddWithValue("@listaServ", objFacturaBE.lista_serv);
                // abrir conexion y ejecutar:
                cnx.Open();
                cmd.ExecuteNonQuery();
                cnx.Close();
                return true;
            }
            catch (SqlException x)
            {
                throw new Exception(x.Message);
                return false;
            }
            finally
            {
                if (cnx.State == ConnectionState.Open)
                {
                    cnx.Close();
                }
            }
        }

        public DataTable ultFactura()
        {
            DataSet dts = new DataSet();
            cnx.ConnectionString = MiConexion.GetCnx();
            cmd.Connection = cnx;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "usp_ultFactura";
            cmd.Parameters.Clear();

            try
            {
                SqlDataAdapter ada = new SqlDataAdapter(cmd);
                ada.Fill(dts, "ulFact");

                return dts.Tables["ulFact"];
            }
            catch (Exception x)
            {
                throw new Exception(x.Message);
            }
        }

        public DataTable ListarComprobante_Cliente_Servicio()
        {
            DataSet dts = new DataSet();
            cnx.ConnectionString = MiConexion.GetCnx();
            cmd.Connection = cnx;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "usp_ListarComprobante_Cliente_Servicio";
            cmd.Parameters.Clear();

            try
            {
                SqlDataAdapter ada = new SqlDataAdapter(cmd);
                ada.Fill(dts, "ComprobClieServ");

                return dts.Tables["ComprobClieServ"];
            }
            catch (SqlException x)
            {
                throw new Exception(x.Message);                
            }

        }
 
        public DataTable ListarConsultaServicios(String strtipoServ)
        {
            DataSet dts = new DataSet();
            cnx.ConnectionString = MiConexion.GetCnx();
            cmd.Connection = cnx;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "usp_ListarConsultaServicios";
            cmd.Parameters.Clear();

            //Agregamos parametros
            cmd.Parameters.AddWithValue("@tipoServ", strtipoServ);            
            try
            {
                //Codifique
                SqlDataAdapter ada = new SqlDataAdapter(cmd);
                ada.Fill(dts, "ConsultaServicio");

                return dts.Tables["ConsultaServicio"];

            }
            catch (SqlException ex)
            {
                throw new Exception(ex.Message);
            }


        }

        public DataTable ListarFacturas_Paginacion(String strCod_cli,  String strEstado, Int16 intNumPag)
        {
            DataSet dts = new DataSet();
            cnx.ConnectionString = MiConexion.GetCnx();
            cmd.Connection = cnx;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "usp_ListarFacturas_Paginacion";
            cmd.Parameters.Clear();

            //Agregamos parametros  
            cmd.Parameters.AddWithValue("@docIdentidad", strCod_cli);            
            cmd.Parameters.AddWithValue("@estado", strEstado);
            cmd.Parameters.AddWithValue("@NumPag", intNumPag);

            try
            {
                //Codifique
                SqlDataAdapter ada = new SqlDataAdapter(cmd);
                ada.Fill(dts, "FacturasPaginacion");

                return dts.Tables["FacturasPaginacion"];

            }
            catch (SqlException ex)
            {
                throw new Exception(ex.Message);
            }


        }

        public Int16 NumPag_ListarFacturas_Paginacion(String strCod_cli,  String strEstado)
        {
            try
            {

                cnx.ConnectionString = MiConexion.GetCnx();
                cmd.Connection = cnx;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "usp_NumPag_ListarFacturas_Paginacion";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@docIdentidad", strCod_cli);                
                cmd.Parameters.AddWithValue("@estado", strEstado);
                
                // Parametro de salida que devolvera la cantidad de registros de la consulta filtrada por
                // cliente, vendedor y estado
                cmd.Parameters.Add("@NumReg", SqlDbType.Int);
                cmd.Parameters["@NumReg"].Direction = ParameterDirection.Output;
                cnx.Open();
                cmd.ExecuteScalar();
                Int16 NumReg = Convert.ToInt16(cmd.Parameters["@NumReg"].Value);
                return NumReg;
            }
            catch (SqlException ex)
            {

                throw new Exception(ex.Message);
            }

        }

        public Boolean InsertarServiciosCliente(FacturaBE objFacturaBE)
        {
            cnx.ConnectionString = MiConexion.GetCnx();
            cmd.Connection = cnx;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "usp_InsertarListaServiciosxCliente";
            cmd.Parameters.Clear();

            try
            {
                cmd.Parameters.AddWithValue("@", objFacturaBE.doc_ident);
                cmd.Parameters.AddWithValue("@listaServ", objFacturaBE.lista_serv);

                // abrir conexion y ejecutar:
                cnx.Open();
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (SqlException x)
            {
                throw new Exception(x.Message);
                return false;
            }
            finally
            {
                if (cnx.State == ConnectionState.Open)
                {
                    cnx.Close();
                }
            }
        }

        public DataTable ListarFacturasPendientes()
        {
            DataSet dts = new DataSet();
            cnx.ConnectionString = MiConexion.GetCnx();
            cmd.Connection = cnx;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "usp_ListarFacturasPendientes";
            cmd.Parameters.Clear();

            try
            {
                SqlDataAdapter ada = new SqlDataAdapter(cmd);
                ada.Fill(dts, "ListFactPend");

                return dts.Tables["ListFactPend"];
            }
            catch (SqlException x)
            {
                throw new Exception(x.Message);
            }
        }

        public FacturaBE ConsultarFacturaPendiente(int strCodFact, string strDocIden)
        {
            FacturaBE objFacturaBE = new FacturaBE();
            cnx.ConnectionString = MiConexion.GetCnx();
            cmd.Connection = cnx;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "usp_ConsultarFacturasPendientes";
            cmd.Parameters.Clear();

            try
            {
                cmd.Parameters.AddWithValue("@docIdent", strDocIden);
                cmd.Parameters.AddWithValue("@codFact", strCodFact);
                

                //abrir conexion
                cnx.Open();
                dtr = cmd.ExecuteReader();

                if (dtr.HasRows == true)
                {
                    dtr.Read();
                    objFacturaBE.cod_compr = Convert.ToInt16(dtr["codComprobante"]);
                    objFacturaBE.doc_ident = dtr["docIdentidad"].ToString();
                    objFacturaBE.nomcli_compl = dtr["cliente"].ToString();
                    objFacturaBE.precio = Convert.ToInt16(dtr["precio"]);
                }
                dtr.Close();
                return objFacturaBE;
            }
            catch (SqlException x)
            {
                throw new Exception(x.Message);

            }
            finally
            {
                if (cnx.State == ConnectionState.Open)
                {
                    cnx.Close();
                }
            }
        }

    }
}
