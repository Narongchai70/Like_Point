import 'package:flutter/material.dart';
import 'package:like_point/app/ui/modules/champion/champion_page.dart';
import 'package:like_point/app/ui/modules/home/home_page.dart';
import 'package:like_point/app/ui/modules/profile/profile_page.dart';
import 'package:like_point/app/ui/modules/settings/settings_page.dart';
import 'package:like_point/app/ui/widget/bottom_navbar_service.dart';

class HomeNavigation extends StatefulWidget {
  const HomeNavigation({super.key});

  @override
  State<HomeNavigation> createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    ChampionPage(),
    ProfilePage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(index: selectedIndex, children: pages),
      bottomNavigationBar: BottomNavBarService(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() => selectedIndex = index);
        },
      ),
    );
  }
}
