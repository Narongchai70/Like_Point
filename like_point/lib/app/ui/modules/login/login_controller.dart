import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:like_point/app/ui/widget/%E0%B8%B7snackbar_service.dart';
import 'package:like_point/app/ui/widget/navbar_service/home_navigation.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  RxBool isLoading = false.obs;

  Future<void> login({required String email, required String password}) async {
    try {
      isLoading.value = true;

      await _auth.signInWithEmailAndPassword(email: email, password: password);

      showSnackBar(
        title: "Login Success",
        message: "Welcome back!",
        backgroundColor: Colors.green.shade600,
        icon: Icons.check_circle_outline,
      );

      Get.offAll(() => HomeNavigation());
    } on FirebaseAuthException catch (e) {
      String message = "Login failed.";
      if (e.code == 'user-not-found') {
        message = "No user found for that email.";
      } else if (e.code == 'wrong-password') {
        message = "Incorrect password.";
      }

      showSnackBar(
        title: "Error",
        message: message,
        backgroundColor: Colors.red.shade700,
        icon: Icons.error_outline,
      );
    } catch (e) {
      showSnackBar(
        title: "Error",
        message: "Unexpected error: $e",
        backgroundColor: Colors.orange.shade800,
        icon: Icons.warning_amber_rounded,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
