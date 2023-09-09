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
