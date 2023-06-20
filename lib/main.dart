import 'package:flutter/material.dart';

import 'package:pokedex/views/pages/home_screen.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/home': (_) => const HomeScreen(),
    },
  ));
}
