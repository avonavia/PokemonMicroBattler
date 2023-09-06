using PokemonMicroBattler.PokemonMicroBattler.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using WpfAnimatedGif;

namespace PokemonMicroBattler.PokemonMicroBattler.Windows
{
    public partial class BattleWindow : Window
    {
        public BattleWindow()
        {
            InitializeComponent();
            FillData();
        }
        public static int turn { get; set; }

        public Player player1 = new Player();
        public Player player2 = new Player();
        public List<Button> buttonlist = new List<Button>();

        public void FillData()
        {
            turn = 0;

            buttonlist.Add(Attack1);
            buttonlist.Add(Attack2);
            buttonlist.Add(Attack3);
            buttonlist.Add(Attack4);

            List<Pokemon> pokelist = new List<Pokemon>();
            pokelist = Connection.GetPokemonList();

            player1.Name = "a";
            player1.Pokemon = pokelist.Where(p => p.ID == 10).First();
            player1.Win = false;
            player1.HP = 20000;

            player2.Name = "b";
            player2.Pokemon = pokelist.Where(p => p.ID == 100).First();
            player2.Win = false;
            player2.HP = 20000;

            Player1Health.Text = player1.HP.ToString();
            Player2Health.Text = player2.HP.ToString();

            ImageBehavior.SetAnimatedSource(Poke1, player1.Pokemon.Img);

            ScaleTransform flip = new ScaleTransform();
            flip.ScaleX = -1;
            Poke1.RenderTransform = flip;

            ImageBehavior.SetAnimatedSource(Poke2, player2.Pokemon.Img);

            ChangeAttacks();
        }

        public void ChangeAttacks()
        {
            if (turn == 0)
            {
                var attackCount = player1.Pokemon.Moves.Count();
                var count = 0;

                foreach (var b in buttonlist)
                {
                    if (count <= attackCount)
                    {
                        try
                        {
                            b.Content = player1.Pokemon.Moves[count].Name;
                        }
                        catch
                        {
                            b.Content = null;
                            count--;
                        }
                    }
                    count++;
                }
            }
            else
            {
                var attackCount = player2.Pokemon.Moves.Count();
                var count = 0;

                foreach (var b in buttonlist)
                {
                    if (count <= attackCount)
                    {
                        try
                        {
                            b.Content = player2.Pokemon.Moves[count].Name;
                        }
                        catch
                        {
                            b.Content = null;
                            count--;
                        }
                    }
                    count++;
                }
            }

            if (turn == 0)
            {
                turn = 1;
            }
            else
            {
                turn = 0;
            }
        }

        private void Attack1_Click(object sender, RoutedEventArgs e)
        {
            ChangeAttacks();
            if (turn == 0)
            {
                try
                {
                    player2.HP = player2.HP - player1.Pokemon.Moves[0].Power;
                    Player2Health.Text = player2.HP.ToString();
                }
                catch
                {

                }
            }
            else
            {
                try
                {
                    player1.HP = player1.HP - player2.Pokemon.Moves[0].Power;
                    Player1Health.Text = player1.HP.ToString();
                }
                catch
                {

                }
            }
        }

        private void Attack2_Click(object sender, RoutedEventArgs e)
        {
            ChangeAttacks();
            if (turn == 0)
            {
                try
                {
                    player2.HP = player2.HP - player1.Pokemon.Moves[1].Power;
                    Player2Health.Text = player2.HP.ToString();
                }
                catch
                {

                }
            }
            else
            {
                try
                {
                    player1.HP = player1.HP - player2.Pokemon.Moves[1].Power;
                    Player1Health.Text = player1.HP.ToString();
                }
                catch
                {

                }
            }
        }

        private void Attack3_Click(object sender, RoutedEventArgs e)
        {
            ChangeAttacks();
            if (turn == 0)
            {
                try
                {
                    player2.HP = player2.HP - player1.Pokemon.Moves[2].Power;
                    Player2Health.Text = player2.HP.ToString();
                }
                catch
                {

                }
            }
            else
            {
                try
                {
                    player1.HP = player1.HP - player2.Pokemon.Moves[2].Power;
                    Player1Health.Text = player1.HP.ToString();
                }
                catch
                {

                }
            }
        }

        private void Attack4_Click(object sender, RoutedEventArgs e)
        {
            ChangeAttacks();
            if (turn == 0)
            {
                try
                {
                    player2.HP = player2.HP - player1.Pokemon.Moves[3].Power;
                    Player2Health.Text = player2.HP.ToString();
                }
                catch
                {

                }
            }
            else
            {
                try
                {
                    player1.HP = player1.HP - player2.Pokemon.Moves[3].Power;
                    Player1Health.Text = player1.HP.ToString();
                }
                catch
                {

                }
            }
        }
    }
}
