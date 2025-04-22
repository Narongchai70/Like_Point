import 'package:flutter/material.dart';
import 'package:like_point/app/data/modle/match_info.dart';
import 'package:like_point/app/ui/widget/theme/app_colors.dart';

class MatchHistoryCard extends StatelessWidget {
  final MatchInfo match;

  const MatchHistoryCard({super.key, required this.match});

  @override
  String _queueTypeName(String queueId) {
    switch (queueId) {
      case '420':
        return 'Ranked Solo/Duo';
      case '440':
        return 'Ranked Flex';
      case '400':
        return 'Normal';
      default:
        return 'Unknown';
    }
  }
  Widget build(BuildContext context) {
    final isWin = match.result == "Win";
    final backgroundColor = isWin ? Colors.blueAccent : Colors.redAccent;
    final queueTypeLabel = _queueTypeName(match.queueType);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white24),
      ),
      child: Row(
        children: [
          Image.network(
            "https://ddragon.leagueoflegends.com/cdn/15.7.1/img/champion/${match.championIcon}.png",
            width: 60,
            height: 60,
            errorBuilder: (_, __, ___) => const Icon(Icons.image_not_supported),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  queueTypeLabel,
                  style: const TextStyle(color: AppColors.textLight, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${match.kills}/${match.deaths}/${match.assists} KDA",
                  style: TextStyle(
                    color: isWin ? Colors.white : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Played at: ${match.playedAgo}",
                  style: const TextStyle(color: AppColors.textLight),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  
}