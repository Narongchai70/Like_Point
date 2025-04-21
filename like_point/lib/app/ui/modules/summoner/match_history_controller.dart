import 'package:get/get.dart';
import 'package:like_point/app/data/modle/match_info.dart';
import 'package:like_point/app/data/repositories/match_history_repository.dart';
import 'package:like_point/app/ui/widget/home/controller/home_dropdown_controller.dart';

class MatchHistoryController extends GetxController {
  final MatchHistoryRepository repository;

  MatchHistoryController({required this.repository});

  final isLoading = false.obs;
  final matchList = <MatchInfo>[].obs;

  Future<void> loadMatchHistory({required String puuid}) async {
    final dropdownController = Get.find<HomeDropdownController>();
    final region = dropdownController.regionalRouting;

    isLoading.value = true;
    try {
      final matchIds = await repository.fetchMatchIds(
        puuid: puuid,
        region: region,
      );

      final matchFutures =
          matchIds.map((matchId) {
            return repository.fetchMatchDetail(
              matchId: matchId,
              region: region,
              puuid: puuid,
            );
          }).toList();

      final matchDetails = await Future.wait(matchFutures);
      final matches = matchDetails.whereType<MatchInfo>().toList();
      matchList.assignAll(matches);
      update();
    } catch (e) {}

    isLoading.value = false;
  }
}
