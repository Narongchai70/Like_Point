import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_point/app/ui/widget/custom_text_file.dart';
import 'package:like_point/app/ui/widget/login/login_buttom_facebook.dart';
import 'package:like_point/app/ui/widget/login/login_buttom_google.dart';
import 'package:like_point/app/ui/widget/login/login_button.dart';
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
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFCAA1FF), Color(0xFF8FAEFF)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Image.asset('assets/icon/icon_app_home.png', height: 165),

              Text(
                'Welcome to\n Like Point',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: (32),
                    height: 1.3,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 50),
              CustomTextField(hintText: 'Email', controller: emailController),

              SizedBox(height: 15),
              CustomTextField(
                hintText: 'Password',
                controller: passwordController,
                isPassword: true,
              ),
              SizedBox(height: 80),
              Row(children: [LoginButton(onPressed: () {})]),
              SizedBox(height: 66),
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.white, thickness: 1.2)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      'Or Login with',
                      style: GoogleFonts.manrope(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.white, thickness: 1.2)),
                ],
              ),
              SizedBox(height: 26),
              Row(
                children: [
                  LoginButtonGoogle(onPressed: () {}),
                  SizedBox(width: 5),
                  LoginButtomFacebook(onPressed: () {}),
                ],
              ),
              Spacer(),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Text(
                        'Don’t have an account?',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 19,
                        ),
                      ),
                    ),
                    RegisterButtonText(onPressed: () {}),
                    SizedBox(height: 90),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
