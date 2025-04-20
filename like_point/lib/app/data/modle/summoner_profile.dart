import 'package:like_point/app/data/modle/rank_info.dart';

class SummonerProfile {
  final String name;
  final int level;
  final String profileIconUrl;
  final List<RankInfo> ranks;

  SummonerProfile({
    required this.name,
    required this.level,
    required this.profileIconUrl,
    required this.ranks,
  });
}
