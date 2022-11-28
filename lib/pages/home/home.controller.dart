import 'package:flutter/material.dart';
import 'package:gastos/pages/core/bindings.dart';
import 'package:gastos/pages/core/pages.dart';
import 'package:gastos/pages/main/main.page.dart';
import 'package:gastos/pages/transactions/transactions.page.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  var currentIndex = 0.obs;

  final pages = InternalPages.values.map((e) => e.routeName).toList();

  void changePage(int index) {
    currentIndex.value = index;
    Get.toNamed(pages[index], id: 1);
  }

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return GetPageRoute(
          routeName: "/",
          settings: settings,
          page: () => Container(),
        );
      case HomeBinding.route:
        return GetPageRoute(
          routeName: HomeBinding.route,
          settings: settings,
          page: () => Container(),
        );
      case MainBinging.name:
        return GetPageRoute(
          routeName: MainBinging.name,
          settings: settings,
          transition: Transition.cupertino,
          curve: Curves.easeIn,
          page: () => const MainPage(),
          binding: HomeBinding(),
        );
      case TransactionsBindings.name:
        return GetPageRoute(
          routeName: TransactionsBindings.name,
          transition: Transition.cupertino,
          settings: settings,
          page: () => const TransactionsPage(),
          binding: TransactionsBindings(),
        );
      default:
        return null;
    }
  }

  final _togle = false.obs;
  bool get toggle => _togle.value;
  set toggle(value) => _togle.value = value;
}
