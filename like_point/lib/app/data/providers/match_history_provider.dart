import 'package:dio/dio.dart';
import 'package:like_point/app/data/modle/riot_token_service.dart';

class MatchHistoryProvider {
  final Dio _dio;

  MatchHistoryProvider(this._dio);

  Future<List<String>> getMatchIds({
    required String puuid,
    required String region,
    int count = 20,
  }) async {
    final token = await RiotTokenService.getToken();
    if (token == null) {
      throw Exception('API token not found');
    }

    final url =
        'https://$region.api.riotgames.com/lol/match/v5/matches/by-puuid/$puuid/ids';

    final response = await _dio.get(
      url,
      queryParameters: {'start': 0, 'count': count},
      options: Options(headers: {'X-Riot-Token': token}),
    );

    if (response.statusCode == 200) {
      return List<String>.from(response.data);
    } else {
      throw Exception('Failed to load match ids');
    }
  }

  Future<Map<String, dynamic>> getMatchDetail({
    required String matchId,
    required String region,
  }) async {
    final token = await RiotTokenService.getToken();
    if (token == null) {
      throw Exception('API token not found');
    }

    final url =
        'https://$region.api.riotgames.com/lol/match/v5/matches/$matchId';

    final response = await _dio.get(
      url,
      options: Options(headers: {'X-Riot-Token': token}),
    );

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Failed to load match detail');
    }
  }
}
