import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:like_point/app/data/providers/account_provider.dart';
import 'package:like_point/app/data/providers/rank_provider.dart';
import 'package:like_point/app/data/providers/summoner_provider.dart';
import 'package:like_point/app/data/repositories/champion_repository.dart';
import 'package:like_point/app/data/repositories/summoner_repository.dart';
import 'package:like_point/app/ui/modules/login/login_controller.dart'; 

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // Dio & Providers
    Get.lazyPut(() => Dio());
    Get.lazyPut(() => AccountProvider(Get.find()));
    Get.lazyPut(() => SummonerProvider(Get.find()));
    Get.lazyPut(() => RankProvider(Get.find()));

    // Repository
    Get.lazyPut(() => SummonerRepository(
          accountProvider: Get.find(),
          summonerProvider: Get.find(),
          rankProvider: Get.find(),
        ));
    Get.lazyPut(() => ChampionRepository());

    // Controller (ที่ใช้ทั้งแอป เช่น Login)
    Get.lazyPut(() => LoginController());
  }
}
