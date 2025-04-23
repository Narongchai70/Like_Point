import 'package:flutter/material.dart';
import 'package:like_point/app/data/modle/match_info.dart';
import 'package:like_point/app/ui/widget/theme/app_colors.dart';

class MatchTopRow extends StatelessWidget {
  final MatchInfo match;
  final Color kdaColor;
  final String queueTypeLabel;
  final String playedTimeLabel;
  final int keystoneId;
  final int subStyleId;

  const MatchTopRow({
    super.key,
    required this.match,
    required this.kdaColor,
    required this.queueTypeLabel,
    required this.playedTimeLabel,
    required this.keystoneId,
    required this.subStyleId,
  });

  static final Map<int, String> keystoneIconUrls = {
    // Precision
    8005:
        'https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Precision/PressTheAttack/PressTheAttack.png',
    8008:
        'https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Precision/LethalTempo/LethalTempoTemp.png',
    8021:
        'https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Precision/FleetFootwork/FleetFootwork.png',
    8010:
        'https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Precision/Conqueror/Conqueror.png',

    // Domination
    8112:
        'https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Domination/Electrocute/Electrocute.png',
    8124:
        'https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Domination/Predator/Predator.png',
    8128:
        'https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Domination/DarkHarvest/DarkHarvest.png',
    9923:
        'https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Domination/HailOfBlades/HailOfBlades.png',

    // Sorcery
    8214:
        'https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Sorcery/SummonAery/SummonAery.png',
    8229:
        'https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Sorcery/ArcaneComet/ArcaneComet.png',
    8230:
        'https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Sorcery/PhaseRush/PhaseRush.png',

    // Resolve
    8437:
        'https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Resolve/GraspOfTheUndying/GraspOfTheUndying.png',
    8439:
        'https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Resolve/VeteranAftershock/VeteranAftershock.png',
    8465:
        'https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Resolve/Guardian/Guardian.png',

    // Inspiration
    8351:
        'https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Inspiration/GlacialAugment/GlacialAugment.png',
    8360:
        'https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Inspiration/UnsealedSpellbook/UnsealedSpellbook.png',
    8369:
        'https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Inspiration/FirstStrike/FirstStrike.png',
  };

  String getSubStyleAsset(int styleId) {
    switch (styleId) {
      case 8000:
        return 'assets/rune/Precision_8000.png';
      case 8100:
        return 'assets/rune/Domination_8100.png';
      case 8200:
        return 'assets/rune/Sorcery_8200.png';
      case 8300:
        return 'assets/rune/Inspiration_8300.png';
      case 8400:
        return 'assets/rune/Resolve_8400.png';
      default:
        return 'assets/rune/Precision_8000.png';
    }
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
            const SizedBox(height: 4),
            Row(
              children: [
                Image.network(
                  keystoneIconUrls[keystoneId] ??
                      'https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Resolve/VeteranAftershock/VeteranAftershock.png',
                  width: 20,
                  height: 20,
                  errorBuilder:
                      (_, __, ___) => Image.network(
                        'https://ddragon.leagueoflegends.com/cdn/img/perk-images/Styles/Resolve/VeteranAftershock/VeteranAftershock.png',
                        width: 20,
                        height: 20,
                        errorBuilder:
                            (_, __, ___) => const Icon(Icons.error, size: 20),
                      ),
                ),
                const SizedBox(width: 4),
                Image.asset(
                  getSubStyleAsset(subStyleId),
                  width: 18,
                  height: 18,
                ),
              ],
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
}
