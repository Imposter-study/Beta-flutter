import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/chat_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/chat/:id',
      builder: (context, state) {
        final id = state.params['id']!;
        return ChatScreen(characterId: id);
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Beta Zeta Clone',
      routerConfig: router,
      theme: ThemeData(primarySwatch: Colors.indigo),
    );
  }
}