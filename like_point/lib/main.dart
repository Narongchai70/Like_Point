import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:like_point/app/app_binding.dart';
import 'package:like_point/app/ui/modules/login/splash_page.dart';
import 'package:like_point/app/ui/modules/login/login_page.dart';
import 'package:like_point/app/ui/widget/navbar_service/home_navigation.dart';
import 'package:like_point/app/ui/widget/theme/theme_controller.dart'; // << เพิ่ม

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Get.put(ThemeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    final themeController = Get.find<ThemeController>();

    return Obx(() => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeController.theme, 
          initialBinding: AppBinding(),
          home: const SplashPage(),
          getPages: [
            
            GetPage(name: '/login', page: () => const Login()),
            GetPage(name: '/home', page: () => HomeNavigation()),
          ],
        ));
  }
}
