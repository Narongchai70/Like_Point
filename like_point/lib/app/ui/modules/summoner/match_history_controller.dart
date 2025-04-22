import 'package:get/get.dart';
import 'package:like_point/app/data/modle/match_info.dart';
import 'package:like_point/app/data/repositories/match_history_repository.dart';
import 'package:like_point/app/ui/widget/home/controller/home_dropdown_controller.dart';

class MatchHistoryController extends GetxController {
  final MatchHistoryRepository repository;

  MatchHistoryController({required this.repository});

  final matchList = <MatchInfo>[].obs;
  final isLoading = false.obs;

  Future<void> loadMatchHistory({required String puuid}) async {
    final dropdownController = Get.find<HomeDropdownController>();
    final region = dropdownController.regionalRouting;

    isLoading.value = true;

    try {
      final matchIds = await repository.fetchMatchIds(
        puuid: puuid,
        region: region,
      );

      matchList.clear();

      const batchSize = 5;
      for (int i = 0; i < matchIds.length; i += batchSize) {
        final batch = matchIds.skip(i).take(batchSize);

        final futures = batch.map(
          (matchId) => repository.fetchMatchDetail(
            matchId: matchId,
            region: region,
            puuid: puuid,
          ),
        );

        final results = await Future.wait(futures);

        matchList.addAll(results.whereType<MatchInfo>());
      }

      update();
    } catch (e) {
      print("❌ Error loading match history: $e");
    }

    isLoading.value = false;
  }
}
