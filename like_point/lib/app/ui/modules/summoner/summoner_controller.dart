import 'package:get/get.dart';
import 'package:like_point/app/data/modle/followed_player.dart';
import 'package:like_point/app/data/modle/summoner_profile.dart';
import 'package:like_point/app/data/repositories/summoner_repository.dart';
import 'package:like_point/app/ui/modules/home/followed_player_controller%20.dart';
import 'package:like_point/app/ui/modules/summoner/match_history_controller.dart';

class SummonerController extends GetxController {
  final SummonerRepository repository;

  SummonerController({required this.repository});

  var isLoading = true.obs;
  var profile = Rxn<SummonerProfile>();
  var isFollowing = false.obs;
  final puuid = ''.obs;

  final FollowedPlayerController followedPlayerController = Get.find();

  Future<void> loadProfile({
    required String riotId,
    required String platform,
    required String region,
  }) async {
    isLoading.value = true;

    final result = await repository.fetchSummonerProfile(
      riotId,
      platform,
      region,
    );

    if (result != null) {
      profile.value = result;
      puuid.value = result.puuid;

      final matchController = Get.find<MatchHistoryController>();
      await matchController.loadMatchHistory(puuid: result.puuid);
      await checkIfFollowing(result.puuid);
    }

    isLoading.value = false;
  }

  Future<void> checkIfFollowing(String puuid) async {
    isFollowing.value = followedPlayerController.isFollowing(puuid);
  }

  Future<void> toggleFollowAndHandle({
    required String platform,
    required String region,
  }) async {
    if (profile.value == null) return;

    final currentProfile = profile.value!;
    final newPlayer = FollowedPlayer(
      puuid: currentProfile.puuid,
      name: currentProfile.name,
      profileIconUrl: currentProfile.profileIconUrl,
      platform: platform,
      region: region,
      riotId: '${currentProfile.name}#${currentProfile.tagLine}',
    );

    if (isFollowing.value) {
      await followedPlayerController.unfollowPlayer(currentProfile.puuid);
      isFollowing.value = false;
    } else {
      await followedPlayerController.followPlayer(newPlayer);
      isFollowing.value = true;
    }

    await followedPlayerController.loadFollowedPlayers();
  }
}
