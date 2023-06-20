import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pokedex/modelsviews/locapi.dart';
import 'package:pokedex/views/components/constants.dart';

import '../../models/pokemon.dart';
import '../components/functions.dart';

import 'home_screen.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.actualPoke});
  final Pokemon? actualPoke;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedIndex = 0;
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    final Size size = MediaQuery.of(context).size;

    List<Widget> cards = [
      EvolutionCard(
        poke: widget.actualPoke,
      ),
      EvolutionCard(
        poke: widget.actualPoke,
      ),
      EvolutionCard(
        poke: widget.actualPoke,
      ),
    ];

    return Scaffold(
      backgroundColor: Color(int.parse(widget.actualPoke!.color)),
      appBar: AppBar(
        backgroundColor: Color(int.parse(widget.actualPoke!.color)),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: defaultpd * 2, horizontal: defaultpd * 2),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              child: isFavorite
                  ? const FaIcon(
                      FontAwesomeIcons.heart,
                      color: Colors.white,
                    )
                  : const FaIcon(
                      FontAwesomeIcons.solidHeart,
                      color: Colors.white,
                    ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height - 40,
          child: Stack(
            children: [
              Positioned(
                left: defaultpd * 2,
                top: defaultpd * 2,
                child: PokemonInfo(actualPoke: widget.actualPoke),
              ),
              Positioned(
                top: defaultpd * 2,
                right: 0,
                child: Image.asset(
                  'assets/images/icons/pokeball.png',
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
              Positioned(
                top: size.height * 0.2,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultpd * 2, vertical: defaultpd * 6),
                  height: size.height,
                  width: size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45),
                          topRight: Radius.circular(45))),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _onItemTapped(0);
                              });
                            },
                            child: Container(
                              height: 40,
                              width: size.height * 0.12,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                color: selectedIndex == 0
                                    ? const Color.fromARGB(255, 209, 98, 90)
                                    : const Color.fromARGB(0, 131, 131, 131),
                                width: 3,
                              ))),
                              child: Center(
                                child: Text(
                                  'About',
                                  style: TextStyle(
                                    color: selectedIndex == 0
                                        ? Colors.black
                                        : Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _onItemTapped(1);
                              });
                            },
                            child: Container(
                              height: 40,
                              width: size.height * 0.12,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                color: selectedIndex == 1
                                    ? const Color.fromARGB(255, 209, 98, 90)
                                    : const Color.fromARGB(0, 131, 131, 131),
                                width: 3,
                              ))),
                              child: Center(
                                child: Text(
                                  'Stats',
                                  style: TextStyle(
                                    color: selectedIndex == 1
                                        ? Colors.black
                                        : Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _onItemTapped(2);
                              });
                            },
                            child: Container(
                              height: 40,
                              width: size.height * 0.12,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                color: selectedIndex == 2
                                    ? const Color.fromARGB(255, 209, 98, 90)
                                    : const Color.fromARGB(0, 131, 131, 131),
                                width: 3,
                              ))),
                              child: Center(
                                child: Text(
                                  'Evolution',
                                  style: TextStyle(
                                    color: selectedIndex == 2
                                        ? Colors.black
                                        : Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      IndexedStack(
                        index: selectedIndex,
                        children: [
                          AboutPage(
                            pokemon: widget.actualPoke,
                          ),
                          PokemonStats(actualPoke: widget.actualPoke),
                          EvolutionPage(cards: cards)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: defaultpd * 8,
                right: defaultpd * 6,
                child: Image.network(
                  widget.actualPoke!.sprite,
                  height: defaultpd * 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key, required this.pokemon});

  final Pokemon? pokemon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce a consequat mi, in vestibulum velit. Nam vel lorem nec orci sagittis dictum et sed lorem. Nullam ac elit ultrices, tempus mi ac, posuere odio.',
            style: TextStyle(
              fontSize: titleFontSize * 0.5,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(
              horizontal: defaultpd * 6, vertical: defaultpd * 3),
          padding: const EdgeInsets.symmetric(vertical: defaultpd * 2),
          width: double.infinity,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // Cor da sombra
                offset: const Offset(0, 3), // Deslocamento da sombra (x, y)
                blurRadius: 4, // Raio de desfoque da sombra
                spreadRadius: 2, // Propagação da sombra
              ),
            ],
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Height',
                  style: TextStyle(
                      color: Color.fromARGB(255, 117, 115, 115),
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  '${pokemon!.height / 10} m | ${pokemon!.height * 10} cm',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              children: [
                const Text(
                  'Weight',
                  style: TextStyle(
                      color: Color.fromARGB(255, 117, 115, 115),
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  '${pokemon!.weight / 10} Kg ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ]),
        ),
        const SizedBox(
          height: 150,
        ),
        GestureDetector(
          onTap: () {
            fetchLocation();
          },
          child: Container(
            width: 200,
            height: 60,
            decoration: BoxDecoration(
                color: Color(int.parse(pokemon!.color)),
                borderRadius: BorderRadius.circular(20)),
            child: const Center(
              child: Text(
                'Location',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    letterSpacing: 2),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class InfoRow extends StatelessWidget {
  const InfoRow({
    super.key,
    required this.pokemon,
    required this.info,
  });

  final String pokemon;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
            width: 100,
            child: Text(
              '$info:',
              style: const TextStyle(
                  fontSize: 18, color: Color.fromARGB(255, 133, 133, 133)),
            )),
        Text(
          formatString(pokemon),
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 51, 49, 49)),
        )
      ],
    );
  }
}

class EvolutionPage extends StatelessWidget {
  const EvolutionPage({
    super.key,
    required this.cards,
  });

  final List<Widget> cards;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(defaultpd),
      physics: const NeverScrollableScrollPhysics(),

      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount: 2,
          childAspectRatio: 0.75),
      itemCount: cards.length, // Defina o número total de itens
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          child: cards[index],
        );
      },
    );
  }
}

