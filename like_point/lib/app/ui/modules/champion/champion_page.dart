import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_point/app/ui/widget/appbar/custom_appbar.dart';
import 'package:like_point/app/ui/widget/theme/app_colors.dart';
import 'package:like_point/app/ui/widget/theme/theme_controller.dart';
import 'package:like_point/app/ui/widget/champion/champion_list_view.dart';
import 'package:like_point/app/ui/widget/champion/champion_search_text_file.dart';
import 'package:like_point/app/ui/modules/home/home_controller.dart';
import 'package:like_point/app/ui/modules/champion/champion_controller.dart';

class ChampionPage extends StatelessWidget {
  ChampionPage({super.key});

  final ThemeController themeController = Get.find();
  final HomeController controller = Get.find();
  final ChampionController champController = Get.find(); 

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
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ChampionSearchTextFile(
                          onChanged: (value) =>
                              champController.searchText.value = value,
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(child: ChampionListView()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
