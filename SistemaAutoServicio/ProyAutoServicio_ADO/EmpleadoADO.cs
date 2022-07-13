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

        public Boolean InsertarEmpleado(EmpleadoBE objEmpleadoBE)
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
                cmd.Parameters.AddWithValue("@IdUbi", objEmpleadoBE.IdUbi_prv);
                cmd.Parameters.AddWithValue("@telefono", objEmpleadoBE.Telf_prv);
                //cmd.Parameters.AddWithValue("@sue", objEmpleadoBE.Sueldo_prv);
                cmd.Parameters.AddWithValue("@fecini", objEmpleadoBE.fecIni);
                cmd.Parameters.AddWithValue("@fecnac", objEmpleadoBE.fecNac);
                cmd.Parameters.AddWithValue("@cargo", objEmpleadoBE.Cargo_prv);
                cmd.Parameters.AddWithValue("@email", objEmpleadoBE.Email_prv);
                cmd.Parameters.AddWithValue("@usu_reg", objEmpleadoBE.Usu_Registro);                
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

        public Boolean ActualizarEmpleado(EmpleadoBE objEmpleadosBE)
        {
            cnx.ConnectionString = MiConexion.GetCnx();
            cmd.Connection = cnx;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "usp_ActualizarEmpleado";
            cmd.Parameters.Clear();
            //Agregamos los parámetros
            try
            {
                cmd.Parameters.AddWithValue("@cod", objEmpleadosBE.Cod_emp);
                cmd.Parameters.AddWithValue("@codAgen", objEmpleadosBE.CodAg_prv);
                cmd.Parameters.AddWithValue("@nombre", objEmpleadosBE.Nom_prv);
                cmd.Parameters.AddWithValue("@apellido", objEmpleadosBE.Ape_prv);
                cmd.Parameters.AddWithValue("@Id_Ubi", objEmpleadosBE.IdUbi_prv);
                cmd.Parameters.AddWithValue("@direccion", objEmpleadosBE.Direc_prv);
                cmd.Parameters.AddWithValue("@telef", objEmpleadosBE.Telf_prv);                
                cmd.Parameters.AddWithValue("@cargo", objEmpleadosBE.Cargo_prv);
                cmd.Parameters.AddWithValue("@email", objEmpleadosBE.Email_prv);
                cmd.Parameters.AddWithValue("@usu_ult_mod", objEmpleadosBE.Usu_Registro);

                //se abre conexión y se ejecuta
                cnx.Open();
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (SqlException x)
            {
                throw new Exception(x.Message + " actualizar-empleadoADO");
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

        public EmpleadoBE ConsultarEmpleado(int strCod)
        {
            EmpleadoBE objEmpleadoBE = new EmpleadoBE();
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
                    objEmpleadoBE.Cod_emp = dtr["codEmpleado"].ToString();
                    objEmpleadoBE.Nom_prv = dtr["nomEmpleado"].ToString();                    
                    objEmpleadoBE.Ape_prv = dtr["apeEmpleado"].ToString();
                    objEmpleadoBE.Direc_prv = dtr["dirEmpleado"].ToString();
                    objEmpleadoBE.Telf_prv = dtr["telefono"].ToString();
                    objEmpleadoBE.Cargo_prv = dtr["cargo"].ToString();
                    objEmpleadoBE.Email_prv = dtr["correo"].ToString();
                                        
                    objEmpleadoBE.CodAg_prv = Convert.ToInt16(dtr["codAgencia"]);
         
                    objEmpleadoBE.Id_Ubigeo= dtr["Id_Ubigeo"].ToString();
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

        public DataTable ListarEmpleadosCod(int codEmp)
        {
            DataSet dts = new DataSet();
            cnx.ConnectionString = MiConexion.GetCnx();
            cmd.Connection = cnx;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "usp_ListarEmpleadoCod";
            cmd.Parameters.Clear();

            //Agregamos parametros
            cmd.Parameters.AddWithValue("@codEmp", codEmp);
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
    }
}
