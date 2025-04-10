import 'package:flutter/material.dart';
import 'package:like_point/app/ui/widget/champion/champion_list_view.dart';
import 'package:like_point/app/ui/widget/champion/champion_search_button.dart';
import 'package:like_point/app/ui/widget/champion/champion_search_text_file.dart';

class ChampionPage extends StatefulWidget {
  const ChampionPage({super.key});

  @override
  State<ChampionPage> createState() => _ChampionPageState();
}

class _ChampionPageState extends State<ChampionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor:Color.fromARGB(255, 128, 33, 155), ),
      extendBody: true,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 128, 33, 155),
                  Color.fromARGB(255, 212, 0, 249),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Expanded(child: ChampionSearchTextFile()),
                      const SizedBox(width: 10),
                      ChampionSearchButton(onPressed: () {}),
                    ],
                  ),
                ),

                Expanded(child: ChampionListView()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
