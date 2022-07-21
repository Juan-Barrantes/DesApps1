using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using ProyAutoServicio_BE;


namespace ProyAutoServicio_ADO
{
    public class ServicioADO
    {
        // Insumos.....
        ConexionADO MiConexion = new ConexionADO();
        SqlConnection cnx = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dtr;

        // Metodos de mantenimiento
        public Boolean InsertarServicios(ServicioBE objServicioBE)
        {
            cnx.ConnectionString = MiConexion.GetCnx();
            cmd.Connection = cnx;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "usp_InsertarServicio";
            cmd.Parameters.Clear();
            //Agregamos parametros 
            try
            {
                //Codifique

                
                cmd.Parameters.AddWithValue("@tipoServ", objServicioBE.tipoServ);
                cmd.Parameters.AddWithValue("@precio", objServicioBE.precio);
                cmd.Parameters.AddWithValue("@tiempoEst", objServicioBE.tipoServ);
                cmd.Parameters.AddWithValue("@codAg", objServicioBE.codag);
                cmd.Parameters.AddWithValue("@usu_reg", objServicioBE.usureg);

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

        public Boolean ActualizarServicios(ServicioBE objServicioBE)
        {
            cnx.ConnectionString = MiConexion.GetCnx();
            cmd.Connection = cnx;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "usp_ActualizarServicio";
            cmd.Parameters.Clear();
            //Agregamos parametros 
            try
            {
                //Codifique
                cmd.Parameters.AddWithValue("@codServicio", objServicioBE.codServicio);
                cmd.Parameters.AddWithValue("@tipoServ", objServicioBE.tipoServ);
                cmd.Parameters.AddWithValue("@precio", objServicioBE.precio);
                cmd.Parameters.AddWithValue("@tiempoEst", objServicioBE.temposerv);
                cmd.Parameters.AddWithValue("@codAg", objServicioBE.codag);
                cmd.Parameters.AddWithValue("@usu_ult_mod", objServicioBE.Usu_UltMod);
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

        public Boolean EliminarServicios(String strcod)
        {
            cnx.ConnectionString = MiConexion.GetCnx();
            cmd.Connection = cnx;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "usp_EliminarServicio";
            cmd.Parameters.Clear();
            //Agregamos parametros 
            try
            {
                //Codifique
                cmd.Parameters.AddWithValue("@codServ", strcod);

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

        public ServicioBE ConsultarServicios(String strCod)
        {
            ServicioBE objServicioBE = new ServicioBE();
            cnx.ConnectionString = MiConexion.GetCnx();
            cmd.Connection = cnx;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "usp_ConsultarServicio";
            cmd.Parameters.Clear();
            try
            {
                //Codifique

                cmd.Parameters.AddWithValue("@codServ", strCod);

                cnx.Open();
                dtr = cmd.ExecuteReader();

                if (dtr.HasRows == true)
                {
                    dtr.Read();

                    objServicioBE.codServicio =Convert.ToInt16( dtr["codServicio"]);
                    objServicioBE.tipoServ = dtr["tipoServ"].ToString();
                    objServicioBE.precio =Convert.ToDouble( dtr["precio"].ToString());
                    objServicioBE.temposerv =Convert.ToInt16(dtr["tiempoEst"]);
                    objServicioBE.codag = Convert.ToInt16(dtr["codAgencia"]);


                }
                dtr.Close();
                return objServicioBE;
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

        public DataTable ListarServicios()
        {
            DataSet dts = new DataSet();
            cnx.ConnectionString = MiConexion.GetCnx();
            cmd.Connection = cnx;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "usp_ListarServicios";
            cmd.Parameters.Clear();
            try
            {
                //Codifique
                SqlDataAdapter ada = new SqlDataAdapter(cmd);
                ada.Fill(dts, "tb_Servicios");

                return dts.Tables["tb_Servicios"];
            }
            catch (SqlException ex)
            {
                throw new Exception(ex.Message);
            }

        }

        public DataTable ServicioPrecio()
        {
            

            DataSet dts = new DataSet();
            cnx.ConnectionString = MiConexion.GetCnx();
            cmd.Connection = cnx;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "usp_ServicioPrecio";
            cmd.Parameters.Clear();
            dtr = cmd.ExecuteReader();
            while (dtr.Read())
            {

            }



            try
            {
                //Codifique
                SqlDataAdapter ada = new SqlDataAdapter(cmd);
                ada.Fill(dts, "tb_Servicios");

                return dts.Tables["tb_Servicios"];
            }
            catch (SqlException ex)
            {
                throw new Exception(ex.Message);
            }

        }
    }
}
