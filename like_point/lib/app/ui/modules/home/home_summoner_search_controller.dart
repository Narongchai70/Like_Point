import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_point/app/ui/modules/summoner/summoner_controller.dart';
import 'package:like_point/app/ui/modules/summoner/summoner_page.dart';
import 'package:like_point/app/data/repositories/summoner_repository.dart';
import 'package:like_point/app/ui/widget/%E0%B8%B7snackbar_service.dart';
import 'package:like_point/app/ui/widget/home/controller/home_search_input_controller.dart';
import 'package:like_point/app/ui/widget/home/controller/home_dropdown_controller.dart';

class HomeSummonerSearchController extends GetxController {
  Future<void> searchSummoner(BuildContext context) async {
    final inputController = Get.find<HomeSearchInputController>();
    final dropdownController = Get.find<HomeDropdownController>();

    final name = inputController.searchController.text.trim();
    final region = dropdownController.routing;
    final platform = dropdownController.platform;

    if (region == null) {
      showSnackBar(
        title: 'Server not selected',
        message: 'Please select a server before searching.',
        backgroundColor: Colors.redAccent,
        icon: Icons.error_outline,
      );
      return;
    }

    final regex = RegExp(r'^[\w\d]+#[\w\d]+$');
    if (!regex.hasMatch(name)) {
      showSnackBar(
        title: 'Wrong format',
        message: 'Please enter Riot ID such as RiotGame#SG2',
        backgroundColor: Colors.redAccent,
        icon: Icons.warning_amber,
      );
      return;
    }

    FocusScope.of(context).unfocus();

    final repository = Get.find<SummonerRepository>();

    final profile = await repository.fetchSummonerProfile(
      name,
      platform,
      region,
    );

    if (profile == null) {
      showSnackBar(
        title: 'Player not found',
        message: 'Check your Riot ID name and try again.',
        backgroundColor: Colors.orange,
        icon: Icons.person_off,
      );
      return;
    }

    Get.to(
      () => SummonerPage(
        riotId: name,
        platform: platform,
        region: region,
      ),
      binding: BindingsBuilder(() {
        Get.put(SummonerController(repository: Get.find()));
      }),
    );
  }
}
