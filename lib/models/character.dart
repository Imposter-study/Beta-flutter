class Character {
  final String id;
  final String name;
  final String profileImageUrl;
  final String description;

  Character({
    required this.id,
    required this.name,
    required this.profileImageUrl,
    required this.description,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      profileImageUrl: json['profileImageUrl'] ?? '', // 예외 방지
      description: json['description'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'profile_image_url': profileImageUrl,
      'description': description,
    };
  }
}