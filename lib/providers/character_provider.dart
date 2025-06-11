import 'package:flutter/material.dart';
import 'package:zeta/models/character.dart';
import 'package:zeta/services/character_service.dart';

class CharacterProvider with ChangeNotifier {
  List<Character> _characters = [];
  bool _isLoading = false;

  List<Character> get characters => _characters;
  bool get isLoading => _isLoading;

  // 캐릭터 목록을 불러오는 메소드
  Future<void> loadCharacters() async {
    _isLoading = true;
    notifyListeners();

    try {
      _characters = await CharacterService.fetchCharacters();
    } catch (e) {
      print('캐릭터 불러오기 실패: $e');
      _characters = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
