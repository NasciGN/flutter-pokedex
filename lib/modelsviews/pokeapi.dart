// https://pokeapi.co/api/v2/pokemon/ditto
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/models/pokemon.dart';

class PokemonApiService {
  String baseURL = 'https://pokeapi.co/api/v2';

  Future<Pokemon?> fecthPokemon(String pokemon) async {
    Pokemon? searchPokemon;
    final http.Response response =
        await http.get(Uri.parse('$baseURL/pokemon/$pokemon'));
    if (response.statusCode == 200) {
      searchPokemon = jsonPokeDecode(jsonDecode(response.body));
    }

    return searchPokemon;
  }

  Pokemon jsonPokeDecode(final json) {
    return Pokemon(
      id: json["id"] ?? "",
      isDefault: json["id"] ?? "",
      name: json["id"] ?? "",
      sprite: json["id"] ?? "",
      hp: json["id"] ?? "",
      defense: json["id"] ?? "",
      specialAttack: json["id"] ?? "",
      specialDefense: json["id"] ?? "",
      speed: json["id"] ?? "",
      types: json["types"]["type"]["name"] ?? "",
      weight: json["id"] ?? "",
      height: json["id"] ?? "",
    );
  }
}
