import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_point/app/ui/modules/login/login_page.dart';

class LoginBottonText extends StatelessWidget {
    final void Function()? onPressed;
  const LoginBottonText({super.key , this.onPressed});
   

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed:
          onPressed ??
          () {
            Get.to(() =>Login());
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