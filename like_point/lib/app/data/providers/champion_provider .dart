import 'package:get/get.dart';

class ChampionProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl =
        'https://ddragon.leagueoflegends.com/cdn/15.7.1/data/en_US';
    super.onInit();
  }

  Future<Response> getAllChampions() => get('/champion.json');
}
