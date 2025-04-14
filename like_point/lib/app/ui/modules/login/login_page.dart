import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_point/app/ui/modules/login/login_controller.dart';
import 'package:like_point/app/ui/widget/custom_text_file.dart';

import 'package:like_point/app/ui/widget/login/login_button.dart';
import 'package:like_point/app/ui/widget/login/login_button_facebook.dart';
import 'package:like_point/app/ui/widget/login/login_button_google.dart';
import 'package:like_point/app/ui/widget/login/login_register_button_text.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.02),
                Image.asset(
                  'assets/icon/icon_app_home.png',
                  height: screenHeight * 0.18,
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'Welcome',
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Text(
                  'Like Point',
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
          
                CustomTextField(
                  hintText: 'Email Address',
                  controller: emailController,
                  autoFocus: true,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  hintText: 'Password',
                  controller: passwordController,
                  isPassword: true,
                ),
                SizedBox(height: screenHeight * 0.03),
          
                SizedBox(
                  width: double.infinity,
                  child: LoginButton(
                    onPressed: () {
                      final email = emailController.text.trim();
                      final password = passwordController.text.trim();
                      if (email.isEmpty || password.isEmpty) {
                        Get.snackbar(
                          "Warning",
                          "Please fill in both email and password.",
                        );
                        return;
                      }
                      loginController.login(email: email, password: password);
                    },
                  ),
                ),
          
                SizedBox(height: screenHeight * 0.02),
          
                Row(
                  children: [
                    const Expanded(
                      child: Divider(color: Colors.white, thickness: 1.2),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        'Or Login with',
                        style: GoogleFonts.manrope(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Divider(color: Colors.white, thickness: 1.2),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
          
                Row(
                  children: [
                    Expanded(child: LoginButtonGoogle(onPressed: () {})),
                    const SizedBox(width: 10),
                    Expanded(child: LoginButtonFacebook(onPressed: () {})),
                  ],
                ),
          
                SizedBox(height: screenHeight * 0.01),
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don’t have an account?',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    RegisterButtonText(),
                  ],
                ),
                SizedBox(height: screenHeight * 0.01),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
