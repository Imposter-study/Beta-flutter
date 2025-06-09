class Message {
  final String id;
  final String text;
  final String isUser;
  final DateTime timestamp;

// Message 생성자
  Message({
    required this.id,
    required this.text,
    required this.isUser,
    required this.timestamp,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id:json['id'],
      text: json['text'],
      isUser:json['is_user'],
      timestamp:DateTime.parse(json['timestamp']),
    );
  }
}
