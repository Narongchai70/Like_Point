import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:like_point/app/ui/modules/summoner/match_history_page%20.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:like_point/app/ui/modules/home/home_controller.dart';
import 'package:like_point/app/ui/modules/summoner/match_history_controller.dart';
import 'package:like_point/app/ui/modules/summoner/summoner_controller.dart';
import 'package:like_point/app/ui/widget/appbar/custom_appbar.dart';
import 'package:like_point/app/ui/widget/match/match_history_card.dart';
import 'package:like_point/app/ui/widget/theme/app_colors.dart';
import 'package:like_point/app/ui/widget/summoner/summoner_header.dart';
import 'package:like_point/app/ui/widget/summoner/summonner_unranked_card.dart';
import 'package:like_point/app/ui/widget/summoner/summoner_rank_card.dart';
import 'package:like_point/app/ui/widget/ืsnackbar_service.dart';

const platform = MethodChannel('com.example.like_point/media_scanner');

class SummonerPage extends StatelessWidget {
  final String riotId;
  final String platformName;
  final String region;

  SummonerPage({
    super.key,
    required this.riotId,
    required this.platformName,
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
        showSnackBar(
          title: 'Permission Denied',
          message: 'Please allow access to save the image.',
          backgroundColor: Colors.redAccent,
          icon: Icons.block,
        );
        openAppSettings();
        return;
      }

      final boundary =
          _captureKey.currentContext?.findRenderObject()
              as RenderRepaintBoundary?;
      if (boundary == null) {
        showSnackBar(
          title: 'Capture Error',
          message: 'No widget found to capture.',
          backgroundColor: Colors.orange,
          icon: Icons.image_not_supported,
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

      await platform.invokeMethod('scanFile', {'path': file.path});

      showSnackBar(
        title: 'Saved Successfully',
        message: 'Image saved successfully.',
        backgroundColor: Colors.green,
        icon: Icons.check_circle_outline,
      );
    } catch (e) {
      showSnackBar(
        title: 'Error',
        message: 'Failed to save the image.',
        backgroundColor: Colors.redAccent,
        icon: Icons.error,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SummonerController>();
    final homeController = Get.find<HomeController>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller
          .loadProfile(riotId: riotId, platform: platformName, region: region)
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
                  b.queueType != "RANKED_SOLO_5x5") {
                return -1;
              }
              if (a.queueType != "RANKED_SOLO_5x5" &&
                  b.queueType == "RANKED_SOLO_5x5") {
                return 1;
              }
              return 0;
            });

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RepaintBoundary(
                    key: _captureKey,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: AppColors.getBackgroundGradient(context),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SummonerHeader(
                            profile: profile,
                            onCapture: _captureAndSave,
                            platform: platformName,
                            region: region,
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
                                          (rank) =>
                                              SummonerRankCard(rank: rank),
                                        )
                                        .toList(),
                              ),
                        ],
                      ),
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
