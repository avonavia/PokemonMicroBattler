namespace PokemonMicroBattler.PokemonMicroBattler.Data
{
    public class Player
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public Pokemon Pokemon { get; set; }
        public int HP { get; set; }
        public bool Win { get; set; }
    }
}
