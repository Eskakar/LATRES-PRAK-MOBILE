import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/character_model.dart';

class DetailCharacterView extends StatelessWidget {
  DetailCharacterView({super.key});

  final CharacterModel character = Get.arguments;

  Widget buildItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(value.isEmpty ? '-' : value),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.fullName),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  character.image,
                  height: 250,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) {
                    return const Icon(
                      Icons.person,
                      size: 120,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            buildItem('Full Name', character.fullName),
            buildItem('Nickname', character.nickname),
            buildItem('Hogwarts House', character.hogwartsHouse),
            buildItem('Actor', character.interpretedBy),
            buildItem('Birthdate', character.birthdate),
          ],
        ),
      ),
    );
  }
}