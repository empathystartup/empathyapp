import 'package:flutter/material.dart';

class AppTheme {}

extension TextThemeExtension on TextTheme {
  TextStyle? get headline1Bold => displayLarge?.copyWith();
}

extension TextStyleExtension on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
  TextStyle get underlined => copyWith(decoration: TextDecoration.underline);
  TextStyle withWeight(FontWeight weight) => copyWith(fontWeight: weight);
}
