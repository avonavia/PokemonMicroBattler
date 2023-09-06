using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Media.Imaging;

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
    }
}
