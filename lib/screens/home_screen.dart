import 'package:flutter/material.dart';
import '../models/character.dart';
import '../services/chat_service.dart';
import '../widgets/character_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Character> _characters = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadCharacters();
  }

  Future<void> _loadCharacters() async {
    try {
      final characters = await ChatService.fetchCharacters();
      setState(() {
        _characters = characters;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = '캐릭터 불러오기 실패: $e';
        _isLoading = false;
      });
    }
  }

  void _onCharacterTap(Character character) {
    Navigator.pushNamed(context, '/chat', arguments: character);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('캐릭터 목록')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(child: Text(_error!))
              : ListView.builder(
                  itemCount: _characters.length,
                  itemBuilder: (context, index) {
                    final character = _characters[index];
                    return GestureDetector(
                      onTap: () => _onCharacterTap(character),
                      child: CharacterCard(character: character),
                    );
                  },
                ),
    );
  }
}