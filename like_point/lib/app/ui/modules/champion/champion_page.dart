import 'package:flutter/material.dart';

class ChampionPage extends StatefulWidget {
  const ChampionPage({super.key});

  @override
  State<ChampionPage> createState() => _ChampionPageState();
}

class _ChampionPageState extends State<ChampionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Cham')));
  }
}
