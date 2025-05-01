import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kd_bazzar/views/auth_scrrens/login_screen.dart';

class AuthController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final String userCollection = "users";

  var isLoading = false.obs;

  // Text controllers
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  // Login method
  Future<UserCredential?> loginMethod({required BuildContext context}) async {
    UserCredential? userCredential;
    try {
      isLoading(true);
      userCredential = await auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        Get.snackbar("Login Error", e.message ?? "Login failed");
      }
    } finally {
      isLoading(false);
    }
    return userCredential;
  }

  // Signup method
  Future<UserCredential?> signupMethod({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    UserCredential? userCredential;
    try {
      isLoading(true);
      userCredential = await auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      // Store user data after signup
      if (userCredential.user != null) {
        await storeUserData(
          uid: userCredential.user!.uid,
          name: "", // Change this based on UI input
          email: email,
          password: '',
        );
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        Get.snackbar("Signup Error", e.message ?? "Signup failed");
      }
    } finally {
      isLoading(false);
    }
    return userCredential;
  }

  // Storing user data in Firestore
  Future<void> storeUserData({
    required String uid,
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await firestore.collection(userCollection).doc(uid).set({
        "id": uid,
        "name": name,
        "email": email,
        "cart_count": 0,
        "order_count": 0,
        "wishlist_count": 0,
        "avatarIndex": 1,
      });
    } catch (e) {
      if (kDebugMode) {
        print("Error storing user data: $e");
      }
    }
  }

  // Sign-out method
  Future<void> signoutMethod() async {
  try {
    await auth.signOut();
    emailController.clear();
    passwordController.clear();
    
    // Use Get.offAll to clear navigation history and go to login screen
    Get.offAll(() => const LoginScreen()); 
  } catch (e) {
    Get.snackbar("Error", e.toString());
  }
}

}

// Storing avatar index in Firestore
Future<void> storeUserAvatar({
  required String uid,
  required int avatarIndex,
}) async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  const String userCollection = "users";

  try {
    await firestore.collection(userCollection).doc(uid).update({
      "avatarIndex": avatarIndex,
    });
  } catch (e) {
    if (kDebugMode) {
      print("Error storing avatar: $e");
    }
  }
}
