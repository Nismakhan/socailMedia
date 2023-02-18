import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_media_app/models/chat_class.dart';

import 'package:social_media_app/models/user_post.dart';
import 'package:social_media_app/models/user_story.dart';

class ServiceController extends ChangeNotifier {
  List<UserStory> userStory = [];
  List<ChatClass> chats = [];
  List<UserPosts> posts = [];
  Future<void> getData() async {
    final stringifiedData =
        await rootBundle.loadString("assets/data/data.json");
    final Map<String, dynamic> data =
        Map<String, dynamic>.from(jsonDecode(stringifiedData));
    userStory = (data["usersStory"] as Map<String, dynamic>)
        .entries
        .map((e) => UserStory.fromJson(e.value))
        .toList();
    chats = (data["messages"] as Map<String, dynamic>)
        .entries
        .map((e) => ChatClass.fromJson(e.value))
        .toList();
    posts = (data["userPosts"] as Map<String, dynamic>)
        .entries
        .map((e) => UserPosts.fromJson(e.value))
        .toList();
  }
}
