import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_point/app/data/modle/summoner_profile.dart';
import 'package:like_point/app/data/providers/summoner_provider.dart';

class SummonerPage extends StatelessWidget {
  final String riotId;

  const SummonerPage({super.key, required this.riotId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SummonerProfile?>(
      future: SummonerProvider.fetchSummonerByRiotId(riotId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final profile = snapshot.data;
        if (profile == null) {
          return Scaffold(
            appBar: AppBar(title: const Text("Player not found")),
            body: const Center(child: Text("ไม่พบข้อมูลผู้เล่น")),
          );
        }

        return Scaffold(
          appBar: AppBar(title: Text(profile.name)),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(profile.profileIconUrl),
                ),
                const SizedBox(height: 10),
                Text(
                  "Level ${profile.level}",
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20),
                const Text(
                  "แรงค์",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                ...profile.ranks.map(
                  (rank) => ListTile(
                    title: Text(rank.queueType),
                    subtitle: Text("${rank.tier} ${rank.rank} - ${rank.lp} LP"),
                    trailing: Text("${rank.winRate.toStringAsFixed(1)}%"),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
