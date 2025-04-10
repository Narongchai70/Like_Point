import 'package:flutter/material.dart';

class CurrentPassword extends StatelessWidget {
  const CurrentPassword({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 128, 33, 155)),
      extendBody: true,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 128, 33, 155),
                  Color.fromARGB(255, 212, 0, 249),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}