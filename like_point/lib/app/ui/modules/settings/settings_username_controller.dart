import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:like_point/app/ui/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:like_point/app/ui/widget/%E0%B8%B7snackbar_service.dart';

class SettingsUsernameController extends GetxController {
  final RxString username = ''.obs;

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  final HomeController homeController = Get.find();

  @override
  void onInit() {
    super.onInit();
    loadUsername();
  }

  Future<void> loadUsername() async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;

    final doc = await _firestore.collection('users').doc(uid).get();
    if (doc.exists && doc.data() != null) {
      username.value = doc.data()!['username'] ?? '';
    }
  }

  Future<void> updateUsername(String newUsername) async {
    final uid = _auth.currentUser?.uid;
    final trimmed = newUsername.trim();

    if (uid == null || trimmed.isEmpty) {
      showSnackBar(
        title: "Error",
        message: "Username cannot be empty",
        backgroundColor: Colors.red[600]!,
        icon: Icons.error_outline,
      );
      return;
    }

    if (trimmed.length > 20) {
      showSnackBar(
        title: "Error",
        message: "Username must not exceed 20 characters",
        backgroundColor: Colors.orange[700]!,
        icon: Icons.warning_amber_outlined,
      );
      return;
    }

    await _firestore.collection('users').doc(uid).update({'username': trimmed});

    username.value = trimmed;

    homeController.updateUsernameLocally(trimmed);

    showSnackBar(
      title: "Success",
      message: "Username updated!",
      backgroundColor: Colors.green[600]!,
      icon: Icons.check_circle_outline,
    );
  }
}
