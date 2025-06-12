import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  Future<Map<String, String>> login(String email, String password) async {
    // 실제 API 요청 코드
    final response = await http.post(
      Uri.parse('https://dddd.com/api/login/'),
      body: {'email': email, 'password': password},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return {
        'token': data['token'],
        'userId': data['user']['id'], // 또는 서버 응답 구조에 맞게 수정
      };
    } else {
      throw Exception('로그인 실패');
    }
  }
}