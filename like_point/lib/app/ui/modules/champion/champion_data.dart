import 'package:flutter/material.dart';

class ChampionData extends StatelessWidget {
  final String title;

  const ChampionData({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 128, 33, 155)),
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
          Center(
            child: Text(
              'รายละเอียดของ $title',
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}
