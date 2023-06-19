import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:pokedex/models/pokemon.dart';

String baseURL = 'https://pokeapi.co/api/v2';

bool isPokemonCode(String text) {
  final regex = RegExp(r'\d');
  return regex.hasMatch(text);
}

Future<Pokemon?> fecthPokemon(String pokemon) async {
  Pokemon? searchPokemon;

  if (!isPokemonCode(pokemon)) {
    pokemon = pokemon.toLowerCase();
  }

  final http.Response response =
      await http.get(Uri.parse('$baseURL/pokemon/$pokemon'));

  if (response.statusCode == 200) {
    searchPokemon = jsonPokeDecode(jsonDecode(response.body));
  } else {
    print("Moio");
  }

  return searchPokemon;
}

Pokemon jsonPokeDecode(final json) {
  return Pokemon(
    id: json["id"] ?? 0,
    isDefault: json["is_default"] ?? "",
    name: json["name"] ?? "",
    sprite: json["sprites"]["other"]["official-artwork"]["front_default"] ?? "",
    hp: json["stats"][0]["base_stat"] ?? 0,
    attack: json["stats"][1]["base_stat"] ?? 0,
    defense: json["stats"][2]["base_stat"] ?? 0,
    specialAttack: json["stats"][3]["base_stat"] ?? 0,
    specialDefense: json["stats"][4]["base_stat"] ?? 0,
    speed: json["stats"][5]["base_stat"] ?? 0,
    types: (json["types"] as List<dynamic>)
        .map((type) => type["type"]["name"] as String)
        .toList(),
    weight: json["weight"] ?? 0,
    height: json["height"] ?? 0,
  );
}
