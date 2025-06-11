import 'package:flutter/material.dart';
import 'package:zeta/models/message.dart';
import 'package:zeta/services/chat_service.dart';

///채팅방 메세지 관리 Provider

class ChatProvider with ChangeNotifier{
  List<Message> _messages =[];
  bool _isLoading = false;

  List<Message> get messages=> _messages;
  bool get isLoading => _isLoading;

  // 채팅방 기록 불러오기
  Future<void> loadMessages(String characterId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _messages = await ChatService.fetchMessages(characterId);
    } catch(e) {
      print('메시지 불러오기 실패: $e');
      _messages = [];
    } finally {
      _isLoading = false;
      notifyListeners(); 
    }
  }
  
  // 메세지 전송
  Future<void> sendMessage(String CharacterId, String text) async {
    try {
      final sentMessage = await ChatService.sendMessage(CharacterId, text);
      _messages.add(sentMessage);
      notifyListeners();
    } catch (e) {
      print(' 메세지 전송실패: $e');
    }
  }
}