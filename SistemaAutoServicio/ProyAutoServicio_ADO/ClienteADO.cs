using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//agregamos:
using System.Data;
using System.Data.SqlClient;
using ProyAutoServicio_BE;

namespace ProyAutoServicio_ADO
{
    public class ClienteADO
    {
        // Insumos.....
        ConexionADO MiConexion = new ConexionADO();
        SqlConnection cnx = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dtr;

         // Metodos de mantenimiento
        public Boolean InsertarCliente(ClienteBE objProveedorBE)
        {
            cnx.ConnectionString = MiConexion.GetCnx();
            cmd.Connection = cnx;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "usp_InsertarCliente";
            cmd.Parameters.Clear();
           
            //Agregamos parametros 
            try
            {
                //Codifique
                
                cmd.Parameters.AddWithValue("@docIdentidad", objProveedorBE.docIdentidad);
                cmd.Parameters.AddWithValue("@tipoDocumento", objProveedorBE.tipoDocumento);
                cmd.Parameters.AddWithValue("@apellidos", objProveedorBE.apellidos);
                cmd.Parameters.AddWithValue("@nombre", objProveedorBE.nombre);
                cmd.Parameters.AddWithValue("@Id_Ubigeo", objProveedorBE.IdUbi);
                cmd.Parameters.AddWithValue("@direccion", objProveedorBE.direccion);
                cmd.Parameters.AddWithValue("@telefono", objProveedorBE.telefono);
                cmd.Parameters.AddWithValue("@usu_reg", objProveedorBE.usureg);
                cmd.Parameters.AddWithValue("@estado_cli", objProveedorBE.est_cli);
                // Abro la conexion y ejecutamos....
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
        public Boolean ActualizarCliente(ClienteBE objProveedorBE)
        {
            cnx.ConnectionString = MiConexion.GetCnx();
            cmd.Connection = cnx;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "usp_ActualizarCliente";
            cmd.Parameters.Clear();
            //Agregamos parametros 
            try
            {
                //Codifique
                
                cmd.Parameters.AddWithValue("@docIdentidad", objProveedorBE.docIdentidad);
                cmd.Parameters.AddWithValue("@tipoDocumento", objProveedorBE.tipoDocumento);
                cmd.Parameters.AddWithValue("@apellidos", objProveedorBE.apellidos);
                cmd.Parameters.AddWithValue("@nombre", objProveedorBE.nombre);
                cmd.Parameters.AddWithValue("@Id_Ubigeo", objProveedorBE.IdUbi);
                cmd.Parameters.AddWithValue("@direccion", objProveedorBE.direccion);
                cmd.Parameters.AddWithValue("@telefono", objProveedorBE.telefono);
                cmd.Parameters.AddWithValue("@usu_ult_mod", objProveedorBE.Usu_UltMod);
                cmd.Parameters.AddWithValue("@estado_cli", objProveedorBE.est_cli);
                // Abro la conexion y ejecutamos....
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

        public Boolean EliminarCliente(String strcod)
        {
            cnx.ConnectionString = MiConexion.GetCnx();
            cmd.Connection = cnx;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "usp_EliminarCliente";
            cmd.Parameters.Clear();
            //Agregamos parametros 
            try
            {
                //Codifique
                cmd.Parameters.AddWithValue("@docIdentidad", strcod);

                //Abro la conexion y ejecuto...
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

        public ClienteBE ConsultarCliente(String strCod)
        {
            ClienteBE objClienteBE = new ClienteBE();
            cnx.ConnectionString = MiConexion.GetCnx();
            cmd.Connection = cnx;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "usp_ConsultarCliente";
            cmd.Parameters.Clear();
            try
            {
                //Codifique
                cmd.Parameters.AddWithValue("@docIdentidad", strCod);

                // Abrimos la conexion y ejecutamos...
                cnx.Open();
                dtr = cmd.ExecuteReader();

                if (dtr.HasRows == true)
                {
                    dtr.Read();
                    objClienteBE.docIdentidad = dtr["docIdentidad"].ToString();
                    objClienteBE.tipoDocumento = dtr["tipoDocumento"].ToString();
                    objClienteBE.apellidos = dtr["apellidos"].ToString();
                    objClienteBE.nombre = dtr["nombre"].ToString();
                    objClienteBE.IdUbi = dtr["Id_Ubigeo"].ToString();
                    objClienteBE.est_cli = Convert.ToInt16(dtr["estado_cli"]);
                    objClienteBE.direccion = dtr["direccion"].ToString();
                    objClienteBE.telefono = dtr["telefono"].ToString();
                    


                }
                dtr.Close();
                return objClienteBE;

            }
            catch (SqlException ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                if (cnx.State == ConnectionState.Open)
                {
                    cnx.Close();
                }
                
            }
            
        }

        public DataTable ListarCliente()
        {
            DataSet dts = new DataSet();
            cnx.ConnectionString = MiConexion.GetCnx();
            cmd.Connection = cnx;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "usp_ListarClientes";
            cmd.Parameters.Clear();
            try
            {
                //Codifique
                SqlDataAdapter ada = new SqlDataAdapter(cmd);
                ada.Fill(dts, "tb_Cliente");

                return dts.Tables["tb_Cliente"];
               
            }
            catch (SqlException ex)
            {
                throw new Exception(ex.Message);
            }
            
        }

        public DataTable ListarClienteDocs()
        {
            DataSet dts = new DataSet();
            cnx.ConnectionString = MiConexion.GetCnx();
            cmd.Connection = cnx;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "usp_ListarTipoDocs";
            cmd.Parameters.Clear();
            try
            {
                //Codifique
                SqlDataAdapter ada = new SqlDataAdapter(cmd);
                ada.Fill(dts, "tb_Cliente");

                return dts.Tables["tb_Cliente"];

            }
            catch (SqlException ex)
            {
                throw new Exception(ex.Message);
            }

        }

    }
}
