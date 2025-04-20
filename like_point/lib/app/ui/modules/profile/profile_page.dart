import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_point/app/ui/modules/home/home_controller.dart';
import 'package:like_point/app/ui/widget/appbar/custom_appbar.dart';
import 'package:like_point/app/ui/widget/theme/app_colors.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: CustomAppBar(
        username: controller.username,
        showBackButton: false, 
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: AppColors.getBackgroundGradient(context), 
            ),
          ),
        ],
      ),
    );
  }
}