class PokemonStats extends StatelessWidget {
  const PokemonStats({super.key, required this.actualPoke});
  final Pokemon? actualPoke;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultpd * 2),
          child: Text(
            'Base Stats',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: titleFontSize * 0.9,
                color: Color(int.parse(actualPoke!.color))),
          ),
        ),
        StatsBar(
          attribute: actualPoke!.hp,
          stat: 'HP',
          max: 255,
          color: actualPoke!.color,
        ),
        StatsBar(
          attribute: actualPoke!.attack,
          stat: 'Attack',
          max: 190,
          color: actualPoke!.color,
        ),
        StatsBar(
          attribute: actualPoke!.defense,
          stat: 'Defense',
          max: 230,
          color: actualPoke!.color,
        ),
        StatsBar(
          attribute: actualPoke!.specialAttack,
          stat: 'Sp. Attack',
          max: 195,
          color: actualPoke!.color,
        ),
        StatsBar(
          attribute: actualPoke!.specialDefense,
          stat: 'Sp. Defense',
          max: 230,
          color: actualPoke!.color,
        ),
        StatsBar(
          attribute: actualPoke!.speed,
          stat: 'Speed',
          max: 180,
          color: actualPoke!.color,
        ),
        const SizedBox(
          height: 10,
        ),
        StatsBar(
          attribute: actualPoke!.hp +
              actualPoke!.attack +
              actualPoke!.defense +
              actualPoke!.specialAttack +
              actualPoke!.specialDefense +
              actualPoke!.speed,
          stat: 'Total',
          max: 255 + 190 + 230 + 195 + 230 + 180,
          color: actualPoke!.color,
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              fetchLocation();
            },
            child: Container(
              width: 200,
              height: 60,
              decoration: BoxDecoration(
                  color: Color(int.parse(actualPoke!.color)),
                  borderRadius: BorderRadius.circular(20)),
              child: const Center(
                child: Text(
                  'Location',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      letterSpacing: 2),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

//
class StatsBar extends StatelessWidget {
  const StatsBar(
      {super.key,
      required this.attribute,
      required this.stat,
      required this.max,
      required this.color});

  final int attribute;
  final int max;
  final String stat;
  final String color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: defaultpd / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              width: 80,
              child: Text(
                stat,
                style: const TextStyle(fontWeight: FontWeight.bold),
              )),
          LinearPercentIndicator(
            width: 240.0,
            lineHeight: 8.0,
            percent: attribute / max,
            progressColor: Color(int.parse(color)),
            barRadius: const Radius.circular(20),
          ),
          Text('$max')
        ],
      ),
    );
  }
}

class PokemonInfo extends StatelessWidget {
  const PokemonInfo({super.key, required this.actualPoke});

  final Pokemon? actualPoke;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          formatNumber("${actualPoke?.id}"),
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: defaultpd,
        ),
        Text(
          formatString(actualPoke!.name),
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        const SizedBox(
          height: defaultpd * 2,
        ),
        Row(
          children: actualPoke!.types.map((type) {
            return PokemonType(type: type);
          }).toList(),
        ),
      ],
    );
  }
}

class EvolutionCard extends StatelessWidget {
  const EvolutionCard({super.key, required this.poke});

  final Pokemon? poke;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.25,
      width: size.height * 0.2,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 250, 250, 250),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/icons/pokeball.png',
                color: const Color.fromARGB(255, 51, 51, 51).withOpacity(0.2),
                height: size.height * 0.2,
              ),
              Positioned(
                top: 40,
                right: 25,
                child: Image.network(
                  poke!.sprite,
                  height: size.height * 0.14,
                ),
              ),
            ],
          ),
          Text(
            formatNumber("${poke?.id}"),
            style: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            formatString(poke!.name),
            style: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
