import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_point/app/ui/modules/register/register_controller.dart';
import 'package:like_point/app/ui/widget/custom_text_file.dart';
import 'package:like_point/app/ui/widget/register/login_botton_text.dart';
import 'package:like_point/app/ui/widget/register/register_button.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final RegisterController registerController = Get.put(RegisterController());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

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
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.02),
                Image.asset(
                  'assets/icon/icon_app_home.png',
                  height: screenHeight * 0.18,
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'Create Account',
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      height: 1.3,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Text(
                  'to get Started now!',
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      height: 1.3,
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
                const SizedBox(height: 15),
                CustomTextField(
                  hintText: 'Confirm Password',
                  controller: confirmPasswordController,
                  isPassword: true,
                ),
                SizedBox(height: screenHeight * 0.06),
          
                SizedBox(
                  width: double.infinity,
                  child: RegisterButton(
                    onPressed: () {
                      final email = emailController.text.trim();
                      final password = passwordController.text.trim();
                      final confirmPassword =
                          confirmPasswordController.text.trim();
          
                      if (email.isEmpty ||
                          password.isEmpty ||
                          confirmPassword.isEmpty) {
                        Get.snackbar("Error", "Please fill in all fields");
                        return;
                      }
          
                      if (password != confirmPassword) {
                        Get.snackbar("Error", "Passwords do not match");
                        return;
                      }
          
                      registerController.registerUser(
                        email: email,
                        password: password,
                      );
                    },
                  ),
                ),
          
                SizedBox(height: screenHeight * 0.03),
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    LoginBottonText(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
