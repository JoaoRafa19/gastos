import 'package:gastos/pages/core/bindings.dart';
import 'package:gastos/service/auth.service.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginController extends GetxController {
  LoginController();

  final _obscurePassword = true.obs;
  bool get obscurePassword => _obscurePassword.value;
  set obscurePassword(value) => _obscurePassword.value = value;

  final _loadingLogin = false.obs;
  bool get getLoadingLogin => _loadingLogin.value;
  set _setLoading(value) => _loadingLogin.value = value;

  Future login(String login, String password) async {
    try {
      _setLoading = true;
      final result =
          await AuthRepository.loginWithUserPassword(login, password);
      if (result != null) {
        Get.snackbar("Login successfull", "WelCome ${result.user.email}");
      }

      _setLoading = false;
    } on AuthException catch (e) {
      Get.snackbar("Error", e.message);
      _setLoading = false;
    } catch (e) {
      Get.snackbar("Error", "unexpected error");
    }
  }
}
