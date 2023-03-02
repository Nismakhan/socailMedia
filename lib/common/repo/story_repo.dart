import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_media_app/models/story_model.dart';

class StoryRepo {
  final _firestore = FirebaseFirestore.instance;
  Future<List<StoryModel>> getStories() async {
    try {
      return (await _firestore.collection("stories").get())
          .docs
          .map((e) => StoryModel.fromJson(e.data()))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
