import 'package:flutter/material.dart';
import 'package:pokedex/views/components/constants.dart';

import 'home_screen.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _selectedIndex = 1;
  final List<Widget> _widgetOptions = const [
    Text('About'),
    Text('Stats'),
    Text('Evolution'),
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index; // Atualiza a opção selecionada
      });
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 209, 98, 90),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 209, 98, 90),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned(
            left: defaultpd * 2,
            top: defaultpd * 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '#001',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: defaultpd,
                ),
                const Text(
                  'Bubassaur',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
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
            ),
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
              height: size.height * 0.15,
              width: size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      _onItemTapped(0);
                    },
                    child: Container(
                      height: 40,
                      width: size.height * 0.12,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: _selectedIndex == 0
                            ? const Color.fromARGB(255, 209, 98, 90)
                            : const Color.fromARGB(0, 131, 131, 131),
                        width: 3,
                      ))),
                      child: Center(
                        child: Text(
                          'About',
                          style: TextStyle(
                            color: _selectedIndex == 0
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
                      _onItemTapped(1);
                    },
                    child: Container(
                      height: 40,
                      width: size.height * 0.12,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: _selectedIndex == 1
                            ? const Color.fromARGB(255, 209, 98, 90)
                            : const Color.fromARGB(0, 131, 131, 131),
                        width: 3,
                      ))),
                      child: Center(
                        child: Text(
                          'Stats',
                          style: TextStyle(
                            color: _selectedIndex == 1
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
                      _onItemTapped(2);
                    },
                    child: Container(
                      height: 40,
                      width: size.height * 0.12,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: _selectedIndex == 2
                            ? const Color.fromARGB(255, 209, 98, 90)
                            : const Color.fromARGB(0, 131, 131, 131),
                        width: 3,
                      ))),
                      child: Center(
                        child: Text(
                          'Evolution',
                          style: TextStyle(
                            color: _selectedIndex == 2
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
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                height: size.height,
                decoration: const BoxDecoration(color: Colors.white),
              )),
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
    );
  }
}

class EvolutionCard extends StatelessWidget {
  const EvolutionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultpd),
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/icons/pokeball.png',
                  color: const Color.fromARGB(255, 51, 51, 51).withOpacity(0.2),
                ),
                Positioned(
                  top: 20,
                  right: 20,
                  child: Image.network(
                    'https://nexus.traction.one/images/pokemon/pokemon/1.png',
                    height: defaultpd * 15,
                  ),
                ),
              ],
            ),
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
