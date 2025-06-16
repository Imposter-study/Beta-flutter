import 'package:flutter/material.dart';
import 'chat_screen.dart';

class ChatRoomsScreen extends StatelessWidget {
  const ChatRoomsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> chatRooms = ['제타 상담봇', '마음 일기 AI'];

    return Scaffold(
      appBar: AppBar(title: const Text('채팅방 목록')),
      body: ListView.builder(
        itemCount: chatRooms.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(chatRooms[index]),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(roomName: chatRooms[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}