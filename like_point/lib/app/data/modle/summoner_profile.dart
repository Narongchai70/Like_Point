import 'package:like_point/app/data/modle/rank_info.dart';

class SummonerProfile {
  final String name;
  final int level;
  final String profileIconUrl;
  final List<RankInfo> ranks;
  final String puuid;
  final String platform;
  final String region;
  final String tagLine;

  SummonerProfile({
    required this.name,
    required this.level,
    required this.profileIconUrl,
    required this.ranks,
    required this.puuid,
    required this.platform,
    required this.region,
    required this.tagLine,
  });

  factory SummonerProfile.fromMap(Map<String, dynamic> map) {
    return SummonerProfile(
      name: map['name'] ?? '',
      level: map['level'] ?? 0,
      profileIconUrl: map['profileIconUrl'] ?? '',
      ranks:
          (map['ranks'] as List<dynamic>)
              .map((rank) => RankInfo.fromMap(rank))
              .toList(),
      puuid: map['puuid'] ?? '',
      platform: map['platform'] ?? '',
      region: map['region'] ?? '',
      tagLine: map['tagLine'] ?? '',
    );
  }
}
