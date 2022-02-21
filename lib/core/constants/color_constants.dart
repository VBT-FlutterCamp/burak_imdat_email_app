import 'package:flutter/material.dart';

class ColorConstants {
  static ColorConstants? _instance;
  static ColorConstants get instance => _instance ??= ColorConstants._init();
  ColorConstants._init();

  Color get homeTitleColor => const Color.fromRGBO(41, 56, 85, 1);
  Color get mailCleanedBg => const Color.fromRGBO(168, 188, 255, 0.1);
  Color get mailCardRemoveFg => const Color.fromRGBO(66, 101, 214, 1);
}
