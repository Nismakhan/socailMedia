import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:social_media_app/common/repo/story_repo.dart';
import 'package:social_media_app/models/story_model.dart';
import 'package:social_media_app/utils/const.dart';

class StoryController extends ChangeNotifier {
  // StoryController() {
  //   log("Wda");
  // }
  final _repo = StoryRepo();
  List<StoryModel> stories = List.empty(growable: true);
  LoadingState state = LoadingState.idle;
  Future<void> getStories() async {
    try {
      state = LoadingState.processing;
      notifyListeners();
      stories = await _repo.getStories();
      log(stories.length.toString());
      state = LoadingState.loaded;
      notifyListeners();
    } catch (e) {
      state = LoadingState.error;
      rethrow;
    }
  }
}
