import 'package:flutter/material.dart';
import 'chat_rooms_screen.dart';
import 'create_ai_screen.dart';
import 'explore_screen.dart';
import 'home_screen.dart';
import 'my_page_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = const [
    HomeScreen(),
    ChatRoomsScreen(),
    CreateAIScreen(),
    ExploreScreen(),
    MyPageScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: '대화'),
          BottomNavigationBarItem(icon: Icon(Icons.create), label: '제작'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: '탐색'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이'),
        ],
      ),
    );
  }
}