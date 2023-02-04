import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media_app/auth/model/user_model.dart';

class AuthDB {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User> signInWithEmailAndPassword(String email, String password) async {
    try {
      final credentials =
          await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

      return credentials.user!;
    } on FirebaseAuthException catch (error, stacktrace) {
      print("An error occured: $error");
      rethrow;
    }
  }

  Future<UserModel?> getUserById(String userId) async {
    try {
      final snapshot = await _firestore.collection("users").doc(userId).get();
      if (snapshot.exists) {
        final data = snapshot.data();
        return UserModel.fromJson(data!);
      }
    } on FirebaseException catch (e) {
      rethrow;
    }
  }
}
