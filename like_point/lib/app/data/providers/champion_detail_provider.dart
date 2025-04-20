import 'package:dio/dio.dart';

class ChampionDetailProvider {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> fetchChampionDetail(String id, String version) async {
    final url = 'https://ddragon.leagueoflegends.com/cdn/$version/data/en_US/champion/$id.json';
    final response = await _dio.get(url);

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Failed to load champion detail');
    }
  }
}
