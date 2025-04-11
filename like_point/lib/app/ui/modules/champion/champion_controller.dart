import 'package:get/get.dart';
import 'package:like_point/app/data/modle/model_champion.dart';
import 'package:like_point/app/data/repositories/champion_repository.dart';

class ChampionController extends GetxController {
  final _champions = <ChampionModel>[].obs;
  final _isLoading = false.obs;

  List<ChampionModel> get champions => _champions;
  bool get isLoading => _isLoading.value;

  final ChampionRepository _repository = ChampionRepository();

  @override
  void onInit() {
    fetchChampions();
    super.onInit();
  }

  void fetchChampions() async {
    _isLoading.value = true;
    try {
      final result = await _repository.fetchChampions();
      _champions.assignAll(result);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch champions');
    } finally {
      _isLoading.value = false;
    }
  }
}
