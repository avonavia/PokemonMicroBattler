using PokemonMicroBattler.PokemonMicroBattler.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
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
        public static Player player1 { get; set; }
        public static Player player2 { get; set; }

        public bool textWrote = true;

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

            Player1Health.Text = player1.HP.ToString();
            Player2Health.Text = player2.HP.ToString();

            ImageBehavior.SetAnimatedSource(Poke1, player1.Pokemon.Img);

            ScaleTransform flip = new ScaleTransform();
            flip.ScaleX = -1;
            Poke1.RenderTransform = flip;

            ImageBehavior.SetAnimatedSource(Poke2, player2.Pokemon.Img);

            ChangeAttacks();
        }
        private async void ShowHit(Image hit)
        {
            hit.Visibility = Visibility.Visible;
            await Task.Delay(500);
            hit.Visibility = Visibility.Hidden;
        }
        private async void ShowTextByLetter(TextBlock textblock, string text)
        {
            textWrote = false;
            textblock.Text = null;
            foreach (var letter in text)
            {
                textblock.Text += letter;
                await Task.Delay(50);
            }
            textWrote = true;
        }
        private void ChangeAttacks()
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
        private void Attack(int attackNum)
        {
            ChangeAttacks();
            if (turn == 0)
            {
                try
                {
                    Random random = new Random();
                    if (random.Next(1, 100) <= player1.Pokemon.Moves[attackNum].Accuracy)
                    {
                        var multiplier = TypeAdvantageCalculator.CalculateTypeAdvantageMultiplier(player1.Pokemon.Moves[attackNum], player2.Pokemon);
                        player2.HP = player2.HP - (int)(player1.Pokemon.Moves[attackNum].Power * multiplier);
                        ShowHit(Player2Hit);

                        if (player2.HP <= 0)
                        {
                            Player2Health.Text = "0";
                            player1.Win = true;
                            WinState(player1);
                        }
                        else
                        {
                            Player2Health.Text = player2.HP.ToString();
                        }
                        BattleEventTextHandler(player1.Pokemon.Name, player1.Pokemon.Moves[attackNum].Name, true, TypeAdvantageCalculator.GetEffectivenessName(multiplier));
                    }
                    else
                    {
                        BattleEventTextHandler(player1.Pokemon.Name, player1.Pokemon.Moves[attackNum].Name, false, "");
                    }
                }
                catch
                {

                }
            }
            else
            {
                try
                {
                    Random random = new Random();
                    if (random.Next(1, 100) <= player2.Pokemon.Moves[attackNum].Accuracy)
                    {
                        var multiplier = TypeAdvantageCalculator.CalculateTypeAdvantageMultiplier(player2.Pokemon.Moves[attackNum], player1.Pokemon);
                        player1.HP = player1.HP - (int)(player2.Pokemon.Moves[attackNum].Power * multiplier);
                        ShowHit(Player1Hit);

                        if (player1.HP <= 0)
                        {
                            Player1Health.Text = "0";
                            player2.Win = true;
                            WinState(player2);
                        }
                        else
                        {
                            Player1Health.Text = player1.HP.ToString();
                        }

                        BattleEventTextHandler(player2.Pokemon.Name, player2.Pokemon.Moves[attackNum].Name, true, TypeAdvantageCalculator.GetEffectivenessName(multiplier));
                    }
                    else
                    {
                        BattleEventTextHandler(player2.Pokemon.Name, player2.Pokemon.Moves[attackNum].Name, false, "");
                    }
                }
                catch
                {

                }
            }
        }
        private void BattleEventTextHandler(string pokemonName, string attackName, bool state, string effectiveness)
        {
            if (!player1.Win && !player2.Win)
            {
                string hitText;
                string battletext;

                if (state)
                {
                    hitText = "hit!";
                }
                else
                {
                    hitText = "missed!";
                }

                if (state)
                {
                    if (effectiveness == "Doesn't  Affect")
                    {
                        battletext = pokemonName + "  used  " + attackName + "!  " + "\nIt  " + hitText + "\nIt  " + effectiveness + "  The  Opposing  Pokemon";
                    }
                    else
                    {
                        battletext = pokemonName + "  used  " + attackName + "!  " + "\nIt  " + hitText + "\nIt  Was  " + effectiveness;
                    }
                }
                else
                {
                    battletext = pokemonName + "  used  " + attackName + "!  " + "\nIt  " + hitText;
                }

                ShowTextByLetter(BattleText, battletext);
            }
        }
        private void WinState(Player player)
        {
            string winnerannounce = player.Name + "  is  a  winner!";
            ShowTextByLetter(BattleText, winnerannounce);
            BackButton.Visibility = Visibility.Visible;

            Player otherPlayer;
            if (!player1.Win)
            {
                otherPlayer = player1;
            }
            else
            {
                otherPlayer = player2;
            }

            Connection.AddLog(player.Name, GetPlayerStatus(player), otherPlayer.Name, player.Pokemon.ID);
            Connection.AddLog(otherPlayer.Name, GetPlayerStatus(otherPlayer), player.Name, otherPlayer.Pokemon.ID);
        }
        private string GetPlayerStatus(Player player)
        {
            string playerStatus;

            if (player.Win)
            {
                playerStatus = "Won";
            }
            else
            {
                playerStatus = "Lost";
            }

            return playerStatus;
        }
        private void Attack1_Click(object sender, RoutedEventArgs e)
        {
            if (Attack1.Content != null && !player1.Win && !player2.Win && textWrote)
            {
                Attack(0);
            }
        }
        private void Attack2_Click(object sender, RoutedEventArgs e)
        {
            if (Attack2.Content != null && !player1.Win && !player2.Win && textWrote)
            {
                Attack(1);
            }
        }
        private void Attack3_Click(object sender, RoutedEventArgs e)
        {
            if (Attack3.Content != null && !player1.Win && !player2.Win && textWrote)
            {
                Attack(2);
            }
        }
        private void Attack4_Click(object sender, RoutedEventArgs e)
        {
            if (Attack4.Content != null && !player1.Win && !player2.Win && textWrote)
            {
                Attack(3);
            }
        }
        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            MenuWindow menuWindow = new MenuWindow();
            menuWindow.Show();
            Close();
        }
    }
}
