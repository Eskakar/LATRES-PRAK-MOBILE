import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../controllers/spell_controller.dart';
import '../routes/app_routes.dart';

class SpellsView extends GetView<SpellController> {
  SpellsView({super.key});

  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Harry Potter Spells'),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.favoriteSpells);
            },
            icon: const Icon(Icons.favorite),
          ),
          IconButton(
            onPressed: () {
              authController.logout();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.spells.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          itemCount: controller.spells.length,
          itemBuilder: (context, index) {
            final spell = controller.spells[index];

            return Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              child: ListTile(
                title: Text(spell.spell),
                subtitle: Text(spell.use),
                trailing: IconButton(
                  icon: Icon(
                    controller.isFavorite(spell.spell)
                        ? Icons.favorite
                        : Icons.favorite_border,
                  ),
                  onPressed: () {
                    controller.toggleFavorite(spell);
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