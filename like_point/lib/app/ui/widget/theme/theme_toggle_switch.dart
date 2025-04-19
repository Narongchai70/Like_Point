import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_point/app/ui/widget/theme/app_colors.dart';
import 'package:like_point/app/ui/widget/theme/theme_controller.dart';

class ThemeToggleSwitch extends StatelessWidget {
  ThemeToggleSwitch({super.key});

  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final bool isDark = themeController.isDarkMode.value;

      return GestureDetector(
        onTap: themeController.toggleTheme,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 80,
          height: 28,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: AppColors.lightMode,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: isDark ? Alignment.centerLeft : Alignment.centerRight,
                child: Icon(
                  isDark ? Icons.nightlight_round : Icons.wb_sunny,
                  color: Colors.white,
                  size: 16,
                ),
              ),
              AnimatedAlign(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                alignment: isDark ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: 22,
                  height: 22,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
