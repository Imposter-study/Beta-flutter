import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl = 'https://your-api.com/accounts';

  static Future<void> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final token = data['accessToken'];
      // TODO: 토큰 저장 (예: Provider나 SharedPreferences)
      print('로그인 성공, 토큰: $token');
    } else {
      throw Exception('로그인 실패');
    }
  }
}
