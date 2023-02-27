import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media_app/auth/model/user_model.dart';
import 'package:social_media_app/models/chat_model.dart';
import 'package:social_media_app/models/follow_model.dart';

class AuthDB {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final credentials = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      return await getUserById(credentials.user!.uid);
    } on FirebaseAuthException catch (error, stacktrace) {
      print("An error occured: $error");
      rethrow;
    }
  }

  Future<UserModel> getUserById(String userId) async {
    try {
      final snapshot = await _firestore.collection("users").doc(userId).get();
      if (snapshot.exists) {
        final data = snapshot.data();
        return UserModel.fromJson(data!);
      } else {
        throw "No User found";
      }
    } on FirebaseException {
      rethrow;
    }
  }

  Future<User> signUpWithEmailAndPassword(
      {required UserModel user, required String password}) async {
    try {
      final credentials = await _firebaseAuth.createUserWithEmailAndPassword(
          email: user.email, password: password);

      user.uid = credentials.user!.uid;
      await _firestore
          .collection("users")
          .doc(credentials.user!.uid)
          .set(user.toJson());

      return credentials.user!;
    } on FirebaseAuthException catch (error, stacktrace) {
      print("An error occured: $error");
      rethrow;
    }
  }

  Future<void> updateUser({required UserModel user}) async {
    try {
      await _firestore.collection("users").doc(user.uid).update(user.toJson());
    } catch (e) {
      rethrow;
    }
  }

  User? isCurrentUser() {
    if (_firebaseAuth.currentUser != null) {
      return _firebaseAuth.currentUser;
    }
    return null;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> followUser(
      {required FollowModel myFollowModel,
      required FollowModel followModel}) async {
    try {
      // put otherUserdata in my followed
      // put my data in his followers
      await _firestore
          .collection("users")
          .doc(_firebaseAuth.currentUser!.uid)
          .collection("followed")
          .doc(followModel.uid)
          .set(followModel.toJson());

      await _firestore
          .collection("users")
          .doc(followModel.uid)
          .collection("followers")
          .doc(_firebaseAuth.currentUser!.uid)
          .set(myFollowModel.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> unFollow({required String uid}) async {
    try {
      // remove his doc from my followed list
      await _firestore
          .collection("users")
          .doc(_firebaseAuth.currentUser!.uid)
          .collection("followed")
          .doc(uid)
          .delete();

      // remove my data from his follower list
      await _firestore
          .collection("users")
          .doc(uid)
          .collection("followers")
          .doc(_firebaseAuth.currentUser!.uid)
          .delete();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removeFollower({required String uid}) async {
    try {
      // remove his doc from my follower list
      await _firestore
          .collection("users")
          .doc(_firebaseAuth.currentUser!.uid)
          .collection("followers")
          .doc(uid)
          .delete();

      // remove my data from his followed list
      await _firestore
          .collection("users")
          .doc(uid)
          .collection("followed")
          .doc(_firebaseAuth.currentUser!.uid)
          .delete();
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> isUserFollowed({required String uid}) async {
    try {
      return (await _firestore
              .collection("users")
              .doc(_firebaseAuth.currentUser!.uid)
              .collection("followed")
              .doc(uid)
              .get())
          .exists;
    } catch (e) {
      rethrow;
    }
  }

  Future<ChatModel?> doesChatExists({required String uid}) async {
    try {
      final docs = (await _firestore
              .collection("chats")
              .where("userIds", arrayContains: uid)
              .get())
          .docs;
      if (docs.isNotEmpty) {
        return ChatModel.fromJson(docs.first.data());
      } else {
        log("null");
      }
      return null;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
