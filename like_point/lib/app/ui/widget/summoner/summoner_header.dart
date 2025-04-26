import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_point/app/data/modle/summoner_profile.dart';
import 'package:like_point/app/ui/modules/summoner/summoner_controller.dart';
import 'package:like_point/app/ui/widget/theme/app_colors.dart';

class SummonerHeader extends StatelessWidget {
  final SummonerProfile profile;
  final VoidCallback onCapture;
  final String platform;
  final String region;

  const SummonerHeader({
    super.key,
    required this.profile,
    required this.onCapture,
    required this.platform,
    required this.region,
  });

  @override
  Widget build(BuildContext context) {
    final SummonerController controller = Get.find();

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.getCardColor(context),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              profile.profileIconUrl,
              width: 48,
              height: 48,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profile.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Level ${profile.level}',
                  style: const TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Obx(() {
                final isFollowing = controller.isFollowing.value;
                return GestureDetector(
                  onTap: () async {
                    await controller.toggleFollowAndHandle(
                      platform: platform,
                      region: region,
                    );
                  },
                  child: Icon(
                    isFollowing ? Icons.star : Icons.star_border,
                    color: Colors.yellowAccent,
                  ),
                );
              }),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: onCapture,
                child: const Icon(Icons.save_alt_rounded, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
