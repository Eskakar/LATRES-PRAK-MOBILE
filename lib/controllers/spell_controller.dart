import 'package:get/get.dart';
import 'package:hive_ce/hive_ce.dart';

import '../models/spell_model.dart';
import '../services/api_service.dart';
import '../services/notification_service.dart';

class SpellController extends GetxController {
  var spells = <SpellModel>[].obs;
  var favorites = <dynamic>[].obs;

  final box = Hive.box('favorite_spells');

  @override
  void onInit() {
    fetchSpells();
    loadFavorites();
    super.onInit();
  }

  void fetchSpells() async {
    final data = await ApiService.getSpells();
    spells.assignAll(data);
  }

  void loadFavorites() {
    favorites.assignAll(box.values.toList());
  }

  bool isFavorite(String spellName) {
    return favorites.any((e) => e['spell'] == spellName);
  }

  void toggleFavorite(SpellModel spell) async {
    if (isFavorite(spell.spell)) {
      final key = box.keys.firstWhere(
        (k) => box.get(k)['spell'] == spell.spell,
      );

      box.delete(key);

      Get.snackbar('Favorite', 'Spell dihapus dari favorite');
    } else {
      box.add(spell.toJson());

      Get.snackbar('Favorite', 'Spell ditambahkan ke favorite');
    }

    loadFavorites();
  }

  void removeFavorite(dynamic item) async {
    final key = box.keys.firstWhere(
      (k) => box.get(k)['spell'] == item['spell'],
    );

    box.delete(key);

    loadFavorites();

    await NotificationService.showNotification(
      'Favorite Dihapus',
      '${item['spell']} dihapus dari favorite',
    );
  }
}