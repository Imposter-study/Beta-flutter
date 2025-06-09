import 'dart:convert';

class Character {
  final String id;
  final String name;
  final String description;
  final String imageUrl;

  // Character 생성자
  Character({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'].toString(),
      name: json['name'],
      imageUrl: json['avatarUrl'],
      description: json['description'],
    );
  }
}
