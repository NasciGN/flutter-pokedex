import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PokemonMenu extends StatefulWidget {
  const PokemonMenu({super.key});

  @override
  State<PokemonMenu> createState() => _PokemonMenuState();
}

class _PokemonMenuState extends State<PokemonMenu> {
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Atualiza a opção selecionada
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
              color: _selectedIndex == 0
                  ? const Color.fromARGB(255, 209, 98, 90)
                  : const Color.fromARGB(0, 131, 131, 131),
              width: 3,
            ))),
            child: Center(
              child: Text(
                'About',
                style: TextStyle(
                  color: _selectedIndex == 0 ? Colors.black : Colors.grey,
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
                  color: _selectedIndex == 1 ? Colors.black : Colors.grey,
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
                  color: _selectedIndex == 2 ? Colors.black : Colors.grey,
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
