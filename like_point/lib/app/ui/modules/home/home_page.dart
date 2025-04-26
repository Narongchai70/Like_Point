import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_point/app/ui/modules/home/followed_players_section.dart';
import 'package:like_point/app/ui/modules/home/home_controller.dart';
import 'package:like_point/app/ui/modules/home/home_summoner_search_controller.dart';
import 'package:like_point/app/ui/widget/theme/app_colors.dart';
import 'package:like_point/app/ui/widget/appbar/custom_appbar.dart';
import 'package:like_point/app/ui/widget/home/home_dropdown.dart';
import 'package:like_point/app/ui/widget/home/home_search_button.dart';
import 'package:like_point/app/ui/widget/home/home_search_text_file.dart';
import 'package:like_point/app/ui/widget/home/controller/home_search_input_controller.dart';
import 'package:like_point/app/ui/widget/theme/theme_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController controller = Get.put(HomeController());
  final HomeSearchInputController inputController = Get.put(
    HomeSearchInputController(),
  );
  final HomeSummonerSearchController searchController = Get.put(
    HomeSummonerSearchController(),
  );
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

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
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0)),

                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: screenHeight * 0.01,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(child: HomeSearchTextFile()),
                            SizedBox(width: screenHeight * 0.015),
                            HomeSearchButton(
                              onPressed: () {
                                searchController.searchSummoner(context);
                              },
                            ),
                          ],
                        ),

                        SizedBox(height: screenHeight * 0.025),
                        Row(children: [Expanded(child: HomeDropdown())]),
                        SizedBox(height: screenHeight * 0.025),
                        Row(
                          children: [
                            const Text(
                              'Followed players',
                              style: TextStyle(
                                color: AppColors.textLight,
                                fontSize: 19,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        FollowedPlayersSection(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
