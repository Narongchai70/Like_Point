import 'package:get/get.dart';
import 'package:like_point/app/data/modle/campion_detail_model.dart';
import 'package:like_point/app/data/repositories/champion_detail_repository.dart';

class ChampionDetailController extends GetxController {
  final ChampionDetailRepository repository;

  ChampionDetailController({required this.repository});

  var isLoading = false.obs;
  var detail = Rxn<ChampionDetailModel>();

  Future<void> loadChampionDetail(String id) async {
    try {
      isLoading.value = true;
      final result = await repository.fetchDetail(id);
      detail.value = result;
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
