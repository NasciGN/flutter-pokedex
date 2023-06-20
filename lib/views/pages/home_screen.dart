import 'package:flutter/material.dart';
import 'package:pokedex/views/components/constants.dart';
import 'package:pokedex/views/components/functions.dart';
import 'package:pokedex/views/pages/detail_page.dart';
import 'package:get/get.dart';
import 'package:pokedex/views/pages/user_profile.dart';
import '../../models/pokemon.dart';
import '../../modelsviews/pokeapi.dart';
import 'login_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _pokemon = TextEditingController();
  Pokemon? thisPokemon;

  Future<void> allPokes() async {
    setState(() {
      isLoading = true;
    });
    cachedSearch.assignAll(await fetchPokemons());
    searchPokemons.assignAll(cachedSearch);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    allPokes();
    super.initState();
  }

  final searchPokemons = <Pokemon>[].obs;
  final cachedSearch = <Pokemon>[].obs;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                    onTap: () {
                      if (userOn()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const UserPage()));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()));
                      }
                    },
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
                prefixIcon: GestureDetector(
                  onTap: () async {
                    setState(() {
                      isLoading = true;
                    });
                    if (_pokemon.text.isEmpty && searchPokemons.length == 1) {
                      searchPokemons.assignAll(cachedSearch);
                    } else if (_pokemon.text.isNotEmpty) {
                      searchPokemons.assignAll([]);
                      List<Pokemon?> tempList =
                          await fecthPokemon(_pokemon.text);
                      searchPokemons.assignAll(tempList.whereType<Pokemon>());
                    } else {
                      searchPokemons.assignAll(cachedSearch);
                    }
                    setState(() {
                      isLoading = false;
                    });
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
                if (_pokemon.text.isEmpty && searchPokemons.length == 1) {
                  searchPokemons.assignAll(cachedSearch);
                } else if (_pokemon.text.isNotEmpty) {
                  searchPokemons.assignAll([]);
                  List<Pokemon?> tempList = await fecthPokemon(_pokemon.text);
                  searchPokemons.assignAll(tempList.whereType<Pokemon>());
                } else {
                  searchPokemons.assignAll(cachedSearch);
                }
                setState(() {
                  isLoading = false;
                });
              },
            ),
            const SizedBox(
              height: defaultpd,
            ),
            if (searchPokemons.isEmpty && isLoading)
              const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              )
            else
              searchPokemons[0].id == 0
                  ? Padding(
                      padding: const EdgeInsets.only(top: defaultpd),
                      child: Center(
                          child: Column(
                        children: [
                          Image(
                            image: AssetImage(searchPokemons[0].sprite),
                            height: 65,
                          ),
                          const SizedBox(
                            height: defaultpd * 5,
                          ),
                          const Text(
                            'Opss...',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: defaultpd * 3),
                          ),
                          const Text(
                            'No pokemon found',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: defaultpd * 2.5),
                          ),
                        ],
                      )),
                    )
                  : Expanded(
                      child: Obx(() => ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: searchPokemons.length,
                            padding: const EdgeInsets.symmetric(
                                vertical: defaultpd * 2),
                            itemBuilder: (BuildContext context, int index) {
                              return PokemonCard(
                                  pokemon: searchPokemons[index]);
                            },
                          )),
                    ),
          ],
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
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(
                      actualPoke: pokemon,
                    )));
      },
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: defaultpd),
          height: 130,
          decoration: BoxDecoration(
              color: Color(int.parse(pokemon!.color)),
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
                        formatNumber("${pokemon?.id}"),
                        style: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        formatString(pokemon!.name),
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Row(
                        children: pokemon!.types.map((type) {
                          return PokemonType(type: type);
                        }).toList(),
                      ),
                    ],
                  ),
                ]),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/icons/pokeball.png',
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
              Positioned(
                right: defaultpd * 5,
                top: defaultpd * 2,
                child: Container(
                  margin: const EdgeInsets.only(left: defaultpd * 12),
                  child: Image.network(
                    pokemon!.sprite,
                    height: 100,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class PokemonType extends StatelessWidget {
  const PokemonType({
    Key? key,
    required this.type,
  }) : super(key: key);

  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: defaultpd),
      padding: const EdgeInsets.symmetric(
        horizontal: defaultpd * 2,
        vertical: defaultpd / 2,
      ),
      decoration: const BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Text(
        formatString(type),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
