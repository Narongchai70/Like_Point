import 'package:flutter/material.dart';
import 'package:like_point/app/data/modle/rank_info.dart';

class SummonerRankCard extends StatelessWidget {
  final RankInfo rank;

  const SummonerRankCard({super.key, required this.rank});

  @override
  Widget build(BuildContext context) {
    final isUnranked = rank.tier.toUpperCase() == "UNRANKED";
    final imagePath = isUnranked
        ? "assets/rank/Rank=Unranked.png"
        : "assets/rank/Rank=${rank.tier[0].toUpperCase()}${rank.tier.substring(1).toLowerCase()}.png";
    final queueLabel = rank.queueType == "RANKED_SOLO_5x5" ? "Solo" : "Flex";

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 155, 51, 194),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white70),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            width: 60,
            height: 60,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.image_not_supported, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: isUnranked
                ? const Text(
                    "This summoner has not played any ranked games yet.",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${rank.tier} ${rank.rank} ${rank.lp} LP",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        queueLabel,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Wins: ${rank.wins}  Losses: ${rank.losses}  (${rank.winRate.toStringAsFixed(1)}%)",
                        style: const TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
