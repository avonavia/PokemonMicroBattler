using System.Windows;
using System;
using System.Collections.Generic;
using PokemonMicroBattler.PokemonMicroBattler.Data;
using System.Linq;
using System.Reflection.Emit;

namespace PokemonMicroBattler.PokemonMicroBattler.Windows
{
    public partial class PokemonAddWindow : Window
    {
        public PokemonAddWindow()
        {
            InitializeComponent();
            FillData();
        }

        public List<string> types = new List<string>();
        public List<Move> moves = new List<Move>();
        public List<string> movenames = new List<string>();
        public List<Pokemon> pokelist = Connection.GetPokemonList();
        public string SelectedType1 { get; set; }
        public string SelectedType2 { get; set; }
        public string SelectedMove1 { get; set; }
        public string SelectedMove2 { get; set; }
        public string SelectedMove3 { get; set; }
        public string SelectedMove4 { get; set; }

        public void FillData()
        {
            types = Connection.GetTypes();
            Type1Box.ItemsSource = types;
            Type2Box.ItemsSource = types;
            Type1Box.SelectedItem = "None";
            Type2Box.SelectedItem = "None";

            moves = Connection.GetAllMoves();
            movenames = moves.Select(m => m.Name).ToList();
            Move1Box.ItemsSource = movenames;
            Move2Box.ItemsSource = movenames;
            Move3Box.ItemsSource = movenames;
            Move4Box.ItemsSource = movenames;
        }

        private bool ValidateBoxes()
        {
            var result = true;
            try
            {
                if (SelectedType1 == "None")
                {
                    throw new Exception("Pokemon must have a type");
                }
                if (SelectedType1 == SelectedType2)
                {
                    throw new Exception("Pokemon must have two different types");
                }
                if (NameBox.Text == "")
                {
                    throw new Exception("'Name' field is empty");
                }
                if (DescBox.Text == "")
                {
                    throw new Exception("'Description' field is empty");
                }
                if (WeigthBox.Text == null)
                {
                    throw new Exception("'Weight' field is empty");
                }
                if (!(float.TryParse(WeigthBox.Text, out float _)))
                {
                    throw new Exception("'Weight' must be a number");
                }
                if (HeightBox.Text == null)
                {
                    throw new Exception("'Height' field is empty");
                }
                if (!(float.TryParse(HeightBox.Text, out float _)))
                {
                    throw new Exception("'Height' must be a number");
                }
                if (LevelBox.Text == null)
                {
                    throw new Exception("'Evolve Level' field is empty");
                }
                if (!(int.TryParse(LevelBox.Text, out int _)))
                {
                    throw new Exception("'Level' must be a number");
                }
                if (SelectedMove1 == null || SelectedMove2 == null || SelectedMove3 == null || SelectedMove4 == null)
                {
                    throw new Exception("All moves must be selected");
                }
                if (SelectedMove1 == SelectedMove2 || SelectedMove1 == SelectedMove3 || SelectedMove1 == SelectedMove4)
                {
                    throw new Exception("Same moves are not allowed");
                }
                if (SelectedMove2 == SelectedMove1 || SelectedMove2 == SelectedMove3 || SelectedMove2 == SelectedMove4)
                {
                    throw new Exception("Same moves are not allowed");
                }
                if (SelectedMove3 == SelectedMove1 || SelectedMove3 == SelectedMove2 || SelectedMove3 == SelectedMove4)
                {
                    throw new Exception("Same moves are not allowed");
                }
                if (SelectedMove4 == SelectedMove1 || SelectedMove4 == SelectedMove2 || SelectedMove4 == SelectedMove3)
                {
                    throw new Exception("Same moves are not allowed");
                }
                if (pokelist.Exists(p => p.Name == NameBox.Text))
                {
                    throw new Exception("Pokemon already exists");
                }
            }
            catch(Exception e)
            {
                MessageBox.Show(e.Message);
                result = false;
            }
            return result;
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            if (ValidateBoxes())
            {
                Connection.AddPokemon(Type1Box.SelectedIndex, Type2Box.SelectedIndex, NameBox.Text, DescBox.Text, WeigthBox.Text, HeightBox.Text, Convert.ToInt32(LevelBox.Text));

                var move1 = moves.Where(m => m.Name == Move1Box.Text).First();
                var move2 = moves.Where(m => m.Name == Move2Box.Text).First();
                var move3 = moves.Where(m => m.Name == Move3Box.Text).First();
                var move4 = moves.Where(m => m.Name == Move4Box.Text).First();

                var currentID = Connection.GetPokemonList().Where(p => p.Name == NameBox.Text).First().ID;

                Connection.AddMoveToPokemon(move1.Id, currentID);
                Connection.AddMoveToPokemon(move2.Id, currentID);
                Connection.AddMoveToPokemon(move3.Id, currentID);
                Connection.AddMoveToPokemon(move4.Id, currentID);

                MessageBox.Show("Success.\nTo add a picture, add a gif image to the working directory and name it according to new Pokemon name");
            }
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            ChooseSettingsWindow chooseSettingsWindow = new ChooseSettingsWindow();
            chooseSettingsWindow.Show();
            Close();
        }

        private void Type1Box_SelectionChanged(object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {
            SelectedType1 = Type1Box.SelectedItem.ToString();
        }

        private void Type2Box_SelectionChanged(object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {
            SelectedType2 = Type2Box.SelectedItem.ToString();
        }

        private void Move1Box_SelectionChanged(object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {
            SelectedMove1 = Move1Box.SelectedItem.ToString();
        }

        private void Move2Box_SelectionChanged(object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {
            SelectedMove2 = Move2Box.SelectedItem.ToString();
        }

        private void Move3Box_SelectionChanged(object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {
            SelectedMove3 = Move3Box.SelectedItem.ToString();
        }

        private void Move4Box_SelectionChanged(object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {
            SelectedMove4 = Move4Box.SelectedItem.ToString();
        }
    }
}
