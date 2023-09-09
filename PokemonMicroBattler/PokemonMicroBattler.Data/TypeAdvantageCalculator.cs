namespace PokemonMicroBattler.PokemonMicroBattler.Data
{
    public static class TypeAdvantageCalculator
    {
        public static double CalculateTypeAdvantageMultiplier(Move move, Pokemon pokemon)
        {
            double multiplier = 1;

            string type = pokemon.Type1;
            string type2 = pokemon.Type2;

            switch (move.Type)
            {
                case "Normal":
                    {
                        if (type == "Rock")
                        {
                            multiplier = 0.5;
                        }
                        if (type == "Ghost")
                        {
                            multiplier = 0;
                        }

                        if (type2 == "Rock")
                        {
                            multiplier += 0.5;
                        }
                        if (type2 == "Ghost")
                        {
                            multiplier += 0;
                        }
                        break;
                    }
                case "Fire":
                    {
                        if (type == "Grass" || type == "Ice" || type == "Bug")
                        {
                            multiplier = 2;
                        }
                        if (type == "Fire" || type == "Water" || type == "Rock" || type == "Dragon")
                        {
                            multiplier = 0.5;
                        }

                        if (type2 == "Grass" || type2 == "Ice" || type2 == "Bug")
                        {
                            multiplier += 2;
                        }
                        if (type2 == "Fire" || type2 == "Water" || type2 == "Rock" || type2 == "Dragon")
                        {
                            multiplier += 0.5;
                        }
                        break;
                    }
                case "Water":
                    {
                        if (type == "Fire" || type == "Ground" || type == "Rock")
                        {
                            multiplier = 2;
                        }
                        if (type == "Water" || type == "Grass" || type == "Dragon")
                        {
                            multiplier = 0.5;
                        }

                        if (type2 == "Fire" || type2 == "Ground" || type2 == "Rock")
                        {
                            multiplier += 2;
                        }
                        if (type2 == "Water" || type2 == "Grass" || type2 == "Dragon")
                        {
                            multiplier += 0.5;
                        }
                        break;
                    }
                case "Electric":
                    {
                        if (type == "Water" || type == "Flying")
                        {
                            multiplier = 2;
                        }
                        if (type == "Electric" || type == "Grass" || type == "Dragon")
                        {
                            multiplier = 0.5;
                        }
                        if (type == "Ground")
                        {
                            multiplier = 0;
                        }

                        if (type2 == "Water" || type2 == "Flying")
                        {
                            multiplier += 2;
                        }
                        if (type2 == "Electric" || type2 == "Grass" || type2 == "Dragon")
                        {
                            multiplier += 0.5;
                        }
                        if (type2 == "Ground")
                        {
                            multiplier += 0;
                        }
                        break;
                    }
                case "Grass":
                    {
                        if (type == "Water" || type == "Ground" || type == "Rock")
                        {
                            multiplier = 2;
                        }
                        if (type == "Fire" || type == "Grass" || type == "Poison" || type == "Flying" || type == "Bug" || type == "Dragon")
                        {
                            multiplier = 0.5;
                        }

                        if (type2 == "Water" || type2 == "Ground" || type2 == "Rock")
                        {
                            multiplier += 2;
                        }
                        if (type2 == "Fire" || type2 == "Grass" || type2 == "Poison" || type2 == "Flying" || type2 == "Bug" || type2 == "Dragon")
                        {
                            multiplier += 0.5;
                        }
                        break;
                    }
                case "Ice":
                    {
                        if (type == "Grass" || type == "Ground" || type == "Flying" || type == "Dragon")
                        {
                            multiplier = 2;
                        }
                        if (type == "Fire" || type == "Water" || type == "Ice")
                        {
                            multiplier = 0.5;
                        }

                        if (type2 == "Grass" || type2 == "Ground" || type2 == "Flying" || type2 == "Dragon")
                        {
                            multiplier += 2;
                        }
                        if (type2 == "Fire" || type2 == "Water" || type2 == "Ice")
                        {
                            multiplier += 0.5;
                        }
                        break;
                    }
                case "Fighting":
                    {
                        if (type == "Normal" || type == "Ice" || type == "Rock")
                        {
                            multiplier = 2;
                        }
                        if (type == "Poison" || type == "Flying" || type == "Psychic" || type == "Bug")
                        {
                            multiplier = 0.5;
                        }
                        if (type == "Ghost")
                        {
                            multiplier = 0;
                        }

                        if (type2 == "Normal" || type2 == "Ice" || type2 == "Rock")
                        {
                            multiplier += 2;
                        }
                        if (type2 == "Poison" || type2 == "Flying" || type2 == "Psychic" || type2 == "Bug")
                        {
                            multiplier += 0.5;
                        }
                        if (type2 == "Ghost")
                        {
                            multiplier += 0;
                        }
                        break;
                    }
                case "Poison":
                    {
                        if (type == "Grass")
                        {
                            multiplier = 2;
                        }
                        if (type == "Poison" || type == "Ground" || type == "Rock" || type == "Ghost")
                        {
                            multiplier = 0.5;
                        }

                        if (type2 == "Grass")
                        {
                            multiplier += 2;
                        }
                        if (type2 == "Poison" || type2 == "Ground" || type2 == "Rock" || type2 == "Ghost")
                        {
                            multiplier += 0.5;
                        }
                        break;
                    }
                case "Ground":
                    {
                        if (type == "Fire" || type == "Electric" || type == "Poison" || type == "Rock")
                        {
                            multiplier = 2;
                        }
                        if (type == "Grass" || type == "Bug")
                        {
                            multiplier = 0.5;
                        }
                        if (type == "Flying")
                        {
                            multiplier = 0;
                        }

                        if (type2 == "Fire" || type2 == "Electric" || type2 == "Poison" || type2 == "Rock")
                        {
                            multiplier += 2;
                        }
                        if (type2 == "Grass" || type2 == "Bug")
                        {
                            multiplier += 0.5;
                        }
                        if (type2 == "Flying")
                        {
                            multiplier += 0;
                        }
                        break;
                    }
                case "Flying":
                    {
                        if (type == "Grass" || type == "Fighting" || type == "Bug")
                        {
                            multiplier = 2;
                        }
                        if (type == "Electric" || type == "Rock")
                        {
                            multiplier = 0.5;
                        }

                        if (type2 == "Grass" || type2 == "Fighting" || type2 == "Bug")
                        {
                            multiplier += 2;
                        }
                        if (type2 == "Electric" || type2 == "Rock")
                        {
                            multiplier += 0.5;
                        }
                        break;
                    }
                case "Psychic":
                    {
                        if (type == "Fighting" || type == "Poison")
                        {
                            multiplier = 2;
                        }
                        if (type == "Psychic")
                        {
                            multiplier = 0.5;
                        }

                        if (type2 == "Fighting" || type2 == "Poison")
                        {
                            multiplier += 2;
                        }
                        if (type2 == "Psychic")
                        {
                            multiplier += 0.5;
                        }
                        break;
                    }
                case "Bug":
                    {
                        if (type == "Grass" || type == "Psychic")
                        {
                            multiplier = 2;
                        }
                        if (type == "Fire" || type == "Fighting" || type == "Poison" || type == "Flying" || type == "Ghost")
                        {
                            multiplier = 0.5;
                        }

                        if (type2 == "Grass" || type2 == "Psychic")
                        {
                            multiplier += 2;
                        }
                        if (type2 == "Fire" || type2 == "Fighting" || type2 == "Poison" || type2 == "Flying" || type2 == "Ghost")
                        {
                            multiplier += 0.5;
                        }
                        break;
                    }
                case "Rock":
                    {
                        if (type == "Fire" || type == "Ice" || type == "Flying" || type == "Bug")
                        {
                            multiplier = 2;
                        }
                        if (type == "Fighting" || type == "Ground")
                        {
                            multiplier = 0.5;
                        }

                        if (type2 == "Fire" || type2 == "Ice" || type2 == "Flying" || type2 == "Bug")
                        {
                            multiplier += 2;
                        }
                        if (type2 == "Fighting" || type2 == "Ground")
                        {
                            multiplier += 0.5;
                        }
                        break;
                    }
                case "Ghost":
                    {
                        if (type == "Psychic" || type == "Ghost")
                        {
                            multiplier = 2;
                        }
                        if (type == "Normal")
                        {
                            multiplier = 0;
                        }

                        if (type2 == "Psychic" || type2 == "Ghost")
                        {
                            multiplier += 2;
                        }
                        if (type2 == "Normal")
                        {
                            multiplier += 0;
                        }
                        break;
                    }
                case "Dragon":
                    {
                        if (type == "Dragon")
                        {
                            multiplier = 2;
                        }

                        if (type2 == "Dragon")
                        {
                            multiplier += 2;
                        }
                        break;
                    }
            }
            return multiplier;
        }

        public static string GetEffectivenessName(double multiplier)
        {
            string effectiveness = string.Empty;

            switch (multiplier)
            {
                case 0:
                    {
                        effectiveness = "Doesn't  Affect";
                        break;
                    }
                case 0.5:
                    {
                        effectiveness = "Not  Very  Effective  . . .";
                        break;
                    }
                case 1:
                    {
                        effectiveness = "Effective";
                        break;
                    }
                case 1.5:
                    {
                        effectiveness = "Very  Effective  !";
                        break;
                    }
                case 2:
                    {
                        effectiveness = "Super  Effective  !";
                            break;
                    }
            }
            return effectiveness;
        }
    }
}
