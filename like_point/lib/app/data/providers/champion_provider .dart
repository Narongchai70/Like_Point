import 'package:dio/dio.dart';

class ChampionProvider {
  final Dio _dio;

  ChampionProvider(this._dio);

  Future<Map<String, dynamic>> getAllChampions(String version) async {
    final url = 'https://ddragon.leagueoflegends.com/cdn/$version/data/en_US/champion.json';
    final response = await _dio.get(url);
    return response.data['data']; 
  }
}
