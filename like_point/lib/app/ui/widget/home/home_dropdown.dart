import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_dropdown_controller.dart';

class HomeDropdown extends StatelessWidget {
  HomeDropdown({super.key});

  final HomeDropdownController controller = Get.put(HomeDropdownController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9, 
      child: Obx(() {
        return DropdownMenu<String>(
          hintText: 'SERVER',
          trailingIcon: const Icon(Icons.arrow_drop_down, color: Colors.white),
          initialSelection: controller.selectedItem.value,
          onSelected: (value) => controller.selectItem(value),
          textStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          menuStyle: MenuStyle(
            backgroundColor: WidgetStateProperty.all(Colors.white),
            elevation: WidgetStateProperty.all(4),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            maximumSize: WidgetStateProperty.all(
              const Size.fromHeight(200), 
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: const TextStyle(color: Colors.white),
            filled: true,
            fillColor: const Color.fromRGBO(52, 152, 219, 1),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: Colors.white, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: Colors.white, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: Colors.white, width: 2),
            ),
          ),
          dropdownMenuEntries: controller.serverList
              .map((e) => DropdownMenuEntry<String>(
                    value: e,
                    label: e.toUpperCase(), 
                  ))
              .toList(),
        );
      }),
    );
  }
}