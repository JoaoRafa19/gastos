import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DefaultTextInput extends StatelessWidget {
  const DefaultTextInput(
      {required this.controller,
      Key? key,
      this.margin,
      this.hintText,
      this.obscureText,
      this.sufix,
      this.validator})
      : super(key: key);

  final String? hintText;
  final TextEditingController controller;
  final EdgeInsets? margin;
  final bool? obscureText;
  final Widget? sufix;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          border: Border.all(color: Get.theme.primaryColor, width: 4),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        validator: validator,
        controller: controller,
        style: const TextStyle(fontSize: 18),
        cursorColor: Colors.black,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          suffixIcon: sufix,
          border: InputBorder.none,
          hintText: hintText ?? '',
        ),
      ),
    );
  }
}
