import 'package:flutter/material.dart';

class HomeSearchTextFile extends StatelessWidget {
  const HomeSearchTextFile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: const Color.fromARGB(0, 0, 0, 25))],
      ),
      child: TextField( decoration: InputDecoration(

          hintText:'Search name#name',
          hintStyle: TextStyle(color: Colors.white),
          filled: true,
          fillColor: Color.fromRGBO(217, 217, 217, 0.4),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: const Color.fromRGBO(255, 255, 255, 0.4), width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: const Color.fromRGBO(253, 253, 253, 0.4), width: 1.5),
          ),),)
    );
  }
}
