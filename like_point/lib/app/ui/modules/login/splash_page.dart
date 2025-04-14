import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:like_point/app/ui/modules/login/login_page.dart';
import 'package:like_point/app/ui/widget/navbar_service/home_navigation.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  void _checkLoginStatus() {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Get.offAll(() => HomeNavigation());
    } else {
      Get.offAll(() => const Login());
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkLoginStatus());

    return const Scaffold(
      backgroundColor: Colors.purple,
      body: Center(child: CircularProgressIndicator(color: Colors.white)),
    );
  }
}
