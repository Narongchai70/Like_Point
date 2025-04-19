import 'package:flutter/material.dart';
import 'package:like_point/app/ui/widget/theme/app_colors.dart';

class AppBackground extends StatelessWidget {
  final Widget child;

  const AppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: AppColors.getBackgroundGradient(context),
          ),
        ),
        SafeArea(child: child),
      ],
    );
  }
}
