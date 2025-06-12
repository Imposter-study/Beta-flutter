import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../models/character.dart';
import '../providers/user_provider.dart';
import '../services/chat_service.dart';

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
        onTap: () async {
          final token = Provider.of<UserProvider>(context, listen: false).token!;
          final chatService = ChatService(token: token);

          try {
            final roomId = await chatService.getOrCreateRoom(character.id);
            context.push('/chat/$roomId');
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('채팅방 이동 실패: $e')),
            );
          }
        },
      ),
    );
  }
}