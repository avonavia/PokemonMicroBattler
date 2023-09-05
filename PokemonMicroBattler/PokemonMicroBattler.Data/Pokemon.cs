using System.Collections.Generic;
using System.Windows.Media.Imaging;

namespace PokemonMicroBattler.PokemonMicroBattler.Data
{
    public class Pokemon
    {
        public int ID { get; set; }
        public BitmapImage Img { get; set; } 
        public string Name { get; set; }
        public string Type1 { get; set; }
        public string Type2 { get; set; }
        public string Weight { get; set; }
        public string Height { get; set; }
        public int EvolveLevel { get; set; }
        public string Description { get; set; }
        public List<Move> Moves { get; set; }
    }
}
