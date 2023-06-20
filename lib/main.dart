import 'package:flutter/material.dart';
import 'package:pokedex/views/pages/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'modelsviews/firebase/firebase_options.dart';

Future<void> main() async {
  /* WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); */
  runApp(GetMaterialApp(
    initialRoute: '/home',
    getPages: [
      GetPage(name: '/home', page: () => const HomeScreen()),
    ],
  ));
}
