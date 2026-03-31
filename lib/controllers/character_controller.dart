import 'package:flutter/material.dart';
import '../models/character_model.dart';
import '../services/api_service.dart';

class CharacterController extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<Character> _characters = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<Character> get characters => _characters;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> loadCharacters() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _characters = await _apiService.fetchCharacters();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}