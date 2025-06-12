import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  List<Map<String, String>> _messages = [];

  List<Map<String, String>> get messages => _messages;

  void addMessage(String role, String content) {
    _messages.add({'role': role, 'content': content});
    notifyListeners();
  }

  void clearMessages() {
    _messages.clear();
    notifyListeners();
  }
}
