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
                cmd.Parameters.AddWithValue("@docIdent", objFacturaBE.doc_ident);
                cmd.Parameters.AddWithValue("@usu_reg", objFacturaBE.usu_reg);

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
                cmd.Parameters.AddWithValue("@estado", objFacturaBE.estado);
                cmd.Parameters.AddWithValue("@usu_ult_mod", objFacturaBE.usu_ult_mod);

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



        //tb_Detalle_Servicio
        public Boolean InsertarDetalle_Servicio(FacturaBE objFacturaBE)
        {
            cnx.ConnectionString = MiConexion.GetCnx();
            cmd.Connection = cnx;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "usp_InsertarDetalle_Servicio";
            cmd.Parameters.Clear();

            try
            {
                cmd.Parameters.AddWithValue("@docIdent", objFacturaBE.doc_ident);
                cmd.Parameters.AddWithValue("@codServ", objFacturaBE.cod_serv);

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
    }
}
