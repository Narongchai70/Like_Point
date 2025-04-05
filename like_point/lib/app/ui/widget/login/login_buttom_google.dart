import 'package:flutter/material.dart';

class LoginButtonGoogle extends StatelessWidget {
  final VoidCallback onPressed;

  const LoginButtonGoogle({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: 61),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              side: BorderSide(color: Colors.black, width: 1.5),
              elevation: 1,
              padding: EdgeInsets.symmetric(horizontal: 0),
            ),
            child: Image.asset(
              'assets/icon/google.png',
              height: 28,
              width: 28,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
