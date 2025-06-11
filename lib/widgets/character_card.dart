import 'package:flutter/material.dart';
import '../models/character.dart';

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
          // TODO: 캐릭터 선택 → 채팅방 이동
        },
      ),
    );
  }
}