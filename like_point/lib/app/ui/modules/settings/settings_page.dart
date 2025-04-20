import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_point/app/ui/modules/home/home_controller.dart';
import 'package:like_point/app/ui/widget/appbar/custom_appbar.dart';
import 'package:like_point/app/ui/widget/setting/setting_email_text_field.dart';
import 'package:like_point/app/ui/widget/setting/setting_logout.dart';
import 'package:like_point/app/ui/widget/setting/setting_password_text_field.dart';
import 'package:like_point/app/ui/widget/setting/setting_username_text_field.dart';
import 'package:like_point/app/ui/widget/theme/app_colors.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(
        username: controller.username,
        showBackButton: false, 
      ),
      extendBody: true,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: AppColors.getBackgroundGradient(context),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.02),
                    const Text(
                      'Email',
                      style: TextStyle(
                        color: AppColors.textLight,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    const SettingEmailTextField(),
                    SizedBox(height: screenHeight * 0.035),

                    const Text(
                      'Password',
                      style: TextStyle(
                        color: AppColors.textLight,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SettingPasswordTextField(),
                    SizedBox(height: screenHeight * 0.06),

                    const Text(
                      'UserName',
                      style: TextStyle(
                        color: AppColors.textLight,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    SettingUsernameTextField(),
                    SizedBox(height: screenHeight * 0.04),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [SettingLogout()],
                    ),
                    SizedBox(height: screenHeight * 0.02),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
