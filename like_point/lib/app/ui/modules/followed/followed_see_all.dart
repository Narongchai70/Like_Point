import 'package:flutter/material.dart';

class FollowedSeeAll extends StatefulWidget {
  const FollowedSeeAll({super.key});

  @override
  State<FollowedSeeAll> createState() => _FollowedSeeAllState();
}

class _FollowedSeeAllState extends State<FollowedSeeAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('followed'),),);
  }
}