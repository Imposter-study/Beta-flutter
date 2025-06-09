import 'package:zeta/models/character.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


// 캐릭터 데이터를 백엔드 API에서 불러오는 클래스
class CharacterService{
  static Future<List<Character>> fetchCharacters() async{
    final response = await http.get(Uri.parse('https://api.example.com/characters'));

    if (response.statusCode ==200) {
      final List data =jsonDecode(response.body);
      return data.map((json) => Character.fromJson(json)).toList();
    }
    else{
      throw Exception('캐릭터 불러오기 실패');
    }
  }
}