import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:like_point/app/ui/modules/home/home_controller.dart';

class SettingsUsernameController extends GetxController {
  final RxString username = ''.obs;
  final RxBool isEditing = false.obs;

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  final HomeController homeController = Get.find();

  @override
  void onInit() {
    super.onInit();
    loadUsername();
  }

  void toggleEdit() => isEditing.value = !isEditing.value;

  Future<void> loadUsername() async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;

    final doc = await _firestore.collection('users').doc(uid).get();
    if (doc.exists && doc.data() != null) {
      username.value = doc.data()!['username'] ?? '';
    }
  }

  Future<void> updateUsername(String newUsername) async {
    final uid = _auth.currentUser?.uid;
    final trimmed = newUsername.trim();

    if (uid == null || trimmed.isEmpty) {
      Get.snackbar("Error", "Username cannot be empty");
      return;
    }

    if (trimmed.length > 20) {
      Get.snackbar("Error", "Username must not exceed 20 characters");
      return;
    }

    await _firestore.collection('users').doc(uid).update({'username': trimmed});

    username.value = trimmed;
    isEditing.value = false;

    homeController.updateUsernameLocally(trimmed);
    Get.snackbar("Success", "Username updated!");
  }
}
