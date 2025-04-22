import 'package:get/get.dart';
import 'package:like_point/app/data/modle/campion_detail_model.dart';
import 'package:like_point/app/data/providers/champion_detail_provider.dart';
import 'package:like_point/app/data/providers/version_provider.dart';

class ChampionDetailController extends GetxController {
  final ChampionDetailProvider provider;
  final VersionProvider versionProvider;

  ChampionDetailController({
    required this.provider,
    required this.versionProvider,
  });

  var isLoading = false.obs;
  var detail = Rxn<ChampionDetailModel>();

  Future<void> loadChampionDetail(String id) async {
    try {
      isLoading.value = true;

      final version = await versionProvider.fetchLatestVersion();
      final json = await provider.fetchChampionDetail(id, version);
      final result = ChampionDetailModel.fromJson(json, version);
      detail.value = result;
    } catch (e) {
      print('Error loading champion detail: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
