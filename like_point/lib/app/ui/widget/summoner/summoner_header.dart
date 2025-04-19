import 'package:flutter/material.dart';
import 'package:like_point/app/data/modle/summoner_profile.dart';

class SummonerHeader extends StatelessWidget {
  final SummonerProfile profile;

  const SummonerHeader({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 155, 51, 194),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white70, width: 1),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              profile.profileIconUrl,
              width: 48,
              height: 48,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profile.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Level ${profile.level}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          const Column(
            children: [
              Icon(Icons.star_border, color: Colors.white),
              SizedBox(height: 8),
              Icon(Icons.save_alt_rounded, color: Colors.white),
            ],
          ),
        ],
      ),
    );
  }
}