import 'package:flutter/material.dart';
import '../controllers/character_controller.dart';

class CharacterListScreen extends StatefulWidget {
  const CharacterListScreen({super.key});

  @override
  State<CharacterListScreen> createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  final CharacterController _controller = CharacterController();

  @override
  void initState() {
    super.initState();
    _controller.loadCharacters();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Karakter Star Wars'),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: ListenableBuilder(
        listenable: _controller,
        builder: (context, child) {
          if (_controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (_controller.errorMessage.isNotEmpty) {
            return Center(
              child: Text(
                _controller.errorMessage,
                style: const TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
            );
          }

          if (_controller.characters.isEmpty) {
            return const Center(child: Text('Tidak ada karakter ditemukan.'));
          }

          return ListView.builder(
            itemCount: _controller.characters.length,
            itemBuilder: (context, index) {
              final character = _controller.characters[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: Text(
                    character.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('Tinggi: ${character.height} cm'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}