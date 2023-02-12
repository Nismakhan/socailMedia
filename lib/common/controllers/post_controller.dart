import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_app/common/repo/post_repo.dart';
import 'package:social_media_app/models/user_post.dart';

class PostController with ChangeNotifier {
  final _repo = PostRepo();
  bool isLoading = false;

  Future<void> uploadPost(BuildContext context,
      {required UserPosts post, XFile? pickedImage}) async {
    try {
      isLoading = true;
      notifyListeners();
      if (pickedImage != null) {
        final url = await _repo.uploadImage(id: post.postId, file: pickedImage);
        post.userPostsAsset = url;
        log("URL ${url}");
      }
      await _repo.uploadPost(post: post);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
      rethrow;
    }
  }
}
