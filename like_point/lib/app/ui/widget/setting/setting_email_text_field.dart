import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingEmailTextField extends StatefulWidget {
  const SettingEmailTextField({super.key});

  @override
  State<SettingEmailTextField> createState() => _SettingEmailTextFieldState();
}

class _SettingEmailTextFieldState extends State<SettingEmailTextField> {
  String? userEmail;

  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    setState(() {
      userEmail = user?.email;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        enabled: false,
        decoration: InputDecoration(
          labelText: userEmail ?? 'Loading...',
          labelStyle: const TextStyle(color: Colors.black),
          filled: true,
          fillColor: Colors.white,
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.black, width: 1.5),
          ),
        ),
      ),
    );
  }
}
