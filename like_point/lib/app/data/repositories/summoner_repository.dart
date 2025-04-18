import 'package:like_point/app/data/modle/rank_info.dart';
import 'package:like_point/app/data/modle/riot_token_service.dart';
import 'package:like_point/app/data/modle/summoner_profile.dart';
import 'package:like_point/app/data/providers/account_provider.dart';
import 'package:like_point/app/data/providers/rank_provider.dart';
import 'package:like_point/app/data/providers/summoner_provider.dart';

class SummonerRepository {
  final AccountProvider accountProvider;
  final SummonerProvider summonerProvider;
  final RankProvider rankProvider;

  SummonerRepository({
    required this.accountProvider,
    required this.summonerProvider,
    required this.rankProvider,
  });

  Future<SummonerProfile?> fetchSummonerProfile(
    String riotId,
    String platform,
    String region,
  ) async {
    final token = await RiotTokenService.getToken();
    if (token == null) {
      print('❌ ไม่มี token');
      return null;
    }

    final parts = riotId.split('#');
    if (parts.length != 2) {
      print('❌ Riot ID ผิดรูปแบบ');
      return null;
    }

    final gameName = parts[0];
    final tagLine = parts[1];

    try {
      final accountRes = await accountProvider.fetchAccountByRiotId(
        gameName,
        tagLine,
        token,
        platform,
      );
      final puuid = accountRes.data['puuid'];

      final summonerRes = await summonerProvider.fetchSummonerByPuuid(
        puuid,
        token,
        region,
      );
      final summoner = summonerRes.data;
      final summonerId = summoner['id'];
      final level = summoner['summonerLevel'];
      final profileIconId = summoner['profileIconId'];
      final name = summoner['name'] as String? ?? gameName;
      final profileIconUrl =
          'https://ddragon.leagueoflegends.com/cdn/14.8.1/img/profileicon/$profileIconId.png';

      final rankRes = await rankProvider.fetchRanksByPuuid(
        puuid,
        token,
        region,
      );
      final ranks = (rankRes.data as List)
          .map((e) => RankInfo(
                queueType: e['queueType'],
                tier: e['tier'],
                rank: e['rank'],
                lp: e['leaguePoints'],
                wins: e['wins'],
                losses: e['losses'],
              ))
          .toList();

      return SummonerProfile(
        name: name,
        level: level,
        profileIconUrl: profileIconUrl,
        ranks: ranks,
      );
    } catch (e) {
      print('❌ ERROR (repository): $e');
      return null;
    }
  }
}
