import 'package:flutter/material.dart';

class SettingEmailTextField extends StatefulWidget {
  const SettingEmailTextField({super.key});

  @override
  State<SettingEmailTextField> createState() => _SettingTextFieldState();
}

class _SettingTextFieldState extends State<SettingEmailTextField> {
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
  labelText: 'toey1234@gmail.com',
  labelStyle: TextStyle(color: Colors.black),
  filled: true,
  fillColor: Colors.white,
  disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: Colors.black, width: 1.5),
  ),
),

        ),
      );
    
  }
}
