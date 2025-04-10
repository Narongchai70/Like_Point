import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_point/app/ui/widget/home/home_search_controller.dart';

class HomeSearchTextFile extends StatelessWidget {
  HomeSearchTextFile({super.key});

  final HomeSearchController controller = Get.put(HomeSearchController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(color: Color.fromARGB(0, 0, 0, 25))
        ],
      ),
      child: Obx(() {
        return TextField(
          controller: controller.searchController,
          focusNode: controller.focusNode,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search name#name',
            prefixIcon: controller.isFocused.value
                ? null
                : const Icon(Icons.search, color: Colors.white),
            hintStyle: const TextStyle(color: Colors.white),
            filled: true,
            fillColor: const Color.fromRGBO(217, 217, 217, 0.4),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 18,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color.fromRGBO(255, 255, 255, 0.4),
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(
                color: Color.fromRGBO(253, 253, 253, 0.4),
                width: 1.5,
              ),
            ),
          ),
        );
      }),
    );
  }
}
