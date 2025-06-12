import 'package:flutter/material.dart';
import '../models/character_model.dart';

class CharacterProvider extends ChangeNotifier {
  List<Character> _characters = [];

  List<Character> get characters => _characters;

  void setCharacters(List<Character> characters) {
    _characters = characters;
    notifyListeners();
  }

  void addCharacter(Character character) {
    _characters.add(character);
    notifyListeners();
  }

  void removeCharacter(String id) {
    _characters.removeWhere((c) => c.id == id);
    notifyListeners();
  }
}
