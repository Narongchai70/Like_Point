import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:like_point/app/data/providers/account_provider.dart';
import 'package:like_point/app/data/providers/champion_detail_provider.dart';
import 'package:like_point/app/data/providers/champion_provider%20.dart';
import 'package:like_point/app/data/providers/match_history_provider.dart';
import 'package:like_point/app/data/providers/rank_provider.dart';
import 'package:like_point/app/data/providers/summoner_provider.dart';
import 'package:like_point/app/data/providers/version_provider.dart';
import 'package:like_point/app/data/repositories/champion_detail_repository.dart';
import 'package:like_point/app/data/repositories/match_history_repository.dart';
import 'package:like_point/app/data/repositories/summoner_repository.dart';
import 'package:like_point/app/data/repositories/champion_repository.dart';
import 'package:like_point/app/ui/modules/champion/champion_controller.dart';
import 'package:like_point/app/ui/modules/champion/champion_detail_controller.dart';
import 'package:like_point/app/ui/modules/login/login_controller.dart';
import 'package:like_point/app/ui/modules/summoner/match_history_controller.dart';
import 'package:like_point/app/ui/modules/summoner/summoner_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // Core
    Get.lazyPut(() => Dio(), fenix: true);

    // Providers
    Get.lazyPut(() => AccountProvider(Get.find()), fenix: true);
    Get.lazyPut(() => SummonerProvider(Get.find()), fenix: true);
    Get.lazyPut(() => RankProvider(Get.find()), fenix: true);
    Get.lazyPut(() => ChampionProvider(Get.find<Dio>()), fenix: true);
    Get.lazyPut(() => VersionProvider(Get.find<Dio>()), fenix: true);
    Get.lazyPut(() => ChampionDetailProvider(), fenix: true);
    Get.lazyPut(() => MatchHistoryProvider(Get.find()), fenix: true);
    Get.lazyPut(
      () => MatchHistoryController(repository: Get.find()),
      fenix: true,
    );

    // Repositories
    Get.lazyPut(
      () => SummonerRepository(
        accountProvider: Get.find(),
        summonerProvider: Get.find(),
        rankProvider: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut(
      () =>
          ChampionRepository(provider: Get.find(), versionProvider: Get.find()),
      fenix: true,
    );

    Get.lazyPut(
      () => ChampionDetailRepository(
        provider: Get.find(),
        versionProvider: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => MatchHistoryRepository(matchProvider: Get.find()),
      fenix: true,
    );
    // Controllers
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => ChampionController(Get.find()), fenix: true);
    Get.lazyPut(
      () => ChampionDetailController(repository: Get.find()),
      fenix: true,
    );
    Get.lazyPut(() => SummonerController(repository: Get.find()), fenix: true);
  }
}
