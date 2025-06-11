import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String characterId;

  const ChatScreen({super.key, required this.characterId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('채팅 - 캐릭터 $characterId'),
      ),
      body: Center(
        child: Text('채팅 화면 개발 중...'),
      ),
    );
  }
}