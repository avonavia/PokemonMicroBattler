using PokemonMicroBattler.PokemonMicroBattler.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media;

namespace PokemonMicroBattler.PokemonMicroBattler.Windows
{
    public partial class BattleSelectorWindow : Window
    {
        public BattleSelectorWindow()
        {
            InitializeComponent();
            FillData();
        }

        public Player player1 = new Player();
        public Player player2 = new Player();

        public int player1SelectedPokemon { get; set; }
        public int player2SelectedPokemon { get; set; }

        public bool select1Pressed = false;
        public bool select2Pressed = false;

        public List<Pokemon> pokelist = new List<Pokemon>();
        public List<Pokemon> temppokelist = new List<Pokemon>();
        public List<string> types = new List<string>();
        public static string selectedType { get; set; }
        public void FillData()
        {
            ItemControl.ItemsSource = null;
            pokelist.Clear();
            pokelist = Connection.GetPokemonList();
            ItemControl.ItemsSource = pokelist;

            types = Connection.GetTypes();
            types.Add("All");
            types.Remove("None");
            selectedType = "All";
            TypeBox.ItemsSource = types;
            TypeBox.SelectedItem = selectedType;
        }
        public void SortByType()
        {
            if (selectedType != "All")
            {
                temppokelist.Clear();
                temppokelist = pokelist.Where(p => p.Type1 == selectedType || p.Type2 == selectedType).ToList();
                ItemControl.ItemsSource = null;
                ItemControl.ItemsSource = temppokelist;
            }
            else
            {
                temppokelist.Clear();
                ItemControl.ItemsSource = null;
                ItemControl.ItemsSource = pokelist;
            }
        }
        private void TypeBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (TypeBox.SelectedItem != null)
            {
                selectedType = TypeBox.SelectedItem.ToString();
                SortByType();
            }
        }

        private void SearchBar_TextChanged(object sender, TextChangedEventArgs e)
        {
            ItemControl.ItemsSource = null;
            if (SearchBar.Text == "")
            {
                if (temppokelist.Count == 0)
                {
                    ItemControl.ItemsSource = pokelist;
                }
                else
                {
                    ItemControl.ItemsSource = temppokelist;
                }
            }
            else if (temppokelist.Count() == 0)
            {
                ItemControl.ItemsSource = pokelist.Where(p => p.Name.ToLower().Contains(SearchBar.Text.ToLower())).ToList();
            }
            else
            {
                ItemControl.ItemsSource = temppokelist.Where(p => p.Name.ToLower().Contains(SearchBar.Text.ToLower())).ToList();
            }
        }

        private void PokedexButton_Click(object sender, RoutedEventArgs e)
        {
            if (select1Pressed)
            {
                player1SelectedPokemon = Convert.ToInt32((e.Source as Button).Content); 
                player1.Pokemon = pokelist.Where(p => p.ID == player1SelectedPokemon).First();
                SelectedPokemonPlayer1.Content = player1.Pokemon.Name;
            }
            else if (select2Pressed)
            {
                player2SelectedPokemon = Convert.ToInt32((e.Source as Button).Content);
                player2.Pokemon = pokelist.Where(p => p.ID == player2SelectedPokemon).First();
                SelectedPokemonPlayer2.Content = player2.Pokemon.Name;
            }
            select1Pressed = false;
            select2Pressed = false;
        }

        private void SelectButton1_Click(object sender, RoutedEventArgs e)
        {
            select1Pressed = true;
            select2Pressed = false;
        }

        private void SelectButton2_Click(object sender, RoutedEventArgs e)
        {
            select2Pressed = true;
            select1Pressed = false;
        }

        private void StartButton_Click(object sender, RoutedEventArgs e)
        {
            if (player1.Name != null && player2.Name != null && player1.Pokemon != null && player2.Pokemon != null && player1.Name.Length < 255 && player2.Name.Length < 255)
            {
                player1.Win = false;
                player1.HP = 500;

                player2.Win = false;
                player2.HP = 500;

                BattleWindow.player1 = player1;
                BattleWindow.player2 = player2;

                BattleWindow battleWindow = new BattleWindow();
                battleWindow.Show();
                Close();
            }
        }

        private void Player1Name_TextChanged(object sender, TextChangedEventArgs e)
        {
            player1.Name = Player1Name.Text;
        }

        private void Player2Name_TextChanged(object sender, TextChangedEventArgs e)
        {
            player2.Name = Player2Name.Text;
        }
        private void ChangingBorder_MouseEnter(object sender, MouseEventArgs e)
        {
            if (select1Pressed)
            {
                (e.Source as Border).BorderBrush = new SolidColorBrush(Colors.DeepSkyBlue);
            }
            else if (select2Pressed)
            {
                (e.Source as Border).BorderBrush = new SolidColorBrush(Colors.Red);
            }
        }
        private void ChangingBorder_MouseLeave(object sender, MouseEventArgs e)
        {
            (e.Source as Border).BorderBrush = new SolidColorBrush(Colors.Black);
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            MenuWindow menuWindow = new MenuWindow();
            menuWindow.Show();
            Close();
        }
    }
}