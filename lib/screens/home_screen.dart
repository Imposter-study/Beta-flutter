import 'package:flutter/material.dart';
import '../models/character.dart';
import '../services/chatbot_service.dart';
import '../widgets/character_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Character>> charactersFuture;
  final chatbotService = ChatbotService(baseUrl: 'https://api-base-url.com/api/chatbot');

  @override
  void initState() {
    super.initState();
    charactersFuture = chatbotService.fetchCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('캐릭터 목록')),
      body: FutureBuilder<List<Character>>(
        future: charactersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('오류 발생: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('캐릭터가 없습니다.'));
          } else {
            final characters = snapshot.data!;
            return ListView.builder(
              itemCount: characters.length,
              itemBuilder: (context, index) {
                return CharacterCard(character: characters[index]);
              },
            );
          }
        },
      ),
    );
  }
}