import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:pokedex/models/pokemon.dart';

String baseURL = 'https://pokeapi.co/api/v2';

bool isPokemonCode(String text) {
  final regex = RegExp(r'\d');
  return regex.hasMatch(text);
}

Future<List<Pokemon?>> fecthPokemon(String pokemon) async {
  Pokemon? searchPokemon;
  List<Pokemon> tempList = [];
  if (!isPokemonCode(pokemon)) {
    pokemon = pokemon.toLowerCase();
  }

  final http.Response response =
      await http.get(Uri.parse('$baseURL/pokemon/$pokemon'));

  if (response.statusCode == 200) {
    searchPokemon = jsonPokeDecode(jsonDecode(response.body));

    tempList = [searchPokemon];
  } else {
    return tempList = [
      Pokemon(
          id: 0,
          isDefault: false,
          name: '',
          sprite: 'assets/images/error-search.png',
          hp: 0,
          attack: 0,
          defense: 0,
          specialAttack: 0,
          specialDefense: 0,
          speed: 0,
          types: [],
          weight: 0,
          height: 0,
          color: '')
    ];
  }

  return tempList;
}

Future<List<Pokemon>> fetchPokemons() async {
  List<Pokemon> pokemons = [];

  final http.Response response =
      await http.get(Uri.parse('$baseURL/pokemon?limit=10'));

  if (response.statusCode == 200) {
    var pokemon = jsonDecode(response.body)["results"];
    for (var poke in pokemon) {
      final http.Response response = await http.get(Uri.parse(poke["url"]));
      pokemons.add(jsonPokeDecode(jsonDecode(response.body)));
      print("Pokemon ${poke["url"]} adicionado");
    }
  }
  return pokemons;
}

Pokemon jsonPokeDecode(final json) {
  return Pokemon(
    id: json["id"] ?? 0,
    isDefault: json["is_default"] ?? false,
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
    color: '',
  );
}
