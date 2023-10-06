using PokemonMicroBattler.PokemonMicroBattler.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace PokemonMicroBattler.PokemonMicroBattler.Windows
{
    public partial class MoveAddWindow : Window
    {
        public MoveAddWindow()
        {
            InitializeComponent();
            FillData();
        }

        public List<string> types = Connection.GetTypes();
        public List<Move> moves = Connection.GetAllMoves();
        public string SelectedType { get; set; }

        public void FillData()
        {
            types.Remove("None");
            TypeBox.ItemsSource = types;
        }

        private bool ValidateBoxes()
        {
            var result = true;
            try
            {
                if (SelectedType == null)
                {
                    throw new Exception("Type must be selected");
                }
                if (NameBox.Text == "")
                {
                    throw new Exception("'Name' field is empty");
                }
                if (PowerBox.Text == "")
                {
                    throw new Exception("'Power' field is empty");
                }
                if (AccBox.Text == "")
                {
                    throw new Exception("'Accuracy' field is empty");
                }
                if (!(int.TryParse(PowerBox.Text, out int _)))
                {
                    throw new Exception("'Power' must be a number");
                }
                if (!(int.TryParse(AccBox.Text, out int _)))
                {
                    throw new Exception("'Accuracy' must be a number");
                }
                if (int.Parse(AccBox.Text) > 100)
                {
                    throw new Exception("Accuracy can not be more than a 100");
                }
                if (moves.Exists(m => m.Name == NameBox.Text))
                {
                    throw new Exception("Move already exists");
                }
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message);
                result = false;
            }
            return result;
        }
        private void TypeBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            SelectedType = TypeBox.SelectedItem.ToString();
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            if (ValidateBoxes())
            {
                Connection.AddMove(NameBox.Text, Connection.GetTypeIDByName(SelectedType), Convert.ToInt32(PowerBox.Text), Convert.ToInt32(AccBox.Text));
            }
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            ChooseSettingsWindow chooseSettingsWindow = new ChooseSettingsWindow();
            chooseSettingsWindow.Show();
            Close();
        }
    }
}
