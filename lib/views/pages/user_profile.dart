import 'package:flutter/material.dart';

import '../components/constants.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        title: const Text(
          'Profile',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: titleFontSize,
              color: Colors.black),
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultpd * 4),
          child: Center(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 185, 86, 79),
                    borderRadius: BorderRadius.circular(20)),
                child: const Center(
                  child: Text(
                    'SAIR',
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
