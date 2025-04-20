import 'package:dio/dio.dart';

class RankProvider {
  final Dio _dio;

  RankProvider(this._dio);

  Future<Response> fetchRanksByPuuid(
    String puuid,
    String token,
    String region,
  ) {
    return _dio.get(
      'https://$region.api.riotgames.com/lol/league/v4/entries/by-puuid/$puuid',
      options: Options(headers: {'X-Riot-Token': token}),
    );
  }
}
