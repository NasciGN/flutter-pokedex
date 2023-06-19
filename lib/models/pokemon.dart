// Classe Pokemon
//
// id
// is_default
// name
// species
// sprites.official-artwork.front_default
// stats.hp
// stats.attack
// stats.defense
// stats.special-attack
// stats.special-defense
// stats.speed
// types
// weitgh
// height
// location

class Pokemon {
  int id;
  bool isDefault;
  String name;
  String sprite;
  int hp;
  int attack;
  int defense;
  int specialAttack;
  int specialDefense;
  int speed;
  List<dynamic> types;
  int weight;
  int height;

  Pokemon({
    required this.id,
    required this.isDefault,
    required this.name,
    required this.sprite,
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed,
    required this.types,
    required this.weight,
    required this.height,
  });
}
