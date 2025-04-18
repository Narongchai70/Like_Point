import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:like_point/app/data/modle/summoner_profile.dart';
import 'package:like_point/app/data/repositories/summoner_repository.dart';
import 'package:like_point/app/data/providers/account_provider.dart';
import 'package:like_point/app/data/providers/summoner_provider.dart';
import 'package:like_point/app/data/providers/rank_provider.dart';

class SummonerPage extends StatelessWidget {
  final SummonerProfile profile;

  const SummonerPage({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
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
                subtitle:
                    Text("${rank.tier} ${rank.rank} - ${rank.lp} LP"),
                trailing:
                    Text("${rank.winRate.toStringAsFixed(1)}%"),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 
