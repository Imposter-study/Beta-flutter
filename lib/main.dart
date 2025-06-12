import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/chat_list_screen.dart';
import 'screens/create_character_screen.dart';
import 'screens/mypage_screen.dart';
import 'package:provider/provider.dart';
import 'providers/character_provider.dart';
import 'providers/user_provider.dart';
import 'providers/chat_provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => CharacterProvider()),
        ChangeNotifierProvider(create: (_) => ChatProvider()),
      ],
      child: const ZetaApp(),
    ),
  );
}

class ZetaApp extends StatelessWidget {
  const ZetaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZETA Clone',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'Pretendard',
      ),
      home: const RootPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    ChatListScreen(),
    CreateCharacterScreen(),
    MyPageScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: '채팅'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined), label: '캐릭터'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: '마이페이지'),
        ],
      ),
    );
  }
}
