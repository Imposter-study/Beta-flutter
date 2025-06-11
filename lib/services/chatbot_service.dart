import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/character.dart';

class ChatbotService {
  final String baseUrl;

  ChatbotService({required this.baseUrl});

  Future<List<Character>> fetchCharacters() async {
    final response = await http.get(Uri.parse('$baseUrl/characters'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((e) => Character.fromJson(e)).toList();
    } else {
      throw Exception('캐릭터 목록 조회 실패');
    }
  }
}