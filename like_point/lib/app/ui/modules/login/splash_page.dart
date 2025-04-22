import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:like_point/app/ui/modules/login/login_page.dart';
import 'package:like_point/app/ui/widget/navbar_service/home_navigation.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, _checkLoginStatus);
  }

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
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/icon/icon_app_home.png',
              height: screenHeight * 0.18,
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }
}
