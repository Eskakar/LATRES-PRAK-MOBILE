import 'package:get/get.dart';

import '../models/character_model.dart';
import '../services/api_service.dart';

class CharacterController extends GetxController {
  var characters = <CharacterModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchCharacters();
    super.onInit();
  }

  void fetchCharacters() async {
    try {
      isLoading(true);
      final data = await ApiService.getCharacters();
      characters.assignAll(data);
    } finally {
      isLoading(false);
    }
  }
}