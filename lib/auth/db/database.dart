import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media_app/auth/model/user_model.dart';

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
}
