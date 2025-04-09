import 'package:flutter/material.dart';

class HomeDropdown extends StatefulWidget {
  const HomeDropdown({super.key});

  @override
  State<HomeDropdown> createState() => _HomeDropdownState();
}

class _HomeDropdownState extends State<HomeDropdown> {
  final List<String> myItems = ['SEA', 'NA', 'EU'];
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 135,
      child: DropdownMenu<String>(
        hintText: 'Server',
        initialSelection: selectedItem,
        onSelected: (value) {
          setState(() {
            selectedItem = value;
          });
        },
        textStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        menuStyle: MenuStyle(
          backgroundColor: WidgetStateProperty.all(Colors.lightBlue[100]),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.white),
          filled: true,
          fillColor: const Color.fromRGBO(52, 152, 219, 1),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: Colors.white, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: Colors.white, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: Colors.white, width: 2),
          ),
        ),
        dropdownMenuEntries:
            myItems
                .map((e) => DropdownMenuEntry<String>(value: e, label: e))
                .toList(),
      ),
    );
  }
}
