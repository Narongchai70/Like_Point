import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:like_point/app/data/providers/account_provider.dart';
import 'package:like_point/app/data/providers/champion_detail_provider.dart';
import 'package:like_point/app/data/providers/champion_provider%20.dart';
import 'package:like_point/app/data/providers/rank_provider.dart';
import 'package:like_point/app/data/providers/summoner_provider.dart';
import 'package:like_point/app/data/providers/match_history_provider.dart';
import 'package:like_point/app/data/providers/version_provider.dart';

import 'package:like_point/app/data/repositories/summoner_repository.dart';
import 'package:like_point/app/data/repositories/champion_repository.dart';
import 'package:like_point/app/data/repositories/match_history_repository.dart';

import 'package:like_point/app/ui/modules/champion/champion_controller.dart';
import 'package:like_point/app/ui/modules/champion/champion_detail_controller.dart';
import 'package:like_point/app/ui/modules/login/login_controller.dart';
import 'package:like_point/app/ui/modules/summoner/match_history_controller.dart';
import 'package:like_point/app/ui/modules/summoner/summoner_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // Dio & Providers
    Get.lazyPut(() => Dio());
    Get.lazyPut(() => AccountProvider(Get.find()));
    Get.lazyPut(() => SummonerProvider(Get.find()));
    Get.lazyPut(() => RankProvider(Get.find()));
    Get.lazyPut(() => MatchHistoryProvider(Get.find()));
    Get.lazyPut(() => ChampionProvider(Get.find()));
    Get.lazyPut(() => VersionProvider(Get.find()));
    Get.lazyPut(() => ChampionDetailProvider());
    

    // Repositories
    Get.lazyPut(
      () => SummonerRepository(
        accountProvider: Get.find(),
        summonerProvider: Get.find(),
        rankProvider: Get.find(),
      ),
    );
    Get.lazyPut(
      () =>
          ChampionRepository(provider: Get.find(), versionProvider: Get.find()),
    );
    Get.lazyPut(() => MatchHistoryRepository(matchProvider: Get.find()));

    // Controllers
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => ChampionController(Get.find()));
    Get.lazyPut(() => SummonerController(repository: Get.find()));
    Get.lazyPut(() => MatchHistoryController(repository: Get.find()));

    Get.lazyPut(
      () => ChampionDetailController(
        provider: Get.find(),
        versionProvider: Get.find(),
      ),
    );
  }
}
