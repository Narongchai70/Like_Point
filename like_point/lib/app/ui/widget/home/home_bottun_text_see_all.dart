import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_point/app/ui/modules/followed/followed_see_all.dart';

class HomeBottunTextSeeAll extends StatelessWidget {
 final void Function()? onPressed;

const HomeBottunTextSeeAll({super.key, this.onPressed});

@override
Widget build(BuildContext context) {
  return TextButton(
    onPressed: onPressed ?? () {
      Get.to(() => FollowedSeeAll());
    },
    child: const Text(
      'See All',
      style: TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        decoration: TextDecoration.underline,
        decorationColor: Colors.white,
        decorationThickness: 1.5,
        decorationStyle: TextDecorationStyle.solid,
        height: 1,
      ),
    ),
  );
}

}
