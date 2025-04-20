import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_point/app/ui/modules/home/home_controller.dart';
import 'package:like_point/app/ui/modules/summoner/summoner_controller.dart';
import 'package:like_point/app/ui/widget/appbar/custom_appbar.dart';
import 'package:like_point/app/ui/widget/theme/app_colors.dart';
import 'package:like_point/app/ui/widget/summoner/summoner_header.dart';
import 'package:like_point/app/ui/widget/summoner/summoner_rank_card.dart';
import 'package:like_point/app/ui/widget/summoner/summonner_unranked_card.dart';

class SummonerPage extends StatelessWidget {
  final String riotId;
  final String platform;
  final String region;

  const SummonerPage({
    super.key,
    required this.riotId,
    required this.platform,
    required this.region,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SummonerController>();
    final homeController = Get.find<HomeController>();

    controller.loadProfile(riotId: riotId, platform: platform, region: region);

    return Scaffold(
      extendBody: true,
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
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            final profile = controller.profile.value;
            if (profile == null) {
              return const Center(
                child: Text(
                  "Player not found.",
                  style: TextStyle(color: AppColors.textLight),
                ),
              );
            }

            final sortedRanks = profile.ranks.toList();
            sortedRanks.sort((a, b) {
              if (a.queueType == "RANKED_SOLO_5x5" &&
                  b.queueType != "RANKED_SOLO_5x5") return -1;
              if (a.queueType != "RANKED_SOLO_5x5" &&
                  b.queueType == "RANKED_SOLO_5x5") return 1;
              return 0;
            });

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SummonerHeader(profile: profile),
                  const SizedBox(height: 24),

                  const Text(
                    "Personal Ratings",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textLight,
                    ),
                  ),
                  const SizedBox(height: 12),

                  sortedRanks.isEmpty
                      ? const UnrankedRankCard()
                      : Column(
                          children: sortedRanks
                              .map((rank) => SummonerRankCard(rank: rank))
                              .toList(),
                        ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
