import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/character.dart';
import '../models/message.dart';

class ChatService {
  final String baseUrl = 'https://www.ddddd.com/api/chatbot'; // 실제 API 주소로 교체
  final String token;

  ChatService({required this.token});

  Future<List<Character>> fetchCharacters() async {
    final url = Uri.parse('$baseUrl/characters/');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => Character.fromJson(e)).toList();
    } else {
      throw Exception('캐릭터 목록 불러오기 실패: ${response.body}');
    }
  }

  Future<List<Message>> fetchMessages(String roomId) async {
    final url = Uri.parse('$baseUrl/rooms/$roomId/messages');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => Message.fromJson(e)).toList();
    } else {
      throw Exception('메시지 불러오기 실패: ${response.body}');
    }
  }

  Future<void> sendMessage(String roomId, String content) async {
    final url = Uri.parse('$baseUrl/rooms/$roomId/messages');
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'content': content}),
    );

    if (response.statusCode != 201) {
      throw Exception('메시지 전송 실패: ${response.body}');
    }
  }

  Future<String> getOrCreateRoom(String characterId) async {
    final url = Uri.parse('$baseUrl/rooms/');
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'character_id': characterId}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      return data['room_id'];
    } else {
      throw Exception('채팅방 생성 실패: ${response.body}');
    }
  }
}
