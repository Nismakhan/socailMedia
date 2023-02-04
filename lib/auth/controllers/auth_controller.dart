import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/auth/db/database.dart';
import 'package:social_media_app/auth/model/user_model.dart';

class AuthController extends ChangeNotifier {
  UserModel? appUser;
  final AuthDB _db = AuthDB();
  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final User user = await _db.signInWithEmailAndPassword(email, password);
      appUser = await _db.getUserById(user.uid);
    } catch (e) {
      print("Error in controller: $e");
    }
  }
}
