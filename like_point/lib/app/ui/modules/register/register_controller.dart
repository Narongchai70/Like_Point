import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:like_point/app/ui/modules/login/login_page.dart';

class RegisterController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxBool isLoading = false.obs;

  Future<void> registerUser({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;

      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      await _firestore.collection("users").doc(userCredential.user!.uid).set({
        "uid": userCredential.user!.uid,
        "username": username,
        "email": email,
        "createdAt": FieldValue.serverTimestamp(),
      });

      Get.snackbar("Success", "Account created successfully 🎉");
      Get.off(() => const Login());
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message ?? "Firebase error");
    } catch (e) {
      Get.snackbar("Error", "Unexpected error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
