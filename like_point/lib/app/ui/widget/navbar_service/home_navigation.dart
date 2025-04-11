import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_point/app/ui/widget/navbar_service/bottom_navbar_service.dart';
import 'package:like_point/app/ui/widget/navbar_service/nav_controller.dart';

class HomeNavigation extends StatelessWidget {
  const HomeNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final NavController controller = Get.put(NavController());

    return Obx(
      () => Scaffold(
        extendBody: true,
        body: IndexedStack(
          index: controller.selectedIndex.value,
          children: controller.pages.map((builder) => builder()).toList(),
        ),
        bottomNavigationBar: NavigationBarService(
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) {
            controller.selectedIndex.value = index;
          },
        ),
      ),
    );
  }
}
