import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
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
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/icon/icon_app_home.png', height: 168),

                  Text(
                    'Welcome',
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        height: 1.3,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Text(
                    'Like Point',
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        height: 1.3,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  CustomTextField(
                    hintText: 'Email Address',
                    controller: emailController,
                  ),

                  SizedBox(height: 15),
                  CustomTextField(
                    hintText: 'Password',
                    controller: passwordController,
                    isPassword: true,
                  ),
                  SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [LoginButton(onPressed: () {})],
                  ),
                  SizedBox(height: 58),
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
                              fontSize: 17,
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
                  SizedBox(height: 23),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LoginButtonGoogle(onPressed: () {}),
                      SizedBox(width: 10),
                      LoginButtonFacebook(onPressed: () {}),
                    ],
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Don’t have an account?',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 19,
                            color: Colors.black,
                          ),
                        ),
                        RegisterButtonText(),
                        
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
