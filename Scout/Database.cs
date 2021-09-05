using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using Scout.Models;
using System.Data.Linq;
using System.Diagnostics;

namespace Scout
{
    public class Database
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["myConnection"].ConnectionString;
        public static List<MarketEntity> getDatabase()
        {
            DataContext db = new DataContext(connectionString);

            Table<Player> players = db.GetTable<Player>();
            Table<Contract> contracts = db.GetTable<Contract>();
            Table<Clubs> clubs = db.GetTable<Clubs>();
            Table<Nations> nations = db.GetTable<Nations>();
            List<MarketEntity> database = new List<MarketEntity>();

            var query = from pl in players
                        join n in nations on pl.NationID equals n.ID
                        join cl in clubs on pl.ClubID equals cl.ID
                        select new
                        {
                            Name = pl.Name,
                            Age = pl.Age,
                            Position = pl.Position,
                            MarketValue = pl.MarketValue,
                            Nation = n.Nation,
                            Club = cl.Club
                        };

            foreach (var player in query)
            {
                database.Add(new MarketEntity()
                {
                    Name = player.Name,
                    Age = player.Age,
                    Position = player.Position.Trim(' '),
                    MarketValue = player.MarketValue,
                    Nation = player.Nation,
                    Club = player.Club
                });
            }
            return database;
        }

        public static void Insert(MarketEntity newMarketEntity)
        {
            DataContext db = new DataContext(connectionString);

            Table<Nations> nations = db.GetTable<Nations>();
            Table<Clubs> clubs = db.GetTable<Clubs>();
            Table<Player> players = db.GetTable<Player>();

            var nation = nations.Where(n => n.Nation == newMarketEntity.Nation).Select(n => n.ID).FirstOrDefault();
            var club = clubs.Where(cl => cl.Club == newMarketEntity.Club).Select(cl => cl.ID).FirstOrDefault();

            Player newPlayer = new Player()
            {
                Name = newMarketEntity.Name,
                Age = newMarketEntity.Age,
                Position = newMarketEntity.Position,
                MarketValue = newMarketEntity.MarketValue,
                NationID = nation,
                ClubID = club,
                ContractID = 3
            };

            players.InsertOnSubmit(newPlayer);
            db.SubmitChanges();
        }

        public static void Update(string name, string update, string value)
        {
            DataContext db = new DataContext(connectionString);
            Table<Player> players = db.GetTable<Player>();
            Table<Nations> nations = db.GetTable<Nations>();
            Table<Clubs> clubs = db.GetTable<Clubs>();

            Player updatePlayer = players.Where(p => p.Name == name).FirstOrDefault();
            switch (update)
            {
                case "Position":
                    updatePlayer.Position = value;
                    break;
                case "Age":
                    updatePlayer.Age = Convert.ToInt32(value);
                    break;
                case "MarketValue":
                    updatePlayer.MarketValue = Convert.ToDecimal(value);
                    break;
                case "Nation":
                    var nation = nations.Where(n => n.Nation == value).Select(n => n.ID).FirstOrDefault();
                    updatePlayer.NationID = nation;
                    break;
                case "Club":
                    var club = clubs.Where(cl => cl.Club == value).Select(cl => cl.ID).FirstOrDefault();
                    updatePlayer.ClubID = club;
                    break;
                default:
                    break;
            }
            db.SubmitChanges();
        }

        //public static List<Player> getDatabase()
        //{
        //    string sqlExpression = "SELECT * FROM Players";
        //    List<Player> database = new List<Player>();
        //    using (SqlConnection connection = new SqlConnection(connectionString))
        //    {
        //        connection.Open();
        //        SqlCommand command = new SqlCommand(sqlExpression, connection);
        //        SqlDataReader reader = command.ExecuteReader();

        //        if (reader.HasRows)
        //        {
        //            while (reader.Read())
        //            {
        //                database.Add(new Player()
        //                {
        //                    Name = reader["Name"].ToString(),
        //                    //Position = reader["Position"].ToString().Trim(' '),
        //                    Age = (int)reader["Age"],
        //                    MarketValue = (decimal)reader["MarketValue"],
        //                    //Nation = reader["Nation"].ToString(),
        //                    //Club = reader["Club"].ToString(),
        //                    //Salary = (decimal)reader["Salary"]
        //                });
        //            }
        //        }
        //        reader.Close();
        //    }
        //    return database;
        //}


        //public static void Update(string name, string update, string value)
        //{
        //    string sqlExpression = "UPDATE Players SET " + update + "=@value WHERE Name=@name";

        //    using (SqlConnection connection = new SqlConnection(connectionString))
        //    {
        //        connection.Open();
        //        SqlCommand command = new SqlCommand(sqlExpression, connection);
        //        SqlParameter nameParam = new SqlParameter("@name", name);
        //        command.Parameters.Add(nameParam);
        //        SqlParameter updateParam = new SqlParameter("@update", update);
        //        command.Parameters.Add(updateParam);
        //        SqlParameter valueParam = new SqlParameter("@value", value);
        //        command.Parameters.Add(valueParam);
        //        command.ExecuteNonQuery();
        //    }
        //}
        //public static void Insert(Player newPlayer)
        //{
        //    string sqlExpression = "INSERT INTO Players VALUES (@name, @age, @marketValue)";
        //    List<SqlParameter> sp = new List<SqlParameter>()
        //    {
        //        new SqlParameter() {ParameterName = "@name", SqlDbType = SqlDbType.NVarChar, Value = newPlayer.Name},
        //        new SqlParameter() {ParameterName = "@position", SqlDbType = SqlDbType.NVarChar, Value = newPlayer.Position},
        //        new SqlParameter() {ParameterName = "@age", SqlDbType = SqlDbType.Int, Value = newPlayer.Age},
        //        new SqlParameter() {ParameterName = "@marketValue", SqlDbType = SqlDbType.Money, Value = newPlayer.MarketValue},
        //        new SqlParameter() {ParameterName = "@nation", SqlDbType = SqlDbType.NVarChar, Value = newPlayer.Nation},
        //        new SqlParameter() {ParameterName = "@club", SqlDbType = SqlDbType.NVarChar, Value = newPlayer.Club},
        //        new SqlParameter() {ParameterName = "@salary", SqlDbType = SqlDbType.Money, Value = newPlayer.Salary}
        //    };
        //    using (SqlConnection connection = new SqlConnection(connectionString))
        //    {
        //        connection.Open();
        //        SqlCommand command = new SqlCommand(sqlExpression, connection);
        //        if (sp.Count > 0)
        //        {
        //            foreach (SqlParameter param in sp)
        //                command.Parameters.Add(param);
        //        }
        //        command.ExecuteNonQuery();
        //    }
        //}
    }
}