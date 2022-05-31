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
        public Boolean InsertarProveedor(ClienteBE objProveedorBE)
        {
            cnx.ConnectionString = MiConexion.GetCnx();
            cmd.Connection = cnx;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "usp_ClienteInsertar";
            cmd.Parameters.Clear();
           
            //Agregamos parametros 
            try
            {
                //Codifique
                
                cmd.Parameters.AddWithValue("@docIdentidad", objProveedorBE.docIdentidad);
                cmd.Parameters.AddWithValue("@tipoDocumento", objProveedorBE.tipoDocumento);
                cmd.Parameters.AddWithValue("@apellidos", objProveedorBE.apellidos);
                cmd.Parameters.AddWithValue("@nombre", objProveedorBE.nombre);
                cmd.Parameters.AddWithValue("@direccion", objProveedorBE.direccion);
                cmd.Parameters.AddWithValue("@telefono", objProveedorBE.telefono);
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
        public Boolean ActualizarProveedor(ClienteBE objProveedorBE)
        {
            cnx.ConnectionString = MiConexion.GetCnx();
            cmd.Connection = cnx;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "usp_ClienteActualizar";
            cmd.Parameters.Clear();
            //Agregamos parametros 
            try
            {
                //Codifique
                
                cmd.Parameters.AddWithValue("@docIdentidad", objProveedorBE.docIdentidad);
                cmd.Parameters.AddWithValue("@tipoDocumento", objProveedorBE.tipoDocumento);
                cmd.Parameters.AddWithValue("@apellidos", objProveedorBE.apellidos);
                cmd.Parameters.AddWithValue("@nombre", objProveedorBE.nombre);
                cmd.Parameters.AddWithValue("@direccion", objProveedorBE.direccion);
                cmd.Parameters.AddWithValue("@telefono", objProveedorBE.telefono);
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

        public Boolean EliminarProveedor(String strcod)
        {
            cnx.ConnectionString = MiConexion.GetCnx();
            cmd.Connection = cnx;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "usp_ClienteEliminar";
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

        public ClienteBE ConsultarProveedor(String strCod)
        {
            ClienteBE objProveedorBE = new ClienteBE();
            cnx.ConnectionString = MiConexion.GetCnx();
            cmd.Connection = cnx;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "usp_ClienteListar";
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
                    objProveedorBE.docIdentidad = dtr["docIdentidad"].ToString();
                    objProveedorBE.tipoDocumento = dtr["tipoDocumento"].ToString();
                    objProveedorBE.apellidos = dtr["apellidos"].ToString();
                    objProveedorBE.nombre = dtr["nombre"].ToString();
                    objProveedorBE.direccion = dtr["direccion"].ToString();
                    objProveedorBE.telefono = dtr["telefono"].ToString();
                    


                }
                dtr.Close();
                return objProveedorBE;

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

        public DataTable ListarProveedor()
        {
            DataSet dts = new DataSet();
            cnx.ConnectionString = MiConexion.GetCnx();
            cmd.Connection = cnx;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "usp_ClienteMostrar";
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
