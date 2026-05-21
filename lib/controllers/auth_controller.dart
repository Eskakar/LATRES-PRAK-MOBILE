import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routes/app_routes.dart';

class AuthController extends GetxController {
  Future<void> login(String username, String password) async {
    if (username == 'admin' && password == '123') {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLogin', true);

      Get.snackbar('Berhasil', 'Login berhasil');
      Get.offAllNamed(Routes.mainNavigation);
    } else {
      Get.snackbar('Gagal', 'Username atau password salah');
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    Get.offAllNamed(Routes.login);
    Get.snackbar('Logout', 'Berhasil logout');
  }

  bool isLoggedIn() {
    return false;
  }
}