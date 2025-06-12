import 'package:flutter/material.dart';

class CreateCharacterScreen extends StatelessWidget {
  const CreateCharacterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('캐릭터 생성'),
        backgroundColor: Colors.black,
      ),
      body: const Center(
        child: Text('캐릭터 생성 화면', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
