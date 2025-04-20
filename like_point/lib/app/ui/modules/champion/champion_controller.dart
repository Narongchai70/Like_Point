import 'package:get/get.dart';
import 'package:like_point/app/data/modle/model_champion.dart';
import 'package:like_point/app/data/repositories/champion_repository.dart';

class ChampionController extends GetxController {
  final ChampionRepository repository;

  ChampionController(this.repository);

  var isLoading = false.obs;
  var champions = <ChampionModel>[].obs;
  var filteredChampions = <ChampionModel>[].obs;
  var searchText = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchChampions();
    ever(searchText, (_) => _filterChampions());
  }

  Future<void> fetchChampions() async {
    try {
      isLoading.value = true;
      final result = await repository.fetchChampions();
      champions.value = result;
      filteredChampions.value = result;
    } catch (e) {
      print("Error fetching champions: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void _filterChampions() {
    final query = searchText.value.toLowerCase();
    filteredChampions.value = champions
        .where((c) => c.name.toLowerCase().contains(query))
        .toList();
  }
}
