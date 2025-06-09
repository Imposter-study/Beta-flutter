class User{
  final String id;
  final String nickname;
  final String email;
  final String profileImageUrl;

  // User 생성자
  User({
    required this.id,
    required this.nickname,
    required this.email,
    required this.profileImageUrl,
  });

  /// User 객체를 JSON으로 변환
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      nickname: json['nickname'],
      email: json['email'],
      profileImageUrl: json['profileImageUrl'] ?? '', // 기본값 설정
    );
  }
}