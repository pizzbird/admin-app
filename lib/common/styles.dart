import 'package:flutter/material.dart';

class Insets {
  static const double xSmall = 4;
  static const double small = 8;
  static const double medium = 16;
  static const double large = 16;
}

class Fonts {
  static const String base = 'Roboto';
  // etc
}

class TextStyles {
  static const TextStyle base = TextStyle(fontFamily: Fonts.base);
  static late TextStyle body1 = base;
  // etc
}
