import 'package:flutter/material.dart';

class ChampionSearchButton extends StatelessWidget {
  const ChampionSearchButton({super.key , required this.onPressed});
  final void Function() onPressed;

 @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: 57),
          child: ElevatedButton(
            onPressed: onPressed,

            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(52, 152, 219, 1),
              foregroundColor: Color.fromRGBO(255, 255, 255, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              side: BorderSide(color: const Color.fromRGBO(255, 255, 255, 1), width: 1.5),
              elevation: 1,
            ),
            child: Text(
              'ค้นหา',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800),
            ),
          ),
        ),
      );
  }
}