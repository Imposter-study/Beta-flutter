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
      id: json['id'].toString(),
      name: json['name'] ?? '',
      profileImageUrl: json['profile_image_url'] ?? '',
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