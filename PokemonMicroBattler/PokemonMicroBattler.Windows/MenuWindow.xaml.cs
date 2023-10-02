using System;
using System.Windows;
using System.Windows.Input;
using System.Windows.Resources;
using PokemonMicroBattler.PokemonMicroBattler.Windows;

namespace PokemonMicroBattler
{
    public partial class MenuWindow : Window
    {
        public MenuWindow()
        {
            StreamResourceInfo sriCurs = Application.GetResourceStream(new Uri(@"../PokemonMicroBattler.Templates/Other/c.ani", UriKind.Relative));
            Cursor = new Cursor(sriCurs.Stream);
            Mouse.OverrideCursor = Cursor;

            InitializeComponent();
        }

        private void PokedexButton_Click(object sender, RoutedEventArgs e)
        {
            PokedexWindow pokedexWindow = new PokedexWindow();
            pokedexWindow.Show();
            Close();
        }

        private void BattleButton_Click(object sender, RoutedEventArgs e)
        {
            BattleSelectorWindow battleSelectorWindow = new BattleSelectorWindow();
            battleSelectorWindow.Show();
            Close();
        }

        private void LogButton_Click(object sender, RoutedEventArgs e)
        {
            LogWindow logWindow = new LogWindow();
            logWindow.Show();
            Close();
        }

        private void SettingsButton_Click(object sender, RoutedEventArgs e)
        {
            ChooseSettingsWindow chooseSettingsWindow = new ChooseSettingsWindow();
            chooseSettingsWindow.Show();
            Close();
        }
    }
}
