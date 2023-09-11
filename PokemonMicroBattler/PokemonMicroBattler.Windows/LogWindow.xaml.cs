using System.Windows;
using PokemonMicroBattler.PokemonMicroBattler.Data;

namespace PokemonMicroBattler.PokemonMicroBattler.Windows
{
    public partial class LogWindow : Window
    {
        public LogWindow()
        {
            InitializeComponent();
            FillData();
        }
        public void FillData()
        {
            ItemControl.ItemsSource = Connection.GetLogs();
        }
        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            MenuWindow menuWindow = new MenuWindow();
            menuWindow.Show();
            Close();
        }
    }
}
