import 'package:flutter/material.dart';
import 'package:pokedex/views/components/constants.dart';

import '../../models/pokemon.dart';
import '../components/functions.dart';
import '../components/menu_pokemon.dart';
import 'home_screen.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.actualPoke});
  final Pokemon? actualPoke;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    int selectedIndex = 1;
    List<Widget> Cards = [
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
                      PokemonMenu(
                        selectedIndex: selectedIndex,
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
                          EvolutionPage(Cards: Cards)
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
    required this.Cards,
  });

  final List<Widget> Cards;

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
      itemCount: Cards.length, // Defina o número total de itens
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          child: Cards[index],
        );
      },
    );
  }
}

class PokemonInfo extends StatelessWidget {
  PokemonInfo({super.key, required this.actualPoke});

  Pokemon? actualPoke;
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
        const Row(
          children: [PokemonType(type: 'Grass'), PokemonType(type: 'Poison')],
        ),
      ],
    );
  }
}

class EvolutionCard extends StatelessWidget {
  EvolutionCard({super.key, required this.poke});

  Pokemon? poke;
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
