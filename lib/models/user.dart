class User{
  final String id;
  final String nickname;
  final String email;
  final String profileImageUrl;


  User({
    required this.id,
    required this.nickname,
    required this.email,
    required this.profileImageUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      nickname: json['nickname'],
      email: json['email'],
      profileImageUrl: json['profileImageUrl'] ?? '', 
    );
  }
}