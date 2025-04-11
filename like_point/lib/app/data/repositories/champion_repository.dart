import 'package:dio/dio.dart';
import 'package:like_point/app/data/modle/model_champion.dart';
import '../providers/version_provider.dart';

class ChampionRepository {
  final Dio _dio = Dio();
  final VersionProvider _versionProvider = VersionProvider();

  Future<List<ChampionModel>> fetchChampions() async {
    try {
      final version = await _versionProvider.fetchLatestVersion();

      final response = await _dio.get(
        'https://ddragon.leagueoflegends.com/cdn/$version/data/en_US/champion.json',
      );

      final data = response.data['data'] as Map<String, dynamic>;
      return data.values
          .map((champion) => ChampionModel.fromJson(champion, version))
          .toList();
    } catch (e) {
      print('Error fetching champions: $e');
      rethrow;
    }
  }
}
