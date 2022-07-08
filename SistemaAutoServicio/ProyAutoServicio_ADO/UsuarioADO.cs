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
    public class UsuarioADO
    {
        // Insumos.....
        ConexionADO MiConexion = new ConexionADO();
        SqlConnection cnx = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dtr;

        public UsuarioBE ConsultarUsuario(String strLogin)
        {
            UsuarioBE objUsuarioBE = new UsuarioBE();
            cnx.ConnectionString = MiConexion.GetCnx();
            cmd.Connection = cnx;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "usp_ConsultarUsuario";
            cmd.Parameters.Clear();
            try
            {
                //Codifique
                cmd.Parameters.AddWithValue("@usu_name", strLogin);

                // Abrimos la conexion y ejecutamos...
                cnx.Open();
                dtr = cmd.ExecuteReader();

                if (dtr.HasRows == true)
                {
                    dtr.Read();
                    objUsuarioBE.Name_Usuario = dtr["usu_name"].ToString();
                    objUsuarioBE.Pass_Usuario = dtr["usu_pass"].ToString();
                    objUsuarioBE.Nivel_Usuario =Convert.ToInt16( dtr["usu_nivel"]);
                    objUsuarioBE.Fec_Registro = Convert.ToDateTime(dtr["fech_reg"]);
                    objUsuarioBE.Usu_Registro = dtr["usu_reg"].ToString();                    
                }
                dtr.Close();
                return objUsuarioBE;

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
    }
}
