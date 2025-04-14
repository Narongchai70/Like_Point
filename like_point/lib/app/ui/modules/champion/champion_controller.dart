import 'package:get/get.dart';
import 'package:like_point/app/data/modle/model_champion.dart';
import 'package:like_point/app/data/repositories/champion_repository.dart';

class ChampionController extends GetxController {
  final champions = <ChampionModel>[].obs;
  final isLoading = false.obs;

  final ChampionRepository _repository = ChampionRepository();

  @override
  void onInit() {
    fetchChampions();
    super.onInit();
  }

  void fetchChampions() async {
    isLoading.value = true;
    try {
      final result = await _repository.fetchChampions();
      champions.assignAll(result);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch champions');
    } finally {
      isLoading.value = false;
    }
  }
}
