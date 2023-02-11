import 'package:flutter/material.dart';
import 'package:social_media_app/common/repo/post_repo.dart';
import 'package:social_media_app/models/user_post.dart';

class PostController with ChangeNotifier {
  final _repo = PostRepo();
  bool isLoading = false;
  Future<void> uploadPost(BuildContext context,
      {required UserPosts post}) async {
    try {
      isLoading = true;
      notifyListeners();
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
