import 'package:flutter/material.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('채팅 목록'),
        backgroundColor: Colors.black,
      ),
      body: const Center(
        child: Text('채팅 목록 화면', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
