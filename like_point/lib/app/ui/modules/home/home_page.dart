import 'package:flutter/material.dart';
import 'package:like_point/app/ui/widget/bottom_navbar_service.dart';
import 'package:like_point/app/ui/widget/home/home_search_button.dart';
import 'package:like_point/app/ui/widget/home/home_search_text_file.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavBarService(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
