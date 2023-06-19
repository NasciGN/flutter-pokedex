import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex/views/components/constants.dart';

import '../../models/pokemon.dart';
import '../../modelsviews/pokeapi.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _pokemon = TextEditingController();
  Pokemon? thisPokemon;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: defaultpd * 3, vertical: defaultpd * 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(
                    top: defaultpd * 2, bottom: defaultpd * 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Pokédex',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: titleFontSize),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(Icons.person),
                    )
                  ],
                ),
              ),
              const Text(
                'Search for Pokémon by name or using the National Pokédex number:',
                style: TextStyle(
                    fontSize: sectionFontSize, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: defaultpd * 3,
              ),
              TextField(
                controller: _pokemon,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      fecthPokemon(_pokemon.text);
                    },
                    child: const Icon(
                      Icons.search,
                      color: Color.fromARGB(221, 88, 88, 88),
                    ),
                  ),
                  hintText: 'What Pokémon are you looking for?',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: defaultpd * 2, horizontal: defaultpd * 2),
                ),
                onSubmitted: (String value) async {
                  setState(() {
                    isLoading = true;
                  });
                  thisPokemon = await fecthPokemon(_pokemon.text);
                  setState(() {
                    isLoading = false;
                  });
                },
              ),
              const SizedBox(
                height: defaultpd * 5,
              ),
              isLoading
                  ? Text('Nothing to see here')
                  : PokemonCard(
                      pokemon: thisPokemon,
                    ),
              const SizedBox(
                height: defaultpd * 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    super.key,
    required this.pokemon,
  });

  final Pokemon? pokemon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/detail');
      },
      child: Container(
          height: 130,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 209, 98, 90),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(defaultpd * 2),
                child: Row(children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ("# ${pokemon?.id}"),
                        style: const TextStyle(
                            color: Color.fromARGB(255, 78, 47, 47),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        pokemon!.name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Row(
                        children: [
                          PokemonType(type: pokemon?.types[0]),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: defaultpd * 6),
                    child: Image.network(
                      'https://nexus.traction.one/images/pokemon/pokemon/1.png',
                      height: 100,
                    ),
                  )
                ]),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/icons/pokeball.png',
                  color: Colors.white.withOpacity(0.2),
                ),
              )
            ],
          )),
    );
  }
}

class PokemonType extends StatelessWidget {
  const PokemonType({super.key, required this.type});
  final String type;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: defaultpd),
      padding: const EdgeInsets.symmetric(
          horizontal: defaultpd * 2, vertical: defaultpd / 2),
      decoration: const BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Text(
        type,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
