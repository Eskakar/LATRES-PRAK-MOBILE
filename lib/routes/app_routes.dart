import 'package:get/get.dart';

import '../views/character_view.dart';
import '../views/detail_character_view.dart';
import '../views/favorite_spells_view.dart';
import '../views/login_view.dart';
import '../views/spells_view.dart';

class Routes {
  static const login = '/login';
  static const characters = '/characters';
  static const detailCharacter = '/detail-character';
  static const spells = '/spells';
  static const favoriteSpells = '/favorite-spells';
}

class AppRoutes {
  static final routes = [
    GetPage(
      name: Routes.login,
      page: () => LoginView(),
    ),
    GetPage(
      name: Routes.characters,
      page: () => CharacterView(),
    ),
    GetPage(
      name: Routes.detailCharacter,
      page: () => DetailCharacterView(),
    ),
    GetPage(
      name: Routes.spells,
      page: () => SpellsView(),
    ),
    GetPage(
      name: Routes.favoriteSpells,
      page: () => FavoriteSpellsView(),
    ),
  ];
}