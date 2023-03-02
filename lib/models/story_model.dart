import 'package:cloud_firestore/cloud_firestore.dart';

class StoryModel {
  StoryModel({
    required this.uid,
    required this.name,
    this.profileUrl,
    required this.storyId,
    required this.storyUploadTime,
    this.asset,
    this.storyText,
    required this.storyType,
  });

  String uid;
  String name;
  String? profileUrl;
  String storyId;
  DateTime storyUploadTime;
  String? asset;
  String? storyText;
  StoryType storyType;

  factory StoryModel.fromJson(Map<String, dynamic> json) => StoryModel(
        uid: json["uid"],
        name: json["name"],
        profileUrl: json["profileUrl"],
        storyId: json["storyId"],
        storyUploadTime: (json["storyUploadTime"] as Timestamp).toDate(),
        asset: json["asset"],
        storyText: json["storyText"],
        storyType: StoryType.values.firstWhere(
          (element) => element.name == json["storyType"],
        ),
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "profileUrl": profileUrl,
        "storyId": storyId,
        "storyUploadTime": storyUploadTime,
        "asset": asset,
        "storyText": storyText,
        "storyType": storyType.name,
      };
}

enum StoryType {
  text,
  picture,
  video,
}

void fun() {
  List<StoryModel> stories = [];
  final uids = stories.map((e) => e.uid).toSet();
  final map = {};
  uids.forEach((id) {
    map[id] = stories.where((element) => element.uid == id);
  });
  // map.entries.map((e) => null)
}
