import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_point/app/ui/modules/settings/settings_username_controller.dart';

class SettingUsernameTextField extends StatelessWidget {
  SettingUsernameTextField({super.key});

  final controller = Get.put(SettingsUsernameController());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Obx(() {
      return SizedBox(
        width: screenWidth * 0.9,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
            border: Border.all(color: Colors.black, width: 1.5),
          ),
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 48),
                child: SizedBox(
                  height: 56,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      controller.username.value.isNotEmpty
                          ? controller.username.value
                          : "No username",
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: IconButton(
                  icon: const Icon(Icons.edit, color: Colors.black),
                  onPressed: () {
                    final TextEditingController nameController =
                        TextEditingController(text: controller.username.value);

                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Edit Username"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextField(
                                controller: nameController,
                                maxLength: 20,
                                decoration: const InputDecoration(
                                  hintText: "Enter new username",
                                  border: OutlineInputBorder(),
                                  counterText: '',
                                ),
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    controller.updateUsername(
                                      nameController.text,
                                    );
                                    Get.back();
                                  },
                                  child: const Text("OK"),
                                ),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                width: double.infinity,
                                child: OutlinedButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Text("Cancel"),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
