import 'package:flutter/material.dart';

class HomeSearchButton extends StatelessWidget {
  final VoidCallback? onPressed; 

  const HomeSearchButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 57),
        child: ElevatedButton(
          onPressed: onPressed, 
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(52, 152, 219, 1),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            side: const BorderSide(color: Colors.white, width: 1.5),
            elevation: 1,
          ),
          child: const Text(
            'Search',
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800),
          ),
        ),
      ),
    );
  }
}
