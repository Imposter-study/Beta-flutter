import 'package:flutter/material.dart';
import '../services/openai_service.dart';

class ChatController extends ChangeNotifier {
  final OpenAIService openAIService;

  List<Map<String, String>> messages = [];

  ChatController({required this.openAIService});

  Future<void> sendMessage(String message) async {
    messages.add({'role': 'user', 'content': message});
    notifyListeners();

    try {
      final response = await openAIService.sendChatMessage(message);
      messages.add({'role': 'assistant', 'content': response});
      notifyListeners();
    } catch (e) {
      messages.add({'role': 'assistant', 'content': '오류가 발생했습니다.'});
      notifyListeners();
    }
  }

  void clearMessages() {
    messages.clear();
    notifyListeners();
  }
}
