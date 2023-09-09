using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Media.Imaging;
using System.Linq;

namespace PokemonMicroBattler.PokemonMicroBattler.Data
{
    public static class Connection
    {
        public static string conString = ConfigurationManager.ConnectionStrings["PokemonDBConnectionString"].ConnectionString;
        private static List<Move> GetPokemonMoves(int id)
        {
            List<Move> movelist = new List<Move>();

            string cmdString = "GetPokemonMoves";

            SqlConnection con = new SqlConnection(conString);

            SqlCommand cmd = new SqlCommand(cmdString, con);

            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter idParam = new SqlParameter
            {
                ParameterName = "@id",
                Value = id
            };
            cmd.Parameters.Add(idParam);


            con.Open();

            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                Move m = new Move();
                m.Name = reader[0].ToString();
                m.Power = (int)reader[1];
                m.Accuracy = (int)reader[2];
                m.Type = reader[3].ToString();
                movelist.Add(m);
            }

            con.Close();

            return movelist;
        }
        public static List<Pokemon> GetPokemonList()
        {
            List<Pokemon> pokelist = new List<Pokemon>();

            string cmdString = "GetPokemonList";

            SqlConnection con = new SqlConnection(conString);

            SqlCommand cmd = new SqlCommand(cmdString, con);

            cmd.CommandType = CommandType.StoredProcedure;

            con.Open();

            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                Pokemon p = new Pokemon();
                p.ID = (int)reader[0];
                p.Name = (string)reader[1];
                p.Type1 = (string)reader[2];
                p.Type2 = (string)reader[3];
                p.Weight = reader[4].ToString();
                p.Height = reader[5].ToString();
                p.EvolveLevel = (int)reader[6];
                p.Description = reader[7].ToString();
                try
                {
                    p.Img = new BitmapImage(new Uri(@"../PokemonMicroBattler.Templates/PokemonGifs/" + p.Name + ".gif", UriKind.RelativeOrAbsolute));
                }
                catch
                {
                    p.Img = null;
                }
                p.Moves = GetPokemonMoves(p.ID);
                pokelist.Add(p);
            }
            reader.Close();
            con.Close();
            return pokelist;
        }
        public static List<string> GetTypes()
        {
            List<string> typelist = new List<string>();

            string cmdString = "GetTypes";

            SqlConnection con = new SqlConnection(conString);

            SqlCommand cmd = new SqlCommand(cmdString, con);

            cmd.CommandType = CommandType.StoredProcedure;

            con.Open();

            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                typelist.Add(reader[0].ToString());
            }
            reader.Close();

            con.Close();

            return typelist;
        }
        public static void AddLog(string name1, string winState, string name2, int id)
        {
            string cmdString = "AddLog";

            SqlConnection con = new SqlConnection(conString);

            SqlCommand cmd = new SqlCommand(cmdString, con);

            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter name1Param = new SqlParameter
            {
                ParameterName = "@name1",
                Value = name1
            };
            cmd.Parameters.Add(name1Param);

            SqlParameter winstateParam = new SqlParameter
            {
                ParameterName = "@winstate",
                Value = winState
            };
            cmd.Parameters.Add(winstateParam);

            SqlParameter name2Param = new SqlParameter
            {
                ParameterName = "@name2",
                Value = name2
            };
            cmd.Parameters.Add(name2Param);

            SqlParameter idParam = new SqlParameter
            {
                ParameterName = "@pokeID",
                Value = id
            };
            cmd.Parameters.Add(idParam);

            con.Open();

            cmd.ExecuteNonQuery();

            con.Close();
        }

        public static List<BattleLog> GetLogs()
        {
            List<BattleLog> loglist = new List<BattleLog>();

            string cmdString = "GetLogs";

            SqlConnection con = new SqlConnection(conString);

            SqlCommand cmd = new SqlCommand(cmdString, con);

            cmd.CommandType = CommandType.StoredProcedure;

            con.Open();

            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                BattleLog l = new BattleLog();

                l.ID = (int)reader[0];
                l.Player = reader[1].ToString();
                l.WinState = reader[2].ToString();
                l.PlayerOther = reader[3].ToString();
                l.Pokemon = GetPokemonList().Where(p => p.ID == (int)reader[4]).First();
                l.DateTime = (DateTime)reader[5];
                
                loglist.Add(l);
            }

            con.Close();

            return loglist;
        }
    }
}
