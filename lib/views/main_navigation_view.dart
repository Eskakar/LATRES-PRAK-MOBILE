import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/navigation_controller.dart';
import 'character_view.dart';
import 'favorite_spells_view.dart';
import 'spells_view.dart';

class MainNavigationView extends StatelessWidget {
  MainNavigationView({super.key});

  final NavigationController controller =
      Get.put(NavigationController());

  final List<Widget> pages = [
    CharacterView(),
    SpellsView(),
    FavoriteSpellsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: controller.selectedIndex.value,
          children: pages,
        ),

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,

          onTap: (index) {
            controller.changeIndex(index);
          },

          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Characters',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.auto_fix_high),
              label: 'Spells',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
          ],
        ),
      ),
    );
  }
}