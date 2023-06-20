import 'package:flutter/material.dart';
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
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
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
                          PokemonInfo(
                            actualPoke: widget.actualPoke,
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
    return Text("${actualPoke!.name}");
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
