import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/character.dart';
import '../providers/user_provider.dart';
import '../services/chat_service.dart';
import '../widgets/character_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ChatService _chatService;
  late Future<List<Character>> _futureCharacters;

  @override
  void initState() {
    super.initState();
    final token = Provider.of<UserProvider>(context, listen: false).token!;
    _chatService = ChatService(token: token);
    _futureCharacters = _chatService.fetchCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('캐릭터 목록')),
      body: FutureBuilder<List<Character>>(
        future: _futureCharacters,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('에러: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('캐릭터가 없습니다.'));
          }

          final characters = snapshot.data!;
          return ListView.builder(
            itemCount: characters.length,
            itemBuilder: (context, index) {
              return CharacterCard(character: characters[index]);
            },
          );
        },
      ),
    );
  }
}