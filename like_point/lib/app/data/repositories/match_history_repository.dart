import 'package:like_point/app/data/modle/match_info.dart';
import 'package:like_point/app/data/providers/match_history_provider.dart';

class MatchHistoryRepository {
  final MatchHistoryProvider matchProvider;

  MatchHistoryRepository({required this.matchProvider});

  Future<List<String>> fetchMatchIds({
    required String puuid,
    required String region,
    int count = 20,
  }) async {
    final response = await matchProvider.getMatchIds(
      puuid: puuid,
      region: region,
      count: count,
    );

    return response;
  }

  Future<MatchInfo?> fetchMatchDetail({
    required String matchId,
    required String region,
    required String puuid,
  }) async {
    final data = await matchProvider.getMatchDetail(
      matchId: matchId,
      region: region,
    );

    final info = data['info'];
    final participants = List<Map<String, dynamic>>.from(info['participants']);

    late final Map<String, dynamic> playerData;
    try {
      playerData = participants.firstWhere((p) => p['puuid'] == puuid);
    } catch (e) {
      return null;
    }

    return MatchInfo(
      result: playerData['win'] == true ? 'Win' : 'Loss',
      teamScore: 0,
      enemyScore: 0,
      championIcon: playerData['championName'],
      spells: [
        playerData['summoner1Id'].toString(),
        playerData['summoner2Id'].toString(),
      ],
      runes: [
        playerData['perks']['styles'][0]['selections'][0]['perk'].toString(),
        playerData['perks']['styles'][1]['style'].toString(),
      ],
      items: List.generate(6, (i) => playerData['item$i'].toString()),
      kills: playerData['kills'],
      deaths: playerData['deaths'],
      assists: playerData['assists'],
      killParticipation: 0,
      queueType: info['queueId'].toString(),
      playedAgo:
          DateTime.fromMillisecondsSinceEpoch(
            info['gameStartTimestamp'],
          ).toLocal().toString(),
      gameDuration: _formatDuration(info['gameDuration']),
    );
  }

  String _formatDuration(int durationSeconds) {
    final duration = Duration(seconds: durationSeconds);
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds.remainder(60);
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
