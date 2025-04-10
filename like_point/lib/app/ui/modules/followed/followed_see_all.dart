import 'package:flutter/material.dart';

class FollowedSeeAll extends StatefulWidget {
  const FollowedSeeAll({super.key});

  @override
  State<FollowedSeeAll> createState() => _FollowedSeeAllState();
}

class _FollowedSeeAllState extends State<FollowedSeeAll> {
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
        ],
      ),
    );
  }
}
