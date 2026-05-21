import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/spell_controller.dart';

class FavoriteSpellsView extends StatelessWidget {
  FavoriteSpellsView({super.key});

  final SpellController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Spells'),
      ),
      body: Obx(() {
        if (controller.favorites.isEmpty) {
          return const Center(
            child: Text('Belum ada spell favorite'),
          );
        }

        return ListView.builder(
          itemCount: controller.favorites.length,
          itemBuilder: (context, index) {
            final spell = controller.favorites[index];

            return Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              child: ListTile(
                title: Text(spell['spell']),
                subtitle: Text(spell['use']),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    controller.removeFavorite(spell);
                  },
                ),
              ),
            );
          },
        );
      }),
    );
  }
}