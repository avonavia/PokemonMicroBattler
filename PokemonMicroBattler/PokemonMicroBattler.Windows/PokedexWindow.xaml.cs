using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Windows;
using System.Configuration;
using PokemonMicroBattler.PokemonMicroBattler.Data;
using System.Windows.Media.Imaging;
using System;
using System.Linq;
using System.Windows.Controls;

namespace PokemonMicroBattler.PokemonMicroBattler.Windows
{
    public partial class PokedexWindow : Window
    {
        public PokedexWindow()
        {
            InitializeComponent();
            FillData();
        }

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
            selectedType = "All";
            TypeBox.ItemsSource = types;
            TypeBox.SelectedItem = selectedType;
        }
        private void PokedexButton_Click(object sender, RoutedEventArgs e)
        {
            var source = (e.Source as Button).Content.ToString();
            PokedexViewWindow.pokemon = pokelist.Where(p => p.ID == Convert.ToInt32(source)).First();
            PokedexViewWindow pokedexViewWindow = new PokedexViewWindow();    
            pokedexViewWindow.Show();
            Close();
        }
        public void Search()
        {

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
    }
}
