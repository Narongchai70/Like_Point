import 'package:flutter/material.dart';

class MatchItemRow extends StatelessWidget {
  final List<String> items;

  const MatchItemRow({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: items.map(_itemIcon).toList(),
    );
  }

  Widget _itemIcon(String id) {
    if (id == "0" || id == "null") {
      return Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white24),
          borderRadius: BorderRadius.circular(4),
        ),
      );
    }
    return Image.network(
      "https://ddragon.leagueoflegends.com/cdn/15.7.1/img/item/$id.png",
      width: 24,
      height: 24,
      errorBuilder:
          (_, __, ___) => Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white24),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
    );
  }
}
