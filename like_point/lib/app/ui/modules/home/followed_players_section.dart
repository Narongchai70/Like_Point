import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_point/app/data/modle/followed_player.dart';
import 'package:like_point/app/ui/modules/home/followed_player_controller%20.dart';
import 'package:like_point/app/ui/modules/summoner/summoner_page.dart';
import 'package:like_point/app/ui/widget/theme/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FollowedPlayersSection extends StatelessWidget {
  const FollowedPlayersSection({super.key});

  @override
  Widget build(BuildContext context) {
    final FollowedPlayerController controller = Get.find();
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      controller.loadFollowedPlayers();
    }

    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.followedList.isEmpty) {
        return const Text(
          'No followed players yet.',
          style: TextStyle(color: AppColors.textLight, fontSize: 16),
        );
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 80,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: controller.followedList.length,
              separatorBuilder: (context, index) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final FollowedPlayer player = controller.followedList[index];
                return GestureDetector(
                  onTap: () {
                    Get.to(
                      () => SummonerPage(
                        riotId: player.riotId,
                        platformName: player.platform,
                        region: player.region,
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          player.profileIconUrl,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                          errorBuilder:
                              (_, __, ___) =>
                                  const Icon(Icons.error, color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 4),
                      SizedBox(
                        width: 60,
                        child: Text(
                          player.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      );
    });
  }
}
