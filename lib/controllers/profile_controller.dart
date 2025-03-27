import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:kd_bazzar/consts/consts.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;
  var profileImageLink = ''.obs;
  var selectedAvatar = ''.obs; // Store selected avatar path

  // Text fields
  var nameController = TextEditingController();
  var passController = TextEditingController();

  // Firebase instance
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  // Update user profile details
  Future<void> updateProfile(String name, String password) async {
    try {
      isLoading(true);
      final userId = auth.currentUser?.uid;
      if (userId == null) {
        isLoading(false);
        return;
      }

      // Prepare updated data
      Map<String, dynamic> updatedData = {
        'name': name,
        'password': password,
        'avatarIndex': selectedAvatar.value, 
      };

      await firestore.collection('users').doc(userId).set(updatedData, SetOptions(merge: true));

      isLoading(false);
    } catch (e) {
      if (kDebugMode) {
        print("Update Error: $e");
      }
      isLoading(false);
    }
  }
}
