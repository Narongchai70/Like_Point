import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeController extends GetxController {
  RxString username = ''.obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadUsername();
  }

  Future<void> loadUsername() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    final doc = await FirebaseFirestore.instance.collection('users').doc(uid).get();

    if (doc.exists && doc.data() != null) {
      username.value = doc.data()!['username'] ?? 'User';
      isLoading.value = false;
    }
  }
}
