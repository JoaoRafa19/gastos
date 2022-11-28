import 'package:gastos/pages/home/home.controller.dart';
import 'package:gastos/pages/login/login.controller.dart';
import 'package:gastos/pages/main/main.controller.dart';
import 'package:gastos/pages/signin/signin.controller.dart';
import 'package:gastos/pages/transactions/transactions.controller.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  static const name = "/logIn";
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
  }
}

class SignInBinding implements Bindings {
  static const name = "/signIn";

  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
  }
}

class HomeBinding implements Bindings {
  static const route = "/home";

  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
  }
}

class MainBinging implements Bindings {
  static const name = "/home/main";

  @override
  void dependencies() {
    Get.put<MainController>(MainController());
  }
}

class TransactionsBindings implements Bindings {
  static const name = "home/transactions";

  @override
  void dependencies() {
    Get.put<TransactionsController>(TransactionsController());
  }
}
