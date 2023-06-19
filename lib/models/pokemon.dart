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
  String id;
  bool isDefault;
  String name;
  String sprite;
  String hp;
  String defense;
  String specialAttack;
  String specialDefense;
  String speed;
  List<String> types;
  double weight;
  double height;

  Pokemon({
    required this.id,
    required this.isDefault,
    required this.name,
    required this.sprite,
    required this.hp,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed,
    required this.types,
    required this.weight,
    required this.height,
  });
}
