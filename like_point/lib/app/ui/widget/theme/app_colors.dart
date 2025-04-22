import 'package:flutter/material.dart';

class AppColors {
  // Light Theme Gradient
  static const Color lightGradientStart = Color(0xFF8E24AA);
  static const Color lightGradientEnd = Color(0xFFD500F9);
  static const Color lightMode = Color(0xFF8F87F1);

  // Dark Theme Gradient
  static const Color darkGradientStart = Color(0xFF2C3E50);
  static const Color darkGradientEnd = Color(0xFF34495E);

  // Text & BG
  static const Color textLight = Colors.white;
  static const Color textDark = Colors.black;

  static const Color backgroundLight = Colors.white;
  static const Color backgroundDark = Colors.black;

  // Card Background Colors UI ตัวอย่าง
  static const Color cardPurpleLight = Color(0xFF512DA8);
  static const Color cardPurpleDark = Color(0x0900FF13);

  static Color getCardColor(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark ? cardPurpleDark : cardPurpleLight;
  }

  // background gradient
  static LinearGradient getBackgroundGradient(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors:
          brightness == Brightness.dark
              ? [darkGradientStart, darkGradientEnd]
              : [lightGradientStart, lightGradientEnd],
    );
  }

  static Color fadedTextColor(BuildContext context) {
    return Theme.of(context).colorScheme.onSurfaceVariant;
  }
}
