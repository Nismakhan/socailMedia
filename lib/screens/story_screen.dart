import 'package:flutter/material.dart';
import 'package:social_media_app/models/story_model.dart';
import 'package:social_media_app/utils/media_query.dart';
import 'package:story_view/story_view.dart';

class StoryScreen extends StatelessWidget {
  StoryScreen({required this.stories, super.key});
  final controller = StoryController();
  final List<StoryModel> stories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          StoryView(
              controller: controller,
              onStoryShow: (s) {},
              onComplete: () {
                Navigator.pop(context);
              },
              onVerticalSwipeComplete: (direction) {
                if (direction == Direction.down) {
                  Navigator.pop(context);
                }
              },
              storyItems: stories.map((e) {
                if (e.storyType == StoryType.text && e.storyText != null) {
                  return StoryItem.text(
                      title: e.storyText!, backgroundColor: Colors.black);
                }
                if (e.storyType == StoryType.picture && e.asset != null) {
                  return StoryItem.pageImage(
                      url: e.asset!, controller: controller);
                }
                if (e.storyType == StoryType.video && e.asset != null) {
                  return StoryItem.pageVideo(e.asset!, controller: controller);
                }
              }).toList()
              // [
              //   StoryItem.text(title: "Dwad", backgroundColor: Colors.black),
              //   StoryItem.text(title: "agaeff", backgroundColor: Colors.black)
              // ],
              ),
          Builder(builder: (context) {
            //  final times= stories.map((e) => e.storyUploadTime).toList();
            return Align(
              alignment: Alignment(-1, -0.87),
              child: SizedBox(
                width: screenWidth(context) / 2,
                child: ListTile(
                  leading: stories.first.profileUrl != null
                      ? CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              NetworkImage(stories.first.profileUrl!),
                        )
                      : CircleAvatar(
                          radius: 30,
                        ),
                  title: Text(
                    stories.first.name,
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    "awd",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class StoryScreenArgs {
  final List<StoryModel> stories;
  StoryScreenArgs({required this.stories});
}
