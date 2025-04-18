class ChampionStats {
  final String championName;
  final String championImageUrl;
  final int wins;
  final int losses;

  ChampionStats({
    required this.championName,
    required this.championImageUrl,
    required this.wins,
    required this.losses,
  });

  double get winRate {
    final total = wins + losses;
    return total == 0 ? 0 : (wins / total) * 100;
  }
}
