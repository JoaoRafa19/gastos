import 'package:flutter/material.dart';
import 'package:gastos/pages/core/bindings.dart';
import 'package:gastos/pages/core/themes.dart';
import 'package:gastos/pages/home/home.page.dart';
import 'package:gastos/pages/login/login.page.dart';
import 'package:gastos/pages/signin/signin.page.dart';
import 'package:gastos/pages/splash/splash.page.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CoreWidget extends StatelessWidget {
  CoreWidget({super.key});

  final supabase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      color: Colors.grey,
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      initialRoute: '/splash',
      getPages: [
        GetPage(name: "/", page: () => Container()),
        GetPage(name: "/splash", page: () => const SplashScreen()),
        GetPage(
          name: SignInBinding.name,
          page: () => SignInPage(),
          transition: Transition.downToUp,
          binding: SignInBinding(),
        ),
        GetPage(
          name: LoginBinding.name,
          page: () => LoginPage(),
          binding: LoginBinding(),
        ),
        GetPage(
            name: HomeBinding.route,
            page: () => HomePage(),
            transition: Transition.fadeIn,
            binding: HomeBinding())
      ],
    );
  }
}
