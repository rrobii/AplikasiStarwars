import 'package:flutter/material.dart';
import 'screens/character_list_screen.dart';

void main() {
  runApp(const StarWarsApp());
}

class StarWarsApp extends StatelessWidget {
  const StarWarsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Star Wars',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const CharacterListScreen(),
    );
  }
}