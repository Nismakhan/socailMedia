import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_media_app/models/story_model.dart';

class StoryRepo {
  final _firestore = FirebaseFirestore.instance;
  Future<List<StoryModel>> getStories() async {
    try {
      final selectedDate = DateTime.now();
      final todayDateStart = DateTime(
          selectedDate.year, selectedDate.month, selectedDate.day, 0, 0);
      final todayDateEnd = DateTime(
          selectedDate.year, selectedDate.month, selectedDate.day, 23, 59);
      // TODO: only show last 24 hours stories.
      return (await _firestore
              .collection("stories")
              .where("storyUploadTime", isGreaterThanOrEqualTo: todayDateStart)
              .where("storyUploadTime", isLessThanOrEqualTo: todayDateEnd)
              .get())
          .docs
          .map((e) => StoryModel.fromJson(e.data()))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addStory({required StoryModel story}) async {
    try {
      await _firestore
          .collection("stories")
          .doc(story.storyId)
          .set(story.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
