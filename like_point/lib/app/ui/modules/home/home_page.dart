import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:like_point/app/ui/widget/home/home_bottun_text_see_all.dart';
import 'package:like_point/app/ui/widget/home/home_carouselview.dart';
import 'package:like_point/app/ui/widget/home/home_dropdown.dart';
import 'package:like_point/app/ui/widget/home/home_search_button.dart';
import 'package:like_point/app/ui/widget/home/home_search_text_file.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadUsername();
  }

  Future<void> loadUsername() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    final doc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    if (doc.exists && doc.data() != null) {
      setState(() {
        username = doc.data()!['username'] ?? '';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBar(backgroundColor: Colors.transparent, elevation: 0),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    isLoading ? "Loading..." : "Hello, $username",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            HomeSearchTextFile(),
                            const SizedBox(width: 10),
                            HomeSearchButton(onPressed: () {}),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(children: [HomeDropdown()]),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const Text(
                              'Followed players',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            HomeBottunTextSeeAll(),
                          ],
                        ),
                        HomeCarouselview(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
