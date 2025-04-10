import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_point/app/ui/modules/champion/champion_data.dart';

class ChampionListView extends StatelessWidget {
  const ChampionListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      padding: const EdgeInsets.all(8),
      children: List.generate(40, (index) {
        final itemName = 'Item $index';
        return InkWell(
          onTap: () {
            Get.to(() => ChampionData(title: itemName));
          },
          child: Column(
            children: [
              Container(
                height: 95,
                width: 95,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                ),
              ),
              Text(itemName),
            ],
          ),
        );
      }),
    );
  }
}
