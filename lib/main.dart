// main.dart
import 'package:flutter/material.dart';
import 'screens/main_navigation_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zeta Chat',
      theme: ThemeData.dark(),
      home: const MainNavigationScreen(),
    );
  }
}