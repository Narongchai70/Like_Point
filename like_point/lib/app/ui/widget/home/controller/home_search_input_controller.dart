import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeSearchInputController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  var isFocused = false.obs;

  @override
  void onInit() {
    super.onInit();
    focusNode.addListener(() {
      isFocused.value = focusNode.hasFocus;
    });
  }

  @override
  void onClose() {
    searchController.dispose();
    focusNode.dispose();
    super.onClose();
  }
}
