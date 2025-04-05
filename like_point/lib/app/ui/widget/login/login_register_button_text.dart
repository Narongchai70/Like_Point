import 'package:flutter/material.dart';

class RegisterButtonText extends StatelessWidget {
  final void Function() onPressed;
  const RegisterButtonText({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: const Text(
        'Sign Up Now',
        style: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
