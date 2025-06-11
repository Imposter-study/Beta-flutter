import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/chat_screen.dart';

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) =>  LoginScreen()),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/chat/:characterId',
      builder: (context, state) {
        final characterId = state.pathParameters['characterId']!;
        return ChatScreen(characterId: characterId);
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Beta Zeta Clone',
      routerConfig: _router,
      theme: ThemeData(primarySwatch: Colors.indigo),
    );
  }
}