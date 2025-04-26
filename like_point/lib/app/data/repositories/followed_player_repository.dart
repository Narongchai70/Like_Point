import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:like_point/app/data/modle/followed_player.dart';

class FollowedPlayerRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<FollowedPlayer>> getFollowedPlayers(String userId) async {
    final snapshot =
        await _firestore
            .collection('users')
            .doc(userId)
            .collection('followed_players')
            .get();

    return snapshot.docs
        .map((doc) => FollowedPlayer.fromFirestore(doc))
        .toList();
  }

  Future<void> followPlayer({
    required String userId,
    required FollowedPlayer player,
  }) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('followed_players')
        .doc(player.puuid)
        .set(player.toMap());
  }

  Future<void> unfollowPlayer({
    required String userId,
    required String puuid,
  }) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('followed_players')
        .doc(puuid)
        .delete();
  }

  Future<bool> isFollowing({
    required String userId,
    required String puuid,
  }) async {
    final doc =
        await _firestore
            .collection('users')
            .doc(userId)
            .collection('followed_players')
            .doc(puuid)
            .get();
    return doc.exists;
  }
}
