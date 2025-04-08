import 'package:flutter/material.dart';

class HomeSearchTextFile extends StatelessWidget {
  const HomeSearchTextFile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: const Color.fromARGB(0, 0, 0, 25))],
      ),
      child: TextField(),
    );
  }
}
