import 'package:flutter/material.dart';
import 'package:like_point/app/data/modle/campion_detail_model.dart';
import 'package:like_point/app/ui/widget/network_image_with_load.dart';

class ChampionSkinList extends StatelessWidget {
  final List<Skin> skins;

  const ChampionSkinList({super.key, required this.skins});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Available Skins',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 180,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: skins.length,
            itemBuilder: (context, index) {
              final skin = skins[index];
              return Column(
                children: [
                  NetworkImageWithLoader(
                    imageUrl: skin.imageUrl,
                    width: 120,
                    height: 120,
                    fit: BoxFit.fill,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  const SizedBox(height: 6),
                  SizedBox(
                    width: 120,
                    child: Text(
                      skin.name,
                      style: const TextStyle(color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 12),
          ),
        ),
      ],
    );
  }
}
