import 'package:flutter/material.dart';
import 'package:like_point/app/data/modle/match_info.dart';
import 'package:like_point/app/ui/widget/theme/app_colors.dart';

class MatchTopRow extends StatelessWidget {
  final MatchInfo match;
  final Color kdaColor;
  final String queueTypeLabel;
  final String playedTimeLabel;

  const MatchTopRow({
    super.key,
    required this.match,
    required this.kdaColor,
    required this.queueTypeLabel,
    required this.playedTimeLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            "https://ddragon.leagueoflegends.com/cdn/15.7.1/img/champion/${match.championIcon}.png",
            width: 48,
            height: 48,
            errorBuilder: (_, __, ___) => const Icon(Icons.image_not_supported),
          ),
        ),
        const SizedBox(width: 6),
        Column(
          children: [
            Row(
              children:
                  match.spells
                      .take(2)
                      .map((id) => _spellIcon(_spellName(id)))
                      .toList(),
            ),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: match.kills.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: AppColors.textLight,
                            ),
                          ),
                          TextSpan(
                            text: "/${match.deaths}",
                            style: TextStyle(color: kdaColor, fontSize: 18),
                          ),
                          TextSpan(
                            text: "/${match.assists}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: AppColors.textLight,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "KDA ${_calculateKDA(match.kills, match.deaths, match.assists)}",
                      style: const TextStyle(
                        color: AppColors.textLight,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      queueTypeLabel,
                      style: const TextStyle(
                        color: AppColors.textLight,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    playedTimeLabel,
                    style: const TextStyle(
                      color: AppColors.textLight,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _calculateKDA(int kills, int deaths, int assists) {
    final kda = (kills + assists) / (deaths == 0 ? 1 : deaths);
    return kda.toStringAsFixed(2);
  }

  String _spellName(String id) {
    const spellMap = {
      '1': 'SummonerBoost',
      '3': 'SummonerExhaust',
      '4': 'SummonerFlash',
      '6': 'SummonerHaste',
      '7': 'SummonerHeal',
      '11': 'SummonerSmite',
      '12': 'SummonerTeleport',
      '13': 'SummonerMana',
      '14': 'SummonerDot',
      '21': 'SummonerBarrier',
      '30': 'SummonerPoroRecall',
      '31': 'SummonerPoroThrow',
      '32': 'SummonerSnowball',
      '39': 'SummonerSnowURFSnowball_Mark',
    };
    return spellMap[id] ?? 'SummonerFlash';
  }

  Widget _spellIcon(String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Image.network(
        "https://ddragon.leagueoflegends.com/cdn/15.7.1/img/spell/$name.png",
        width: 20,
        height: 20,
        errorBuilder: (_, __, ___) => const SizedBox.shrink(),
      ),
    );
  }
}
