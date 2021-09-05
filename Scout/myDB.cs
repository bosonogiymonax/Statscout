using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Scout
{
    public class myDB
    {
        static public void connectionCheck()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["myConnection"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                Console.WriteLine("Подключение открыто");
            }
        }
    }
}