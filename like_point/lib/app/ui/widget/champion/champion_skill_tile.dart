import 'package:flutter/material.dart';
import 'package:like_point/app/ui/widget/network_image_with_load.dart';

class ChampionSkillTile extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const ChampionSkillTile({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NetworkImageWithLoader(
          imageUrl: image,
          width: 48,
          height: 48,
          fit: BoxFit.cover,
          borderRadius: BorderRadius.circular(12),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(description, style: const TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ],
    );
  }
}
