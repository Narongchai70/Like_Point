import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxString username = ''.obs;
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadUsername();
  }

  Future<void> loadUsername() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final uid = user.uid;
    final doc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    if (doc.exists && doc.data() != null) {
      final name = doc.data()!['username']?.toString().trim() ?? '';
      if (name.isNotEmpty) {
        username.value = name;
      } else if (user.email != null && user.email!.contains('@')) {
        username.value = user.email!.split('@')[0];
      }
    }

    isLoading.value = false;
  }

  void updateUsernameLocally(String newName) {
    username.value = newName.trim();
  }
}
