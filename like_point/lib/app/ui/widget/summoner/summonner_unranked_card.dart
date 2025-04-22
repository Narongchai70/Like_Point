import 'package:flutter/material.dart';

class UnrankedRankCard extends StatelessWidget {
  const UnrankedRankCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/rank/Rank=Unranked.png",
            width: 60,
            height: 60,
            errorBuilder:
                (context, error, stackTrace) => const Icon(
                  Icons.help_outline,
                  color: Colors.white,
                  size: 48,
                ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Text(
              "No rank information yet.\n(Players may not be playing ranked this season.)",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
