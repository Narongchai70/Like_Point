import 'package:dio/dio.dart';

class VersionProvider {
  final Dio _dio;

  VersionProvider(this._dio);

  Future<String> fetchLatestVersion() async {
    try {
      final response = await _dio.get(
        'https://ddragon.leagueoflegends.com/api/versions.json',
      );
      if (response.statusCode == 200) {
        final List versions = response.data;
        return versions.first;
      } else {
        throw Exception('Failed to fetch versions');
      }
    } catch (e) {
      rethrow;
    }
  }
}
