class RankInfo {
  final String queueType;
  final String tier;
  final String rank;
  final int lp;
  final int wins;
  final int losses;

  RankInfo({
    required this.queueType,
    required this.tier,
    required this.rank,
    required this.lp,
    required this.wins,
    required this.losses,
  });

  double get winRate {
    final total = wins + losses;
    return total == 0 ? 0 : (wins / total) * 100;
  }
}
