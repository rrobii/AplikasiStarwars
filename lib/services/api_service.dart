import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/character_model.dart';

class ApiService {
  static const String _baseUrl = 'https://swapi.dev/api';

  Future<List<Character>> fetchCharacters() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/people/'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> results = data['results'];
        
        return results.map((json) => Character.fromJson(json)).toList();
      } else {
        throw Exception('Gagal memuat data. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Terjadi kesalahan jaringan: $e');
    }
  }
}