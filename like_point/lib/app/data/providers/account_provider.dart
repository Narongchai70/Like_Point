import 'package:dio/dio.dart';

class AccountProvider {
  final Dio _dio;

  AccountProvider(this._dio);

  Future<Response> fetchAccountByRiotId(
  String gameName,
  String tagLine,
  String token,
  String platformRegion,
) {
  final url =
      'https://$platformRegion.api.riotgames.com/riot/account/v1/accounts/by-riot-id/$gameName/$tagLine';  
  return _dio.get(
    url,
    options: Options(headers: {'X-Riot-Token': token}),
  );
}
}