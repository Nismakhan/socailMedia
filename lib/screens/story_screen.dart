import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:social_media_app/utils/media_query.dart';
import 'package:story_view/story_view.dart';

class StoryScreen extends StatelessWidget {
  StoryScreen({super.key});
  final controller = StoryController();
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
            storyItems: [
              StoryItem.text(title: "Dwad", backgroundColor: Colors.black),
              StoryItem.text(title: "agaeff", backgroundColor: Colors.black)
            ],
          ),
          Align(
            alignment: Alignment(-1, -0.87),
            child: SizedBox(
              width: screenWidth(context) / 2,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                ),
                title: Text(
                  "Name",
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  "awd",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
