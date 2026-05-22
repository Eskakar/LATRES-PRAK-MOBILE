import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../controllers/character_controller.dart';
import '../routes/app_routes.dart';

class CharacterView extends GetView<CharacterController> {
  CharacterView({super.key});

  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Harry Potter Characters'),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.spells);
            },
            icon: const Icon(Icons.auto_fix_high),
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
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (controller.characters.isEmpty) {
          return const Center(
            child: Text('Data character kosong'),
          );
        }

        return ListView.builder(
          itemCount: controller.characters.length,
          itemBuilder: (context, index) {
            final character = controller.characters[index];

            return Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    character.image,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) {
                      return const Icon(
                        Icons.person,
                        size: 50,
                      );
                    },
                  ),
                ),
                title: Text(character.fullName),
                subtitle: Text(character.hogwartsHouse),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Get.toNamed(
                    Routes.detailCharacter,
                    arguments: character,
                  );
                },
              ),
            );
          },
        );
      }),
    );
  }
}