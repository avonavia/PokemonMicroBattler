using System;

namespace PokemonMicroBattler.PokemonMicroBattler.Data
{
    public class BattleLog
    {
        public int ID { get; set; }
        public string Player { get; set; } 
        public string WinState { get; set; }
        public string PlayerOther { get; set;}
        public Pokemon Pokemon { get; set; }
        public DateTime DateTime { get; set; }
    }
}
