using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace Scout
{
    public class Database
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["myConnection"].ConnectionString;
        public static List<MarketEntity> getDatabase()
        {
            string sqlExpression = "SELECT * FROM Players";
            List<MarketEntity> database = new List<MarketEntity>();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(sqlExpression, connection);
                SqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        database.Add(new MarketEntity()
                        {
                            Name = reader["Name"].ToString(),
                            Position = reader["Position"].ToString().Trim(' '),
                            Age = (int)reader["Age"],
                            MarketValue = (decimal)reader["MarketValue"],
                            Nation = reader["Nation"].ToString(),
                            Club = reader["Club"].ToString(),
                            Salary = (decimal)reader["Salary"]
                        });
                    }
                }
                reader.Close();
            }
            return database;
        }

        public static void insert(MarketEntity newPlayer)
        {
            string sqlExpression = "INSERT INTO Players VALUES (@name, @position, @age, @marketValue, @nation, @club, @salary)";
            List<SqlParameter> sp = new List<SqlParameter>()
            {
                new SqlParameter() {ParameterName = "@name", SqlDbType = SqlDbType.NVarChar, Value = newPlayer.Name},
                new SqlParameter() {ParameterName = "@position", SqlDbType = SqlDbType.NVarChar, Value = newPlayer.Position},
                new SqlParameter() {ParameterName = "@age", SqlDbType = SqlDbType.Int, Value = newPlayer.Age},
                new SqlParameter() {ParameterName = "@marketValue", SqlDbType = SqlDbType.Money, Value = newPlayer.MarketValue},
                new SqlParameter() {ParameterName = "@nation", SqlDbType = SqlDbType.NVarChar, Value = newPlayer.Nation},
                new SqlParameter() {ParameterName = "@club", SqlDbType = SqlDbType.NVarChar, Value = newPlayer.Club},
                new SqlParameter() {ParameterName = "@salary", SqlDbType = SqlDbType.Money, Value = newPlayer.Salary}
            };
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(sqlExpression, connection);
                if (sp.Count > 0)
                {
                    foreach (SqlParameter param in sp)
                        command.Parameters.Add(param);
                }
                command.ExecuteNonQuery();
            }
        }

        public static void update()
        {
            string sqlExpression = "UPDATE Players SET Nation='Germany' WHERE Name='Manuel Neuer'";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(sqlExpression, connection);
                command.ExecuteNonQuery();
            }
        }
    }
}