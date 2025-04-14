import 'package:flutter/material.dart';
import 'package:like_point/app/ui/widget/setting/setting_email_text_field.dart';
import 'package:like_point/app/ui/widget/setting/setting_logout.dart';
import 'package:like_point/app/ui/widget/setting/setting_password_text_field.dart';
import 'package:like_point/app/ui/widget/setting/setting_username_text_field.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 128, 33, 155),
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 128, 33, 155),
                  Color.fromARGB(255, 212, 0, 249),
                ],
              ),
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
                        color: Colors.white,
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
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SettingPasswordTextField(),
                    SizedBox(height: screenHeight * 0.06),

                    const Text(
                      'UserName',
                      style: TextStyle(
                        color: Colors.white,
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
