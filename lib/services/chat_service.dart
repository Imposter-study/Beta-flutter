import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/character.dart';

class ChatService {
  static const String baseUrl = 'https://your-api.com/api'; // 실제 API 주소로 변경

  static Future<List<Character>> fetchCharacters() async {
    final response = await http.get(Uri.parse('$baseUrl/chatbot/characters'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((e) => Character.fromJson(e)).toList();
    } else {
      throw Exception('캐릭터 불러오기 실패');
    }
  }
}