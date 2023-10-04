using System.Windows;

namespace PokemonMicroBattler.PokemonMicroBattler.Windows
{
    public partial class ChooseSettingsWindow : Window
    {
        public ChooseSettingsWindow()
        {
            InitializeComponent();
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            MenuWindow menuWindow = new MenuWindow();
            menuWindow.Show();
            Close();
        }

        private void Setting1Button_Click(object sender, RoutedEventArgs e)
        {
            PokemonAddWindow pokemonAddWindow = new PokemonAddWindow();
            pokemonAddWindow.Show();
            Close();
        }

        private void Setting2Button_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
