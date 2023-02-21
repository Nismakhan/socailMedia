import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_app/models/comment_model.dart';
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

  Future<List<UserPosts>> getCurrentUserPosts({required String uid}) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapShot = await _firestore
          .collection("posts")
          .where("uid", isEqualTo: uid)
          .get();

      List<UserPosts> posts =
          querySnapShot.docs.map((e) => UserPosts.fromJson(e.data())).toList();

      return posts;
    } on FirebaseException {
      rethrow;
    }
  }

  Future<void> addComment({required CommentModel commentModel}) async {
    try {
      await _firestore
          .collection("posts")
          .doc(commentModel.postId)
          .collection("comments")
          .doc(commentModel.commentId)
          .set(commentModel.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> delete({required CommentModel commentModel}) async {
    try {
      await _firestore
          .collection("posts")
          .doc(commentModel.postId)
          .collection("comments")
          .doc(commentModel.commentId)
          .delete();
    } catch (e) {
      rethrow;
    }
  }
}
