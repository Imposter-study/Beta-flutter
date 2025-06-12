import 'package:flutter/material.dart';
import '../models/message.dart';
import '../services/chat_service.dart';

class ChatProvider extends ChangeNotifier {
  final ChatService chatService;
  final String roomId;

  List<Message> _messages = [];
  List<Message> get messages => _messages;

  ChatProvider({required this.chatService, required this.roomId});

  Future<void> loadMessages() async {
    _messages = await chatService.fetchMessages(roomId);
    notifyListeners();
  }

  Future<void> sendMessage(String content) async {
    await chatService.sendMessage(roomId, content);
    await loadMessages();
  }
}