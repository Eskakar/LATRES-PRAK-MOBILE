import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

import 'controllers/auth_controller.dart';
import 'routes/app_routes.dart';
import 'services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('favorite_spells');

  await NotificationService.init();

  Get.put(AuthController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Harry Potter App',
      initialRoute:
          authController.isLoggedIn() ? Routes.characters : Routes.login,
      getPages: AppRoutes.routes,
    );
  }
}