import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_point/app/ui/modules/login/login_page.dart';
import 'package:like_point/app/ui/widget/%E0%B8%B7snackbar_service.dart';

class RegisterController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxBool isLoading = false.obs;

  Future<void> registerUser({

    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;

      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      await _firestore.collection("users").doc(userCredential.user!.uid).set({
        "uid": userCredential.user!.uid,

        "email": email,
        "createdAt": FieldValue.serverTimestamp(),
      });

      showSnackBar(
        title: "Success",
        message: "Account created successfully",
        backgroundColor: Colors.green,
        icon: Icons.check_circle,
      );

      Get.off(() => const Login());
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          showSnackBar(
            title: "Email Exists",
            message: "This email is already in use.",
            backgroundColor: Colors.orange,
            icon: Icons.warning,
          );
          break;
        case 'invalid-email':
          showSnackBar(
            title: "Invalid Email",
            message: "The email address is not valid.",
            backgroundColor: Colors.redAccent,
            icon: Icons.error,
          );
          break;
        case 'weak-password':
          showSnackBar(
            title: "Weak Password",
            message: "Password must be at least 6 characters.",
            backgroundColor: Colors.red,
            icon: Icons.lock,
          );
          break;
        case 'operation-not-allowed':
          showSnackBar(
            title: "Sign-Up Disabled",
            message: "Email/Password sign-up is disabled.",
            backgroundColor: Colors.red,
            icon: Icons.block,
          );
          break;
        default:
          showSnackBar(
            title: "Auth Error",
            message: e.message ?? "An unknown error occurred.",
            backgroundColor: Colors.red,
            icon: Icons.error,
          );
      }
    } catch (e) {
      showSnackBar(
        title: "Unexpected Error",
        message: e.toString(),
        backgroundColor: Colors.red,
        icon: Icons.error_outline,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
