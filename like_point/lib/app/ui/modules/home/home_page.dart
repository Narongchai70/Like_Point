import 'package:flutter/material.dart';
import 'package:like_point/app/ui/widget/home/home_bottun_text_see_all.dart';
import 'package:like_point/app/ui/widget/home/home_carouselview.dart';
import 'package:like_point/app/ui/widget/home/home_dropdown.dart';
import 'package:like_point/app/ui/widget/home/home_search_button.dart';
import 'package:like_point/app/ui/widget/home/home_search_text_file.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                AppBar(backgroundColor: Colors.transparent, elevation: 0),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            HomeSearchTextFile(),
                            const SizedBox(width: 10),
                            HomeSearchButton(onPressed: () {}),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(children: [HomeDropdown()]),

                        Row(
                          children: [
                            const Text(
                              'Followed players',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Spacer(),
                            HomeBottunTextSeeAll(),
                          ],
                        ),
                        HomeCarouselview(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
