import 'package:flutter/material.dart';

class HomeCarouselview extends StatelessWidget {
  const HomeCarouselview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: CarouselView(
        itemExtent: 250,
        children: List.generate(10, (int index) {
          return Container(color: Colors.grey);
        }),
      ),
    );
  }
}
