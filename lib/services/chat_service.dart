// API서비스 클래스 이므로 추후 수정해야함

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:zeta/models/message.dart';

class ChatService{
  static Future<List<Message>> fetchMessages(String characterId) async {
    final response = await http.get(Uri.parse('https://api.example.com/characters/$characterId/messages'));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((json) => Message.fromJson(json)).toList();
    } 
    else {
      throw Exception('메시지 불러오기 실패');
    }
  }

//메세지 전송 (사용자가 보내는)
  static Future<Message> sendMessage(String characterId,String message) async {
    final response = await http.post(
      Uri.parse('https://api.example.com/chats/$characterId'),
      headers:{'content-Type':'application/json'},
      body: jsonEncode({'text':message}),
    );

    if (response.statusCode ==200) {
      final json = jsonDecode(response.body);
      return Message.fromJson(json);
    } 
    else {
      throw Exception('메시지 전송 실패');
    }
  }
}