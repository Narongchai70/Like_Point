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

  factory RankInfo.fromMap(Map<String, dynamic> map) {
    return RankInfo(
      queueType: map['queueType'] ?? '',
      tier: map['tier'] ?? '',
      rank: map['rank'] ?? '',
      lp: map['leaguePoints'] ?? 0,
      wins: map['wins'] ?? 0,
      losses: map['losses'] ?? 0,
    );
  }
}
