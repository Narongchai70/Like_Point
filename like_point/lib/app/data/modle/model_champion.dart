class ChampionModel {
  final String id;
  final String name;
  final String imageUrl;

  ChampionModel({required this.id, required this.name, required this.imageUrl});

  factory ChampionModel.fromJson(Map<String, dynamic> json, String version) {
    return ChampionModel(
      id: json['id'],
      name: json['name'],
      imageUrl:
          'https://ddragon.leagueoflegends.com/cdn/$version/img/champion/${json['image']['full']}',
    );
  }
}
