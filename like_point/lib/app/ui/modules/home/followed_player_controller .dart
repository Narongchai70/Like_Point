import 'package:get/get.dart';
import 'package:like_point/app/data/modle/followed_player.dart';
import 'package:like_point/app/data/repositories/followed_player_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FollowedPlayerController extends GetxController {
  final FollowedPlayerRepository repository;

  FollowedPlayerController({required this.repository});

  final followedList = <FollowedPlayer>[].obs;
  final isLoading = false.obs;

  Future<void> loadFollowedPlayers() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    isLoading.value = true;
    final list = await repository.getFollowedPlayers(user.uid);
    followedList.assignAll(list);
    isLoading.value = false;
  }

  Future<void> followPlayer(FollowedPlayer player) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    await repository.followPlayer(userId: user.uid, player: player);
    await loadFollowedPlayers();
  }

  Future<void> unfollowPlayer(String puuid) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    await repository.unfollowPlayer(userId: user.uid, puuid: puuid);
    await loadFollowedPlayers();
  }

  bool isFollowing(String puuid) {
    return followedList.any((player) => player.puuid == puuid);
  }
}
