import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_point/app/ui/register.dart';

class RegisterButtonText extends StatelessWidget {
  final void Function()? onPressed;
  const RegisterButtonText({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed:
          onPressed ??
          () {
            Get.to(() => const Register());
          },
      child: const Text(
        'Sign Up Now',
        style: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          decoration: TextDecoration.underline,
          decorationColor: Colors.white,
          decorationThickness: 1.5,
          decorationStyle: TextDecorationStyle.solid,
          height: 5,
        ),
      ),
    );
  }
}
