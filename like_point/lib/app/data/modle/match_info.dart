class MatchInfo {
  final String result;
  final int teamScore;
  final int enemyScore;
  final String championIcon;
  final List<String> spells;
  final List<String> runes;
  final List<String> items;
  final int kills;
  final int deaths;
  final int assists;
  final double killParticipation;
  final String queueType;
  final String playedAgo;

  MatchInfo({
    required this.result,
    required this.teamScore,
    required this.enemyScore,
    required this.championIcon,
    required this.spells,
    required this.runes,
    required this.items,
    required this.kills,
    required this.deaths,
    required this.assists,
    required this.killParticipation,
    required this.queueType,
    required this.playedAgo,
  });
}
