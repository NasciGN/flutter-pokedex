import 'package:flutter/material.dart';

class PokemonMenu extends StatefulWidget {
  const PokemonMenu({super.key, required this.selectedIndex});
  final int selectedIndex;
  @override
  State<PokemonMenu> createState() => _PokemonMenuState();
}

class _PokemonMenuState extends State<PokemonMenu> {
  int selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index; // Atualiza a opção selecionada
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Row(
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
              color: selectedIndex == 0
                  ? const Color.fromARGB(255, 209, 98, 90)
                  : const Color.fromARGB(0, 131, 131, 131),
              width: 3,
            ))),
            child: Center(
              child: Text(
                'About',
                style: TextStyle(
                  color: selectedIndex == 0 ? Colors.black : Colors.grey,
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
              color: selectedIndex == 1
                  ? const Color.fromARGB(255, 209, 98, 90)
                  : const Color.fromARGB(0, 131, 131, 131),
              width: 3,
            ))),
            child: Center(
              child: Text(
                'Stats',
                style: TextStyle(
                  color: selectedIndex == 1 ? Colors.black : Colors.grey,
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
              color: selectedIndex == 2
                  ? const Color.fromARGB(255, 209, 98, 90)
                  : const Color.fromARGB(0, 131, 131, 131),
              width: 3,
            ))),
            child: Center(
              child: Text(
                'Evolution',
                style: TextStyle(
                  color: selectedIndex == 2 ? Colors.black : Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
