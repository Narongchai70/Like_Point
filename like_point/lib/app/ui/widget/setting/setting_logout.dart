import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SettingLogout extends StatelessWidget {
  const SettingLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 53,
      child: OutlinedButton(
        onPressed: () async {
          await FirebaseAuth.instance.signOut();
          Get.offAllNamed('/login'); 
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          side: const BorderSide(color: Colors.white, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          padding: EdgeInsets.zero,
        ),
        child: const FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'Logout',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
