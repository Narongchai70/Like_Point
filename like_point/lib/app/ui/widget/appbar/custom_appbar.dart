import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_point/app/ui/widget/theme/app_colors.dart';
import 'package:like_point/app/ui/widget/theme/theme_controller.dart';
import 'package:like_point/app/ui/widget/theme/theme_toggle_switch.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final RxString username;
  final VoidCallback? onBack;
  final bool showBackButton; // ✅ ใหม่

  CustomAppBar({
    super.key,
    required this.username,
    this.onBack,
    this.showBackButton = true, // ✅ ถ้าไม่กำหนด จะ "แสดง" back button
  });

  final ThemeController themeController = Get.find();

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    final Color appBarColor =
        Theme.of(context).brightness == Brightness.dark
            ? AppColors.darkGradientStart
            : AppColors.lightGradientStart;

    return Container(
      color: appBarColor,
      child: SafeArea(
        child: SizedBox(
          height: preferredSize.height,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (showBackButton)
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: AppColors.textLight,
                  ),
                  onPressed: onBack ?? () => Get.back(),
                )
              else
                const SizedBox(width: 16), // เว้นที่ให้ layout ไม่ขยับ
              Obx(
                () => Text(
                  'Hi, ${username.value}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textLight,
                  ),
                ),
              ),
              const Spacer(),
              ThemeToggleSwitch(),
              const SizedBox(width: 18),
            ],
          ),
        ),
      ),
    );
  }
}
