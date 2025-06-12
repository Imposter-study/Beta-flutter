import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/character.dart';

class ChatService {
  final String baseUrl = 'https://your-api-domain.com/api/chatbot'; // 실제 API 주소로 교체

  Future<List<Character>> fetchCharacters(String token) async {
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
}