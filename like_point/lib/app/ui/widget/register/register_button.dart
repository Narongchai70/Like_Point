import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:like_point/app/ui/modules/register/register_controller.dart';

class RegisterButton extends StatelessWidget {
  final void Function() onPressed;
  
  RegisterButton({super.key, required this.onPressed});
  final RegisterController registerController = Get.put(RegisterController());

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
          constraints: BoxConstraints(minHeight: 57),
          child: ElevatedButton(
            onPressed: (){registerController.registerUser;},

            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              side: BorderSide(color: Colors.black, width: 1.5),
              elevation: 1,
            ),
            child: Text(
              'Sign Up',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800),
            ),
          ),
        ),
      ),
    );
  }
}
