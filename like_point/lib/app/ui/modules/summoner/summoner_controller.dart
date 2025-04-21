import 'package:get/get.dart';
import 'package:like_point/app/data/modle/summoner_profile.dart';
import 'package:like_point/app/data/repositories/summoner_repository.dart';
import 'package:like_point/app/ui/modules/summoner/match_history_controller.dart';

class SummonerController extends GetxController {
  final SummonerRepository repository;

  SummonerController({required this.repository});

  var isLoading = true.obs;
  var profile = Rxn<SummonerProfile>();
  var isFollowing = false.obs;

  Future<void> loadProfile({
    required String riotId,
    required String platform,
    required String region,
  }) async {
    isLoading.value = true;

    final result = await repository.fetchSummonerProfile(riotId, platform, region);
    if (result != null) {
      profile.value = result;

      final matchController = Get.find<MatchHistoryController>();
      await matchController.loadMatchHistory(
        puuid: result.puuid,
      );
    }

    isLoading.value = false;
  }

  void toggleFollow() {
    isFollowing.value = !isFollowing.value;
  }
}
