import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = 'https://your-api-domain.com/api/accounts'; // 실제 API 주소로 교체

  Future<String> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/login/');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['access']; // JWT access 토큰
    } else {
      throw Exception('로그인 실패: ${response.body}');
    }
  }
}