import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_point/app/ui/widget/appbar/custom_appbar.dart';
import 'package:like_point/app/ui/widget/theme/app_colors.dart';
import 'package:like_point/app/ui/modules/home/home_controller.dart';

class ChampionData extends StatelessWidget {
  final String title;

  ChampionData({super.key, required this.title});

  final HomeController controller = Get.find(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: CustomAppBar(username: controller.username),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: AppColors.getBackgroundGradient(context),
            ),
          ),
          Center(
            child: Text(
              'รายละเอียดของ $title',
              style: const TextStyle(
                fontSize: 24,
                color: AppColors.textLight,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
