import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:like_point/app/ui/modules/summoner/summoner_page.dart';
import 'package:like_point/app/data/repositories/summoner_repository.dart';
import 'package:like_point/app/data/providers/account_provider.dart';
import 'package:like_point/app/data/providers/summoner_provider.dart';
import 'package:like_point/app/data/providers/rank_provider.dart';
import 'package:like_point/app/ui/widget/home/home_search_input_controller.dart';
import 'package:like_point/app/ui/widget/home/home_dropdown_controller.dart';

class HomeSummonerSearchController extends GetxController {
  Future<void> searchSummoner(BuildContext context) async {
    final inputController = Get.find<HomeSearchInputController>();
    final dropdownController = Get.find<HomeDropdownController>();

    final name = inputController.searchController.text.trim();
    final region = dropdownController.routing;
    final platform = dropdownController.platform;

    // ✅ ตรวจสอบว่าเลือก server หรือยัง
    if (region == null) {
      Get.snackbar(
        'Server not selected',
        'Please select a server before searching.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    }

    // ✅ ตรวจสอบรูปแบบ Riot ID
    final regex = RegExp(r'^[\w\d]+#[\w\d]+$');
    if (!regex.hasMatch(name)) {
      Get.snackbar(
        'Wrong format',
        'Please enter Riot ID such as RiotGame#SG2',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    }

    FocusScope.of(context).unfocus();

    final repository = SummonerRepository(
      accountProvider: AccountProvider(Dio()),
      summonerProvider: SummonerProvider(Dio()),
      rankProvider: RankProvider(Dio()),
    );

    final profile = await repository.fetchSummonerProfile(name, platform, region!);

    if (profile == null) {
      Get.snackbar(
        'Player not found',
        'Check your Riot ID name and try again.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return;
    }

    Get.to(() => SummonerPage(profile: profile));
  }
}
