import 'package:flutter/material.dart';
import 'package:gastos/pages/splash/splash.controller.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashScreenController>(
        init: SplashScreenController(),
        autoRemove: true,
        builder: (controller) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: const [
                      Colors.blue,
                      Colors.purple,
                    ],
                        transform:
                            GradientRotation(controller.animation.value * 10))),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.currency_bitcoin,
                    size: controller.animation.value * 100,
                  )
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
