import 'package:gastos/service/auth.service.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInController extends GetxController {
  final AuthRepository repository = AuthRepository.instance;
  SignInController();
  final _obscurePassword = true.obs;
  bool get obscurePassword => _obscurePassword.value;
  set obscurePassword(value) => _obscurePassword.value = value;

  final _loadingLogin = false.obs;
  bool get getLoadingLogin => _loadingLogin.value;
  set _setLoading(value) => _loadingLogin.value = value;

  Future signIn(
      {required String login,
      required String password,
      Map<String, dynamic>? data}) async {
    try {
      _setLoading = true;
      final result = await AuthRepository.signUp(login, password, data);

      if (result == null) {
        Get.snackbar("SignIn", "SignInError");
      }
      _setLoading = false;
    } on AuthException catch (e) {
      Get.snackbar("SignIn", e.message);
      _setLoading = false;
    }
  }
}
