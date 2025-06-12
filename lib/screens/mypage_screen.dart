import 'package:flutter/material.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('마이페이지'),
        backgroundColor: Colors.black,
      ),
      body: const Center(
        child: Text('마이페이지 화면', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
