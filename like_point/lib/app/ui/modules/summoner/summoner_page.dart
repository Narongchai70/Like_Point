import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:like_point/app/ui/widget/summoner/summonner_unranked_card.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:like_point/app/ui/modules/home/home_controller.dart';
import 'package:like_point/app/ui/modules/summoner/match_history_controller.dart';
import 'package:like_point/app/ui/modules/summoner/match_history_page%20.dart';
import 'package:like_point/app/ui/modules/summoner/summoner_controller.dart';
import 'package:like_point/app/ui/widget/appbar/custom_appbar.dart';
import 'package:like_point/app/ui/widget/match/match_history_card.dart';
import 'package:like_point/app/ui/widget/theme/app_colors.dart';
import 'package:like_point/app/ui/widget/summoner/summoner_header.dart';
import 'package:like_point/app/ui/widget/summoner/summoner_rank_card.dart';

class SummonerPage extends StatelessWidget {
  final String riotId;
  final String platform;
  final String region;

  SummonerPage({
    super.key,
    required this.riotId,
    required this.platform,
    required this.region,
  });

  final GlobalKey _captureKey = GlobalKey();

  Future<void> _captureAndSave() async {
    try {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      final sdkInt = androidInfo.version.sdkInt;

      PermissionStatus permissionStatus;
      if (sdkInt >= 33) {
        permissionStatus = await Permission.photos.request();
      } else {
        permissionStatus = await Permission.storage.request();
      }

      if (!permissionStatus.isGranted) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            content: const Text(
              "\u274c \u0e01\u0e23\u0e38\u0e13\u0e32\u0e2d\u0e19\u0e38\u0e0d\u0e32\u0e15\u0e2a\u0e34\u0e17\u0e18\u0e34\u0e4c\u0e40\u0e1e\u0e37\u0e48\u0e2d\u0e1a\u0e31\u0e19\u0e17\u0e36\u0e01\u0e23\u0e39\u0e1b\u0e20\u0e32\u0e1e",
            ),
            action: SnackBarAction(
              label:
                  "\u0e40\u0e1b\u0e34\u0e14\u0e01\u0e32\u0e23\u0e15\u0e31\u0e49\u0e07\u0e04\u0e48\u0e32",
              onPressed: openAppSettings,
            ),
          ),
        );
        return;
      }

      final boundary =
          _captureKey.currentContext?.findRenderObject()
              as RenderRepaintBoundary?;
      if (boundary == null) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          const SnackBar(
            content: Text(
              "\u0e44\u0e21\u0e48\u0e1e\u0e1a\u0e27\u0e31\u0e15\u0e16\u0e17\u0e35\u0e48\u0e15\u0e49\u0e2d\u0e07\u0e01\u0e32\u0e23\u0e1a\u0e31\u0e19\u0e17\u0e36\u0e01\u0e20\u0e32\u0e1e",
            ),
          ),
        );
        return;
      }

      final image = await boundary.toImage(pixelRatio: 3.0);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      final pngBytes = byteData!.buffer.asUint8List();

      final directory = Directory('/storage/emulated/0/Pictures/LikePoint');
      if (!(await directory.exists())) {
        await directory.create(recursive: true);
      }

      final file = File(
        '${directory.path}/summoner_${DateTime.now().millisecondsSinceEpoch}.png',
      );
      await file.writeAsBytes(pngBytes);

      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          content: Text(
            "\u2705 \u0e1a\u0e31\u0e19\u0e17\u0e36\u0e01\u0e2a\u0e33\u0e40\u0e23\u0e47\u0e08: ${file.path}",
          ),
        ),
      );
    } catch (e) {
      print("\u274c Error: $e");
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          content: Text(
            "\u274c \u0e40\u0e01\u0e34\u0e14\u0e02\u0e49\u0e2d\u0e1c\u0e25\u0e1e\u0e25\u0e32\u0e14\u0e43\u0e19\u0e01\u0e32\u0e23\u0e1a\u0e31\u0e19\u0e17\u0e36\u0e01\u0e20\u0e32\u0e1e",
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SummonerController>();
    final homeController = Get.find<HomeController>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller
          .loadProfile(riotId: riotId, platform: platform, region: region)
          .then((_) {
            final puuid = controller.puuid.value;
            if (puuid.isNotEmpty) {
              Get.find<MatchHistoryController>().loadMatchHistory(puuid: puuid);
            }
          });
    });

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
                  b.queueType != "RANKED_SOLO_5x5")
                return -1;
              if (a.queueType != "RANKED_SOLO_5x5" &&
                  b.queueType == "RANKED_SOLO_5x5")
                return 1;
              return 0;
            });

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RepaintBoundary(
                    key: _captureKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SummonerHeader(
                          profile: profile,
                          onCapture: _captureAndSave,
                        ),
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
                              children:
                                  sortedRanks
                                      .map(
                                        (rank) => SummonerRankCard(rank: rank),
                                      )
                                      .toList(),
                            ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Match History",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textLight,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Recent Matches",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textLight,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          final puuid = controller.puuid.value;
                          if (puuid.isNotEmpty) {
                            Get.to(() => MatchHistoryPage(puuid: puuid));
                          }
                        },
                        child: const Text(
                          "View All",
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Obx(() {
                    final matches =
                        Get.find<MatchHistoryController>().matchList;
                    if (matches.isEmpty) {
                      return const Text(
                        "No match history available.",
                        style: TextStyle(color: AppColors.textLight),
                      );
                    }

                    return Column(
                      children:
                          matches
                              .take(5)
                              .map((match) => MatchHistoryCard(match: match))
                              .toList(),
                    );
                  }),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
