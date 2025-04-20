class ChampionDetailModel {
  final String id;
  final String name;
  final String title;
  final String blurb;
  final String fullImageUrl;
  final String passiveName;
  final String passiveDescription;
  final String passiveImageUrl;
  final List<Skill> spells;
  final List<Skin> skins;
  final List<String> tags;
  final int difficulty;

  ChampionDetailModel({
    required this.id,
    required this.name,
    required this.title,
    required this.blurb,
    required this.fullImageUrl,
    required this.passiveName,
    required this.passiveDescription,
    required this.passiveImageUrl,
    required this.spells,
    required this.skins,
    required this.tags,
    required this.difficulty,
  });

  factory ChampionDetailModel.fromJson(Map<String, dynamic> json, String version) {
    final data = json['data'] as Map<String, dynamic>;
    final champ = data.values.first;
    return ChampionDetailModel(
      id: champ['id'],
      name: champ['name'],
      title: champ['title'],
      blurb: champ['blurb'],
      fullImageUrl: 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/${champ['id']}_0.jpg',
      passiveName: champ['passive']['name'],
      passiveDescription: champ['passive']['description'],
      passiveImageUrl: 'https://ddragon.leagueoflegends.com/cdn/$version/img/passive/${champ['passive']['image']['full']}',
      spells: (champ['spells'] as List)
          .map((s) => Skill.fromJson(s, version))
          .toList(),
      skins: (champ['skins'] as List)
          .map((s) => Skin.fromJson(s, champ['id']))
          .toList(),
      tags: List<String>.from(champ['tags']),
      difficulty: champ['info']['difficulty'],
    );
  }
}

class Skill {
  final String name;
  final String description;
  final String imageUrl;

  Skill({
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  factory Skill.fromJson(Map<String, dynamic> json, String version) {
    return Skill(
      name: json['name'],
      description: json['description'],
      imageUrl: 'https://ddragon.leagueoflegends.com/cdn/$version/img/spell/${json['image']['full']}',
    );
  }
}

class Skin {
  final String name;
  final String imageUrl;

  Skin({required this.name, required this.imageUrl});

  factory Skin.fromJson(Map<String, dynamic> json, String champId) {
    return Skin(
      name: json['name'] == 'default' ? champId : json['name'],
      imageUrl:
          'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/${champId}_${json['num']}.jpg',
    );
  }
}
