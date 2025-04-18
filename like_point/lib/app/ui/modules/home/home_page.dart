import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_point/app/ui/modules/home/home_controller.dart';
import 'package:like_point/app/ui/modules/summoner/summoner_page.dart';
import 'package:like_point/app/ui/widget/home/home_bottun_text_see_all.dart';
import 'package:like_point/app/ui/widget/home/home_carouselview.dart';
import 'package:like_point/app/ui/widget/home/home_dropdown.dart';
import 'package:like_point/app/ui/widget/home/home_search_button.dart';
import 'package:like_point/app/ui/widget/home/home_search_text_file.dart';
import 'package:like_point/app/ui/widget/home/home_search_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 128, 33, 155),
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 128, 33, 155),
                  Color.fromARGB(255, 212, 0, 249),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.015),

                // แสดงชื่อผู้ใช้
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Obx(() {
                    if (controller.isLoading.value) {
                      return const Text(
                        "Loading...",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    }

                    if (controller.username.value.isEmpty) {
                      return const SizedBox();
                    }

                    return Text(
                      "Hello, ${controller.username.value}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  }),
                ),

                SizedBox(height: screenHeight * 0.015),

                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: screenHeight * 0.01,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 🔍 Search Bar + Button
                        Row(
                          children: [
                            Expanded(child: HomeSearchTextFile()),
                            SizedBox(width: screenHeight * 0.015),
                            HomeSearchButton(
                              onPressed: () {
                                final searchCtrl =
                                    Get.find<HomeSearchController>();
                                final name =
                                    searchCtrl.searchController.text.trim();
                                if (name.isNotEmpty) {
                                  FocusScope.of(context).unfocus();
                                  Get.to(() => SummonerPage(riotId: name));
                                }
                              },
                            ),
                          ],
                        ),

                        SizedBox(height: screenHeight * 0.025),
                        HomeDropdown(),
                        SizedBox(height: screenHeight * 0.025),

                        // Followed section
                        Row(
                          children: [
                            const Text(
                              'Followed players',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            HomeBottunTextSeeAll(),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.02),

                        // Carousel View
                        HomeCarouselview(),
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
