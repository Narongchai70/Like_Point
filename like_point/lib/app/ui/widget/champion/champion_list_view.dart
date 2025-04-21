import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_point/app/data/providers/champion_detail_provider.dart';
import 'package:like_point/app/ui/modules/champion/champion_controller.dart';
import 'package:like_point/app/ui/modules/champion/champion_data.dart';
import 'package:like_point/app/ui/modules/champion/champion_detail_controller.dart';

class ChampionListView extends StatelessWidget {
  const ChampionListView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChampionController>();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final itemSize = screenWidth / 3 - screenWidth * 0.06;

    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.filteredChampions.isEmpty) {
        return const Center(
          child: Text(
            "No champions available",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        );
      }

      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.03,
          vertical: screenHeight * 0.02,
        ),
        child: GridView.builder(
          itemCount: controller.filteredChampions.length,
          physics: const BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: screenWidth * 0.03,
            mainAxisSpacing: screenHeight * 0.015,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            final champion = controller.filteredChampions[index];

            return InkWell(
              onTap: () {
                Get.to(
                  () => ChampionData(championId: champion.id),
                  binding: BindingsBuilder(() {
                    Get.put(ChampionDetailProvider());
                    Get.put(
                      ChampionDetailController(
                        provider: Get.find(),
                        versionProvider: Get.find(),
                      ),
                    );
                  }),
                );
              },
              child: Column(
                children: [
                  Container(
                    width: itemSize,
                    height: itemSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade800,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        champion.imageUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                            child: CircularProgressIndicator(strokeWidth: 2),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Icon(
                              Icons.broken_image,
                              color: Colors.white,
                              size: 40,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    champion.name,
                    style: const TextStyle(color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            );
          },
        ),
      );
    });
  }
}
