import 'package:flutter/material.dart';

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
  String color;

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
    required this.color,
  }) {
    color = getColor();
  }

  String getColor() {
    if (types.isNotEmpty) {
      final type = types[0];
      final color = colors[type];
      if (color != null) {
        return color;
      }
    }
    return '';
  }

  static const Map<String, String> colors = {
    'fire': '0xFFdd5e5e',
    'grass': '0xFF72c177',
    'electric': '0xFFe5cc4e',
    'water': '0xFF60abcf',
    'ground': '0xFF64594f',
    'rock': '0xFF909062',
    'fairy': '0xFFb77bc1',
    'poison': '0xFF65876c',
    'bug': '0xFFc7a77a',
    'dragon': '0xFF4368ac',
    'psychic': '0xFFcfd376',
    'flying': '0xFF7b7575',
    'fighting': '0xFFb49c6d',
    'normal': '0xFFbd8888'
  };
}
