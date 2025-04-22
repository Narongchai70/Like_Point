import 'package:like_point/app/data/modle/campion_detail_model.dart';
import 'package:like_point/app/data/providers/champion_detail_provider.dart';
import 'package:like_point/app/data/providers/version_provider.dart';

class ChampionDetailRepository {
  final ChampionDetailProvider provider;
  final VersionProvider versionProvider;

  ChampionDetailRepository({
    required this.provider,
    required this.versionProvider,
  });

  Future<ChampionDetailModel> fetchDetail(String id) async {
    final version = await versionProvider.fetchLatestVersion();
    final json = await provider.fetchChampionDetail(id, version);
    return ChampionDetailModel.fromJson(json, version);
  }
}
