using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//agregamos
using System.Data;
using System.Data.SqlClient;
using ProyAutoServicio_BE;

namespace ProyAutoServicio_ADO
{
    public class EmpleadoADO
    {
        // Insumos.....
        ConexionADO MiConexion = new ConexionADO();
        SqlConnection cnx = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dtr;

        // Metodo para Matenimiento 

        public Boolean InsertarEmpleado(EmpleadosBE objEmpleadoBE)
        {
            cnx.ConnectionString = MiConexion.GetCnx();
            cmd.Connection = cnx;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "usp_InsertEmpleado";
            cmd.Parameters.Clear();
            //Agregamos los parámetros
            try
            {
                cmd.Parameters.AddWithValue("@codAgen", objEmpleadoBE.CodAg_prv);
                cmd.Parameters.AddWithValue("@nombre", objEmpleadoBE.Nom_prv);
                cmd.Parameters.AddWithValue("@apellido", objEmpleadoBE.Ape_prv);
                cmd.Parameters.AddWithValue("@direccion", objEmpleadoBE.Direc_prv);
                cmd.Parameters.AddWithValue("@phone", objEmpleadoBE.Telf_prv);
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

        public Boolean ActualizarEmpleado(EmpleadosBE objEmpleadosBE)
        {
            cnx.ConnectionString = MiConexion.GetCnx();
            cmd.Connection = cnx;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "usp_ActualizarEmpleado";
            cmd.Parameters.Clear();
            //Agregamos los parámetros
            try
            {
                cmd.Parameters.AddWithValue("@cod", objEmpleadosBE.Cod_prv);
                cmd.Parameters.AddWithValue("@codAgen", objEmpleadosBE.CodAg_prv);
                cmd.Parameters.AddWithValue("@nombre", objEmpleadosBE.Nom_prv);
                cmd.Parameters.AddWithValue("@apellido", objEmpleadosBE.Ape_prv);
                cmd.Parameters.AddWithValue("@direccion", objEmpleadosBE.Direc_prv);
                cmd.Parameters.AddWithValue("@phone", objEmpleadosBE.Telf_prv);
                //se abre conexión y se ejecuta
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

        public Boolean EliminarEmpleado(String strcod)
        {
            cnx.ConnectionString = MiConexion.GetCnx();
            cmd.Connection = cnx;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "usp_EliminarProveedor";
            cmd.Parameters.Clear();
            //Agregamos parametros 
            try
            {
                //Codifique
                cmd.Parameters.AddWithValue("@cod", strcod);

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

        public EmpleadosBE ConsultarEmpleado(String strCod)
        {
            EmpleadosBE objEmpleadoBE = new EmpleadosBE();
            cnx.ConnectionString = MiConexion.GetCnx();
            cmd.Connection = cnx;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "usp_ConsultarEmpleado";
            cmd.Parameters.Clear();
            try
            {
                //Codifique
                cmd.Parameters.AddWithValue("@cod", strCod);

                // Abrimos la conexion y ejecutamos...
                cnx.Open();
                dtr = cmd.ExecuteReader();

                if (dtr.HasRows == true)
                {
                    dtr.Read();
                    objEmpleadoBE.Cod_prv = dtr["cod"].ToString();
                    objEmpleadoBE.CodAg_prv = dtr["codAgencia"].ToString();
                    objEmpleadoBE.Nom_prv = dtr["nomTratante"].ToString();
                    objEmpleadoBE.Ape_prv = dtr["apeTratante"].ToString();
                    objEmpleadoBE.Direc_prv = dtr["dirTratante"].ToString();
                    objEmpleadoBE.Telf_prv = dtr["telefono"].ToString();
                }
                dtr.Close();
                return objEmpleadoBE;
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

        public DataTable ListarEmpleados()
        {
            DataSet dts = new DataSet();
            cnx.ConnectionString = MiConexion.GetCnx();
            cmd.Connection = cnx;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "usp_ListarEmpleados";
            cmd.Parameters.Clear();
            try
            {
                //Codifique
                SqlDataAdapter ada = new SqlDataAdapter(cmd);
                ada.Fill(dts, "Empleados");

                return dts.Tables["Empleados"];

            }
            catch (SqlException ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
