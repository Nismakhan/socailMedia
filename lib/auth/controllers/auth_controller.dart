import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/app/router/router.dart';
import 'package:social_media_app/auth/db/database.dart';
import 'package:social_media_app/auth/model/user_model.dart';

class AuthController extends ChangeNotifier {
  UserModel? appUser;
  final AuthDB _db = AuthDB();

  Future<void> checkCurrentUser(BuildContext context) async {
    try {
      final currentUser = _db.isCurrentUser();
      if (currentUser != null) {
        appUser = await _db.getUserById(currentUser.uid);
        log(appUser!.toJson().toString());
        Navigator.pushReplacementNamed(context, AppRouter.dashboard);
        // Get user data from database
        // route to home screen
      } else {
        Navigator.pushReplacementNamed(context, AppRouter.login);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> loginWithEmailAndPassword(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    try {
      appUser = await _db.signInWithEmailAndPassword(email, password);
      Navigator.pushReplacementNamed(context, AppRouter.dashboard);
    } catch (e) {
      print("Error in controller: $e");
    }
  }

  Future<void> createWithEmailAndPassword(
    BuildContext context, {
    required UserModel user,
    required String password,
  }) async {
    try {
      final User userFromCreds =
          await _db.signUpWithEmailAndPassword(user: user, password: password);
      appUser = user;
      Navigator.pushReplacementNamed(context, AppRouter.dashboard);
      log("Now current User: ${appUser?.toJson().toString()}");
      notifyListeners();
    } catch (e) {
      print("Error in controller: $e");
    }
  }

  void signOut(BuildContext context) async {
    await _db.signOut();
    appUser = null;
    Navigator.pushNamedAndRemoveUntil(
        context, AppRouter.login, (route) => false);
  }
}
