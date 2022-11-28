import 'package:flutter/material.dart';
import 'package:gastos/pages/core/bindings.dart';
import 'package:gastos/shared/widgets/default.textinput.widget.dart';
import 'package:get/get.dart';

import 'login.controller.dart';

class LoginPage extends GetView<LoginController> {
  final TextEditingController loginTextController = TextEditingController();
  final TextEditingController passwordTextController =
      TextEditingController(text: '');

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 100),
                  decoration: BoxDecoration(),
                  child: Icon(
                    Icons.attach_money,
                    color: Colors.grey,
                    size: Get.height / 10,
                  ),
                ),
                Form(
                  child: Column(
                    children: [
                      DefaultTextInput(
                        controller: loginTextController,
                        hintText: "Login",
                        
                      ),
                      Obx(() => DefaultTextInput(
                            controller: passwordTextController,
                            obscureText: controller.obscurePassword,
                            hintText: "Senha",
                            sufix: IconButton(
                              onPressed: () => controller.obscurePassword =
                                  !controller.obscurePassword,
                              icon: controller.obscurePassword
                                  ? const Icon(
                                      Icons.visibility,
                                      color: Colors.grey,
                                    )
                                  : const Icon(
                                      Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                            ),
                          )),
                      Obx(() => GestureDetector(
                          onTap: () async {
                            await controller.login(loginTextController.text,
                                passwordTextController.text);
                            loginTextController.clear();
                            passwordTextController.clear();
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 100, top: 50),
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 48),
                            decoration: const BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            child: controller.getLoadingLogin
                                ? const CircularProgressIndicator(
                                    color: Colors.black,
                                  )
                                : const Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                          ))),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(SignInBinding.name);
                        },
                        child: const Text("criar uma conta"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
