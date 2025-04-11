import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_point/app/ui/modules/champion/champion_controller.dart';
import 'package:like_point/app/ui/modules/champion/champion_data.dart';

class ChampionListView extends StatelessWidget {
  const ChampionListView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChampionController());

    return Obx(() {
      if (controller.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }

      return GridView.count(
        crossAxisCount: 3,
        padding: const EdgeInsets.all(8),
        children:
            controller.champions.map((champion) {
              return InkWell(
                onTap: () {
                  Get.to(() => ChampionData(title: champion.name));
                },
                child: Column(
                  children: [
                    Container(
                      height: 95,
                      width: 95,
                      margin: const EdgeInsets.all(8),
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
                    Text(
                      champion.name,
                      style: const TextStyle(color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            }).toList(),
      );
    });
  }
}
