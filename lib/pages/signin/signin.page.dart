import 'package:flutter/material.dart';
import 'package:gastos/shared/widgets/default.textinput.widget.dart';
import 'package:get/get.dart';

import 'signin.controller.dart';

class SignInPage extends GetView<SignInController> {
  final emailTextEditionController = TextEditingController();
  final nameTextEditionController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignInPage'),
        backgroundColor: Colors.grey[400],
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
                key: formKey,
                child: Column(
                  children: [
                    DefaultTextInput(
                      controller: emailTextEditionController,
                      hintText: "Login (e-mail)",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Login necessário";
                        }
                      },
                    ),
                    DefaultTextInput(
                      controller: nameTextEditionController,
                      hintText: "Nome",
                    ),
                    DefaultTextInput(
                      controller: passwordTextController,
                      validator: (value) {
                        if (value == null) {
                          return "Need password";
                        }

                        if (value.length < 6) {
                          return "Senha invalida";
                        }

                        return null;
                      },
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
                    ),
                    DefaultTextInput(
                      controller: confirmPasswordController,
                      obscureText: controller.obscurePassword,
                      hintText: "Confirme a senha",
                      validator: (value) {
                        if (value == null) {
                          return "Need password";
                        }

                        if (value.length < 6) {
                          return "Senha invalida";
                        }

                        if (value != passwordTextController.text) {
                          return "As senhas precisam ser iguais";
                        }

                        return null;
                      },
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
                    ),
                    Obx(() => GestureDetector(
                        onTap: () async {
                          if (passwordTextController.text !=
                                  confirmPasswordController.text ||
                              emailTextEditionController.text.isEmpty ||
                              formKey.currentState == null ||
                              !formKey.currentState!.validate()) {
                            Get.snackbar("Password",
                                "Your password and your confirm password are not the same");

                            return;
                          }
                          await controller.signIn(
                              password: passwordTextController.text,
                              login: emailTextEditionController.text,
                              data: {"name": nameTextEditionController.text});
                          nameTextEditionController.clear();
                          confirmPasswordController.clear();
                          emailTextEditionController.clear();
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
