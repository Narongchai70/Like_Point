import 'package:flutter/material.dart';
import 'package:like_point/app/data/modle/match_info.dart';
import 'match_result_panel.dart';
import 'match_top_row.dart';
import 'match_item_row.dart';
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

  String _getDaysAgo(String dateString) {
    try {
      final playedTime = DateTime.parse(dateString);
      final now = DateTime.now();
      final difference = now.difference(playedTime).inDays;
      if (difference == 0) return "today";
      if (difference == 1) return "yesterday";
      return "$difference days ago";
    } catch (_) {
      return "unknown";
    }
  }

  Widget build(BuildContext context) {
    final isWin = match.result == "Win";
    final resultColor = isWin ? Colors.blue : Colors.red;
    final kdaColor = match.deaths > 0 ? Colors.red : AppColors.textLight;
    final queueTypeLabel = _queueTypeName(match.queueType);
    final playedTimeLabel = _getDaysAgo(match.playedAgo);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      decoration: BoxDecoration(
        color: AppColors.getCardColor(context),
        border: Border.all(color: resultColor, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MatchResultPanel(
              result: match.result,
              duration: match.gameDuration,
              color: resultColor,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MatchTopRow(
                      match: match,
                      kdaColor: kdaColor,
                      queueTypeLabel: queueTypeLabel,
                      playedTimeLabel: playedTimeLabel,
                    ),
                    const SizedBox(height: 6),
                    MatchItemRow(items: match.items),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
