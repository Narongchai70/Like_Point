import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackBar({
  required String title,
  required String message,
  Color backgroundColor = Colors.black87,
  Color textColor = Colors.white,
  IconData icon = Icons.info_outline,
}) {
  Get.snackbar(
    title,
    message,
    backgroundColor: backgroundColor,
    colorText: textColor,
    icon: Icon(icon, color: textColor),
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 3),
    margin: const EdgeInsets.all(16),
    borderRadius: 12,
  );
}
