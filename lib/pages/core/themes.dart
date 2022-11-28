import 'package:flutter/material.dart';

class Themes {
  static ThemeData get light => ThemeData.light(
        useMaterial3: true,
      ).copyWith(primaryColor: Colors.grey);

  static ThemeData get dark => ThemeData.dark(useMaterial3: true);
}
