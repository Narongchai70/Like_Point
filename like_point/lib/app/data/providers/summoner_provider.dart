import 'package:dio/dio.dart';

class SummonerProvider {
  final Dio _dio;

  SummonerProvider(this._dio);

  Future<Response> fetchSummonerByPuuid(
    String puuid,
    String token,
    String region,
  ) {
    return _dio.get(
      'https://$region.api.riotgames.com/lol/summoner/v4/summoners/by-puuid/$puuid',
      options: Options(headers: {'X-Riot-Token': token}),
    );
  }
}