import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:like_point/app/ui/modules/current_password/current_password.dart';

class SettingPasswordTextField extends StatelessWidget {
  const SettingPasswordTextField({super.key, this.onPressed});
  final void Function()? onPressed;
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
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          IgnorePointer(
            ignoring: true,
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: '************',
                labelStyle: TextStyle(color: Colors.black),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.black, width: 1.5),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.black, width: 1.5),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              icon: Icon(Icons.edit),
              onPressed:
                  onPressed ??
                  () {
                    Get.to(() => CurrentPassword());
                  },
            ),
          ),
        ],
      ),
    );
  }
}
