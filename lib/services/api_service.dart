import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/character_model.dart';
import '../models/spell_model.dart';

class ApiService {
  static Future<List<CharacterModel>> getCharacters() async {
    final response = await http.get(
      Uri.parse('https://potterapi-fedeperin.vercel.app/en/characters'),
    );

    final data = jsonDecode(response.body);

    return List<CharacterModel>.from(
      data.map((e) => CharacterModel.fromJson(e)),
    );
  }

  static Future<List<SpellModel>> getSpells() async {
    final response = await http.get(
      Uri.parse('https://potterapi-fedeperin.vercel.app/en/spells'),
    );

    final data = jsonDecode(response.body);

    return List<SpellModel>.from(
      data.map((e) => SpellModel.fromJson(e)),
    );
  }
}