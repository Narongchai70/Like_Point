import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_point/app/ui/modules/home/home_controller.dart';
import 'package:like_point/app/ui/modules/summoner/match_history_controller.dart';
import 'package:like_point/app/ui/widget/appbar/custom_appbar.dart';
import 'package:like_point/app/ui/widget/match/match_history_card.dart';
import 'package:like_point/app/ui/widget/theme/app_colors.dart';

class MatchHistoryPage extends StatelessWidget {
  final controller = Get.find<MatchHistoryController>();

  final String puuid;

  MatchHistoryPage({super.key, required this.puuid});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (controller.matchList.isEmpty) {
        controller.loadMatchHistory(puuid: puuid);
      }
    });

    return Scaffold(
      appBar: CustomAppBar(
        username: homeController.username,
        showBackButton: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: AppColors.getBackgroundGradient(context),
            ),
          ),
          Obx(() {
            if (controller.isLoading.value && controller.matchList.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            if (controller.matchList.isEmpty) {
              return const Center(
                child: Text(
                  "No match history available.",
                  style: TextStyle(color: AppColors.textLight),
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: controller.matchList.length,
              itemBuilder: (context, index) {
                final match = controller.matchList[index];
                return MatchHistoryCard(match: match);
              },
            );
          }),
        ],
      ),
    );
  }
}
