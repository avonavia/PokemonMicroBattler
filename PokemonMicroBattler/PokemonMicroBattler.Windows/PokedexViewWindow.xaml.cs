using System.Windows;
using PokemonMicroBattler.PokemonMicroBattler.Data;
using WpfAnimatedGif;

namespace PokemonMicroBattler.PokemonMicroBattler.Windows
{
    public partial class PokedexViewWindow : Window
    {
        public static Pokemon pokemon { get; set; }
        public PokedexViewWindow()
        {
            InitializeComponent();
            FillData();
        }

        public void FillData()
        {
            ImageBehavior.SetAnimatedSource(PokeImg, pokemon.Img);

            NameBlock.Text = pokemon.Name;
            Type1Block.Text = pokemon.Type1;
            Type2Block.Text = pokemon.Type2;

            if (pokemon.EvolveLevel == 0)
            {
                LevelBlock.Text = "NO";
            }
            else
            {
                LevelBlock.Text = pokemon.EvolveLevel.ToString();
            }
            DescBlock.Text = pokemon.Description;
            HeightBlock.Text = pokemon.Height;
            WeightBlock.Text = pokemon.Weight;
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            PokedexWindow pokedexWindow = new PokedexWindow();
            pokedexWindow.Show();
            Close();
        }
    }
}
