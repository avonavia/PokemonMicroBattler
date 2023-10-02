using System.Windows;

namespace PokemonMicroBattler.PokemonMicroBattler.Windows
{
    public partial class PokemonAddWindow : Window
    {
        public PokemonAddWindow()
        {
            InitializeComponent();
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            ChooseSettingsWindow chooseSettingsWindow = new ChooseSettingsWindow();
            chooseSettingsWindow.Show();
            Close();
        }
    }
}
