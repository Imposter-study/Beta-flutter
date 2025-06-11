import 'package:flutter/material.dart';
import '../models/character.dart';
import 'package:go_router/go_router.dart';

class CharacterCard extends StatelessWidget {
  final Character character;

  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(character.profileImageUrl),
        ),
        title: Text(character.name),
        subtitle: Text(character.description),
        onTap: () {
          // 캐릭터 ID 넘겨서 채팅 화면으로 이동
          context.go('/chat/${character.id}');
        },
      ),
    );
  }
}