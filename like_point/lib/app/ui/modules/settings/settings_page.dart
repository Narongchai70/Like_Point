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
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 128, 33, 155)),
      extendBody: true,
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
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 12),
                    SettingEmailTextField(),
                    SizedBox(height: 30),
                    Text(
                      'Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SettingPasswordTextField(),
                    SizedBox(height: 70),
                    Text(
                      'UserName',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 20),
                    SettingUsernameTextField(),
                    SizedBox(height: 38),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [SettingLogout()],
                    ),
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
