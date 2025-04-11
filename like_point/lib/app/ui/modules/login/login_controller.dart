import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:like_point/app/ui/widget/navbar_service/home_navigation.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  RxBool isLoading = false.obs;

  Future<void> login({required String email, required String password}) async {
    try {
      isLoading.value = true;

      await _auth.signInWithEmailAndPassword(email: email, password: password);

      Get.snackbar("Login Success", "Welcome back!");
      Get.offAll(() => const HomeNavigation());
    } on FirebaseAuthException catch (e) {
      String message = "Login failed.";
      if (e.code == 'user-not-found') {
        message = "No user found for that email.";
      } else if (e.code == 'wrong-password') {
        message = "Incorrect password.";
      }
      Get.snackbar("Error", message);
    } catch (e) {
      Get.snackbar("Error", "Unexpected error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
