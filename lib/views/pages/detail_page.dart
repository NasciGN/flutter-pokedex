import 'package:flutter/material.dart';
import 'package:pokedex/views/components/constants.dart';

import '../components/menu_pokemon.dart';
import 'home_screen.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final List<Widget> _widgetOptions = const [
    Text('About'),
    Text('Stats'),
    Text('Evolution'),
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 209, 98, 90),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 209, 98, 90),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Stack(
            children: [
              const Positioned(
                left: defaultpd * 2,
                top: defaultpd * 2,
                child: PokemonInfo(),
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
                      const PokemonMenu(),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(defaultpd),
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 40,
                          crossAxisCount: 2,
                        ),
                        itemCount: 1, // Defina o número total de itens
                        itemBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: double.infinity,
                            child: EvolutionCard(),
                          );
                        },
                      ),
                      EvolutionCard()
                    ],
                  ),
                ),
              ),
              Positioned(
                top: defaultpd * 8,
                right: defaultpd * 6,
                child: Image.network(
                  'https://nexus.traction.one/images/pokemon/pokemon/1.png',
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

class PokemonInfo extends StatelessWidget {
  const PokemonInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '#001',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: defaultpd,
        ),
        const Text(
          'Bubassaur',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        const SizedBox(
          height: defaultpd * 2,
        ),
        Row(
          children: const [
            PokemonType(type: 'Grass'),
            PokemonType(type: 'Poison')
          ],
        ),
      ],
    );
  }
}

class EvolutionCard extends StatelessWidget {
  const EvolutionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.25,
      width: size.height * 0.2,
      decoration: const BoxDecoration(
          color: Colors.red,
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
                  'https://nexus.traction.one/images/pokemon/pokemon/1.png',
                  height: size.height * 0.14,
                ),
              ),
            ],
          ),
          const Text(
            '#001',
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Bulbasaur',
            style: TextStyle(
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
