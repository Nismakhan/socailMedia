import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_app/common/helper.dart';
import 'package:social_media_app/common/repo/post_repo.dart';
import 'package:social_media_app/models/user_post.dart';
import 'package:social_media_app/utils/const.dart';

class PostController with ChangeNotifier {
  final _repo = PostRepo();
  bool isLoading = false;

  LoadingState state = LoadingState.idle;

  List<UserPosts> currentUserPosts = List.empty(growable: true);

  Future<void> getCurrentUserPosts({
    required String uid,
  }) async {
    try {
      state = LoadingState.processing;
      currentUserPosts = await _repo.getCurrentUserPosts(uid: uid);
      state = LoadingState.loaded;
      notifyListeners();
      log(currentUserPosts.toString());
    } catch (e) {
      state = LoadingState.error;
      notifyListeners();
      rethrow;
    }
  }

  Future<void> uploadPost(BuildContext context,
      {required UserPosts post, XFile? pickedImage}) async {
    try {
      isLoading = true;
      notifyListeners();
      if (pickedImage != null) {
        final url = await Helper.uploadImage(
            id: post.postId,
            file: pickedImage,
            ref: "posts/${post.postId}/${pickedImage.name}");
        post.userPostsAsset = url;
        log("URL ${url}");
      }
      await _repo.uploadPost(post: post);
      isLoading = false;
      currentUserPosts.add(post);
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
      rethrow;
    }
  }
}
