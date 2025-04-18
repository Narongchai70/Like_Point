import 'package:dio/dio.dart';
import 'package:like_point/app/data/modle/rank_info.dart';
import 'package:like_point/app/data/modle/summoner_profile.dart';
import 'package:like_point/app/data/modle/riot_token_service.dart';

class SummonerProvider {
  static final Dio _dio = Dio();

  static Future<SummonerProfile?> fetchSummonerByRiotId(String riotId) async {
    final token = await RiotTokenService.getToken();
    if (token == null) {
      print('ไม่พบ Riot API Token');
      return null;
    }

    try {
      final parts = riotId.split('#');
      if (parts.length != 2) {
        print('Riot ID format ไม่ถูกต้อง: $riotId');
        return null;
      }

      final gameName = parts[0];
      final tagLine = parts[1];

      print('🔍 เรียก account จาก Riot ID: $gameName#$tagLine');

      // 1. Get puuid
      final accountRes = await _dio.get(
        'https://asia.api.riotgames.com/riot/account/v1/accounts/by-riot-id/$gameName/$tagLine',
        options: Options(headers: {'X-Riot-Token': token}),
      );

      final puuid = accountRes.data['puuid'];
      print('ได้ puuid: $puuid');

      // 2. Get summoner info
      final summonerRes = await _dio.get(
        'https://sg2.api.riotgames.com/lol/summoner/v4/summoners/by-puuid/$puuid',
        options: Options(headers: {'X-Riot-Token': token}),
      );

      final summoner = summonerRes.data;
      final summonerId = summoner['id'];
      final profileIconId = summoner['profileIconId'];
      final level = summoner['summonerLevel'];
      final summonerName = summoner['name'] as String? ?? gameName;

      print('👤 Summoner: $summonerName | Level: $level | ID: $summonerId');

      final profileIconUrl =
          'https://ddragon.leagueoflegends.com/cdn/14.8.1/img/profileicon/$profileIconId.png';

      // 3. Get rank info
      final rankRes = await _dio.get(
        'https://sg2.api.riotgames.com/lol/league/v4/entries/by-puuid/$puuid',
        options: Options(headers: {'X-Riot-Token': token}),
      );

      final ranks =
          (rankRes.data as List).map((e) {
            print(
              "แรงค์: ${e['queueType']} ${e['tier']} ${e['rank']} - ${e['leaguePoints']} LP",
            );
            return RankInfo(
              queueType: e['queueType'],
              tier: e['tier'],
              rank: e['rank'],
              lp: e['leaguePoints'],
              wins: e['wins'],
              losses: e['losses'],
            );
          }).toList();

      print('จำนวนแรงค์ที่เจอ: ${ranks.length}');

      return SummonerProfile(
        name: summonerName,
        level: level,
        profileIconUrl: profileIconUrl,
        ranks: ranks,
      );
    } catch (e) {
      print('ERROR: $e');
      return null;
    }
  }
}
