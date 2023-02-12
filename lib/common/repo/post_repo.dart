import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_app/models/user_post.dart';

class PostRepo {
  final _firestore = FirebaseFirestore.instance;
  final _firebaseAuth = FirebaseAuth.instance;
  final _storage = FirebaseStorage.instance;

  Future<void> uploadPost({required UserPosts post}) async {
    try {
      await _firestore.collection("posts").doc(post.postId).set(post.toJson());
    } on FirebaseException catch (e) {
      rethrow;
    }
  }

  Future<String> uploadImage({required String id, required XFile file}) async {
    try {
      TaskSnapshot taskSnapshot =
          await _storage.ref("posts/$id/${file.name}").putFile(File(file.path));
      final url = await taskSnapshot.ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      rethrow;
    }
  }
}
