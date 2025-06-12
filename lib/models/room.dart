import 'character_model.dart';
import 'user_model.dart';
import 'message.dart';

class Room {
  final String id;
  final User user;
  final Character character;
  final List<Message> messages;

  Room({
    required this.id,
    required this.user,
    required this.character,
    required this.messages,
  });
}
