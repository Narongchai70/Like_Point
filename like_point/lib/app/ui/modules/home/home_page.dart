import 'package:flutter/material.dart';
import 'package:like_point/app/ui/widget/home/home_search_button.dart';
import 'package:like_point/app/ui/widget/home/home_search_text_file.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 128, 33, 155)),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 128, 33, 155),
              Color.fromARGB(255, 212, 0, 249),
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                children: [
                  HomeSearchTextFile(),
                  SizedBox(width: 10),
                  HomeSearchButton(onPressed: () {}),
                ],
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
