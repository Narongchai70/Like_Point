import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:like_point/app/ui/modules/login/login_controller.dart';
import 'package:like_point/app/ui/modules/login/login_page.dart';
import 'package:like_point/app/ui/modules/login/splash_page.dart';
import 'package:like_point/app/ui/widget/navbar_service/home_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Get.put(LoginController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
      getPages: [
        GetPage(name: '/login', page: () => const Login()),
        GetPage(name: '/home', page: () => const HomeNavigation()),
      ],
    );
  }
}
