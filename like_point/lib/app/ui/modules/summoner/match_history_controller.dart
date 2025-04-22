import 'package:get/get.dart';
import 'package:like_point/app/data/modle/match_info.dart';
import 'package:like_point/app/data/repositories/match_history_repository.dart';
import 'package:like_point/app/ui/widget/home/controller/home_dropdown_controller.dart';

class MatchHistoryController extends GetxController {
  final MatchHistoryRepository repository;

  MatchHistoryController({required this.repository});

  final matchList = <MatchInfo>[].obs;
  final isLoading = false.obs;

  Future<void> loadMatchHistory({
    required String puuid,
    bool forceRefresh = false,
  }) async {
    final dropdownController = Get.find<HomeDropdownController>();
    final region = dropdownController.regionalRouting;

    if (isLoading.value || (!forceRefresh && matchList.isNotEmpty)) return;

    isLoading.value = true;

    try {
      final matchIds = await repository.fetchMatchIds(
        puuid: puuid,
        region: region,
      );

      matchList.clear();

      for (int i = 0; i < matchIds.length; i++) {
        final matchId = matchIds[i];

        final detail = await repository.fetchMatchDetail(
          matchId: matchId,
          region: region,
          puuid: puuid,
        );

        if (detail != null) {
          matchList.add(detail);
        }

        if ((i + 1) % 5 == 0) {
          await Future.delayed(const Duration(seconds: 1));
        }
      }

      update();
    } catch (e) {
      print("❌ Error loading match history: $e");
    }

    isLoading.value = false;
  }
}
