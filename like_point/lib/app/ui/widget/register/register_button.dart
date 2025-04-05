import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  final void Function() onPressed;
  const RegisterButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        child: const Text('Password'),
      ),
    );
  }
}
