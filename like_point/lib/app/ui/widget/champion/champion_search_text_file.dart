import 'package:flutter/material.dart';

class ChampionSearchTextFile extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  const ChampionSearchTextFile({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      decoration: const BoxDecoration(
        boxShadow: [BoxShadow(color: Color.fromARGB(0, 0, 0, 25))],
      ),
      child: TextField(
        onChanged: onChanged,
        style: const TextStyle(color: Colors.white), 
        decoration: InputDecoration(
          hintText: 'Search Champion...',
          hintStyle: const TextStyle(color: Colors.white70),
          filled: true,
          fillColor: const Color.fromRGBO(217, 217, 217, 0.4),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Color.fromRGBO(255, 255, 255, 0.4),
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(
              color: Color.fromRGBO(253, 253, 253, 0.4),
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
