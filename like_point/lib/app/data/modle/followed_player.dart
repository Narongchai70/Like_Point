import 'package:cloud_firestore/cloud_firestore.dart';

class FollowedPlayer {
  final String puuid;
  final String name;
  final String profileIconUrl;
  final String platform;
  final String region;
  final String riotId;

  FollowedPlayer({
    required this.puuid,
    required this.name,
    required this.profileIconUrl,
    required this.platform,
    required this.region,
    required this.riotId,
  });

  factory FollowedPlayer.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return FollowedPlayer(
      puuid: data['puuid'] ?? '',
      name: data['name'] ?? '',
      profileIconUrl: data['profileIconUrl'] ?? '',
      platform: data['platform'] ?? '',
      region: data['region'] ?? '',
      riotId: data['riotId'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'puuid': puuid,
      'name': name,
      'profileIconUrl': profileIconUrl,
      'platform': platform,
      'region': region,
      'riotId': riotId,
    };
  }
}
