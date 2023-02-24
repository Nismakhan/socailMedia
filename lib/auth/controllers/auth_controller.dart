import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_app/app/router/router.dart';
import 'package:social_media_app/auth/db/database.dart';
import 'package:social_media_app/auth/model/user_model.dart';
import 'package:social_media_app/common/helper.dart';
import 'package:social_media_app/models/follow_model.dart';

class AuthController extends ChangeNotifier {
  UserModel? appUser;
  final AuthDB _db = AuthDB();

  Future<User?> checkCurrentUser(BuildContext context) async {
    try {
      final currentUser = _db.isCurrentUser();
      if (currentUser != null) {
        appUser = await _db.getUserById(currentUser.uid);
        log(appUser!.toJson().toString());
        Navigator.pushReplacementNamed(context, AppRouter.homeScreen);
        return currentUser;
        // Get user data from database
        // route to home screen
      } else {
        Navigator.pushReplacementNamed(context, AppRouter.login);
        return null;
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
      Navigator.pushReplacementNamed(context, AppRouter.homeScreen);
    } on FirebaseAuthException catch (e) {
      log(e.code);
      log(e.message!);
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
      Navigator.pushReplacementNamed(context, AppRouter.homeScreen);
      log("Now current User: ${appUser?.toJson().toString()}");
      notifyListeners();
    } catch (e) {
      print("Error in controller: $e");
    }
  }

  Future<void> signOut(BuildContext context) async {
    await _db.signOut();
    appUser = null;
    Navigator.pushNamedAndRemoveUntil(
        context, AppRouter.login, (route) => false);
  }

// Upload Image
  XFile? pickedImage;

  void changeImage({required XFile? image}) {
    pickedImage = image;
    uploadProfileImage();
  }

  void removeImage() {
    pickedImage = null;
    notifyListeners();
  }

  bool isUploading = false;

  Future<void> uploadProfileImage() async {
    try {
      isUploading = true;
      notifyListeners();
      if (pickedImage != null) {
        if (appUser!.profileUrl != null) {
          await Helper.deleteImage(url: appUser!.profileUrl!);
          appUser!.profileUrl = null;
        }
        final url = await Helper.uploadImage(
            id: appUser!.uid,
            file: pickedImage!,
            ref: "users/${appUser!.uid}/${pickedImage!.name}");

        appUser!.profileUrl = url;
        await _db.updateUser(user: appUser!);
        isUploading = false;
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> getUserById({required String uid}) async {
    try {
      return await _db.getUserById(uid);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> followUser({required FollowModel followModel}) async {
    try {
      final myFollowModel = FollowModel(
          uid: appUser!.uid,
          userName: appUser!.name,
          dateAdded: Timestamp.now());
      await _db.followUser(
          myFollowModel: myFollowModel, followModel: followModel);
      log("Followed");
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<void> unFollow({required String uid}) async {
    try {
      await _db.unFollow(uid: uid);
      log("UnFollowed");
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<bool> isUserFollowed({required String uid}) async {
    try {
      return await _db.isUserFollowed(uid: uid);
    } catch (e) {
      rethrow;
    }
  }
}
