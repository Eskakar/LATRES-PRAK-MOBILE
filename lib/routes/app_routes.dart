import 'package:get/get.dart';
import 'package:herry_app/bindings/spell_binding.dart';

import '../views/character_view.dart';
import '../views/detail_character_view.dart';
import '../views/favorite_spells_view.dart';
import '../views/login_view.dart';
import '../views/spells_view.dart';
import '../views/main_navigation_view.dart';
import '../bindings/character_binding.dart';

class Routes {
  static const login = '/login';
  static const characters = '/characters';
  static const detailCharacter = '/detail-character';
  static const spells = '/spells';
  static const favoriteSpells = '/favorite-spells';
  static const mainNavigation = '/main-navigation';
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
      binding: CharacterBinding(),
    ),
    GetPage(
      name: Routes.detailCharacter,
      page: () => DetailCharacterView(),
    ),
    GetPage(
      name: Routes.spells,
      page: () => SpellsView(),
      binding: SpellBinding(),
    ),
    GetPage(
      name: Routes.favoriteSpells,
      page: () => FavoriteSpellsView(),
    ),
    GetPage(
      name: Routes.mainNavigation,
      page: () => MainNavigationView(),
    ),
  ];
}