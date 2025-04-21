import 'package:like_point/app/data/modle/model_champion.dart';
import 'package:like_point/app/data/providers/champion_provider%20.dart';

import 'package:like_point/app/data/providers/version_provider.dart';

class ChampionRepository {
  final ChampionProvider provider;
  final VersionProvider versionProvider;

  ChampionRepository({
    required this.provider,
    required this.versionProvider,
  });

  Future<List<ChampionModel>> fetchChampions() async {
    final version = await versionProvider.fetchLatestVersion();
    final data = await provider.getAllChampions(version);

    return data.values
        .map((champion) => ChampionModel.fromJson(champion, version))
        .toList();
  }
}
