import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_point/app/ui/modules/champion/champion_detail_controller.dart';
import 'package:like_point/app/ui/modules/home/home_controller.dart';
import 'package:like_point/app/ui/widget/appbar/custom_appbar.dart';
import 'package:like_point/app/ui/widget/champion/champion_role_and_difficulty.dart';
import 'package:like_point/app/ui/widget/champion/champion_skill_tile.dart';
import 'package:like_point/app/ui/widget/champion/champion_skin_list.dart';
import 'package:like_point/app/ui/widget/network_image_with_load.dart';
import 'package:like_point/app/ui/widget/theme/app_colors.dart';

class ChampionData extends StatefulWidget {
  final String championId;
  const ChampionData({super.key, required this.championId});

  @override
  State<ChampionData> createState() => _ChampionDataState();
}

class _ChampionDataState extends State<ChampionData> {
  final HomeController homeController = Get.find();
  final ChampionDetailController detailController = Get.find();

  @override
  void initState() {
    super.initState();
    detailController.loadChampionDetail(widget.championId);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBody: true,
      appBar: CustomAppBar(username: homeController.username),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: AppColors.getBackgroundGradient(context),
              ),
            ),
            Obx(() {
              if (detailController.isLoading.value ||
                  detailController.detail.value == null) {
                return const Center(child: CircularProgressIndicator());
              }

              final champion = detailController.detail.value!;

              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.04,
                  vertical: screenHeight * 0.02,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        '${champion.title} ${champion.name}',
                        style: TextStyle(
                          fontSize: screenWidth * 0.06,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.05),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NetworkImageWithLoader(
                          imageUrl: champion.fullImageUrl,
                          width: screenWidth * 0.55,
                          height: screenWidth * 0.55,
                          fit: BoxFit.fill,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        SizedBox(width: screenWidth * 0.05),
                        Expanded(
                          child: ChampionRoleAndDifficulty(
                            role: champion.tags.first,
                            difficulty: champion.difficulty,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenWidth * 0.05),
                    ChampionSkillTile(
                      image: champion.passiveImageUrl,
                      title: 'PASSIVE: ${champion.passiveName}',
                      description: champion.passiveDescription,
                    ),
                    const SizedBox(height: 12),
                    ...champion.spells.map(
                      (skill) => ChampionSkillTile(
                        image: skill.imageUrl,
                        title: skill.name,
                        description: skill.description,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ChampionSkinList(skins: champion.skins),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
