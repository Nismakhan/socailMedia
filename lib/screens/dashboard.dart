import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/app/router/router.dart';

import 'package:social_media_app/auth/controllers/auth_controller.dart';
import 'package:social_media_app/common/controllers/post_controller.dart';
import 'package:social_media_app/common/controllers/story_controller.dart';
import 'package:social_media_app/models/story_model.dart';

import 'package:social_media_app/models/user_post.dart';
import 'package:social_media_app/screens/story_screen.dart';
import 'package:social_media_app/utils/const.dart';
import 'package:social_media_app/utils/media_query.dart';
import 'package:social_media_app/widgets/DashboardWidgets/post_stream.dart';
import 'package:social_media_app/widgets/DashboardWidgets/post_widget.dart';
import 'package:social_media_app/widgets/DashboardWidgets/single_post_widget.dart';

import 'package:social_media_app/widgets/icona_for_dashboard_on_top.dart';

import 'package:social_media_app/widgets/listview_for_stories.dart';
import 'package:uuid/uuid.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

final colors = [
  const Color.fromARGB(255, 241, 187, 184),
  const Color.fromARGB(255, 230, 215, 172),
  const Color.fromARGB(255, 178, 186, 231),
  const Color.fromARGB(255, 174, 205, 231),
  const Color.fromARGB(255, 238, 168, 191),
  const Color.fromARGB(255, 187, 158, 236),
  const Color.fromARGB(255, 156, 255, 245),
];

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    context.read<StoryController>().getStories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 243, 243),
        body: Column(
          children: [
            Container(
              height: 200,
              color: Colors.white,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/images/logo.png",
                          width: 40,
                        ),
                        const IconsOnTheTopOfDashboard()
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  StoriesList(),
                  // IconButton(
                  //     onPressed: () {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => StoryScreen()));
                  //     },
                  //     icon: Icon(Icons.ad_units)),
                  // ListviewForStories(
                  //   colors: colors,
                  // ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: const [
                  PostWidget(),
                  Expanded(
                    // fit: FlexFit.loose,
                    child: PostStream(),
                  ),
                  // SinglePostWidget(post: post),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StoriesList extends StatelessWidget {
  const StoriesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StoryController>(builder: (context, provider, _) {
      return provider.state == LoadingState.processing
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRouter.addStoryScreen);
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.red, width: 3),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text("Add"),
                  ],
                ),

                Builder(builder: (context) {
                  final listOfUids =
                      provider.stories.map((e) => e.uid).toSet().toList();
                  Map<String, List<StoryModel>> map = {};
                  listOfUids.forEach((id) {
                    map[id] = provider.stories
                        .where((element) => element.uid == id)
                        .toList();
                  });

                  return Row(
                    children: map.entries
                        .map(
                          (e) => StoryCircle(
                            stories: e.value,
                          ),
                        )
                        .toList(),
                  );
                  // return StoryCircle();
                }),

                // ...provider.stories.map((e) {
                //   return StoryCircle();
                // }).toList(),
              ],
            );
    });
  }
}

class StoryCircle extends StatelessWidget {
  const StoryCircle({
    required this.stories,
    Key? key,
  }) : super(key: key);

  final List<StoryModel> stories;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AppRouter.storyScreen,
                  arguments: StoryScreenArgs(stories: stories));
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.red, width: 3),
                image: stories.first.profileUrl != null
                    ? DecorationImage(
                        image: NetworkImage(stories.first.profileUrl!),
                        fit: BoxFit.cover)
                    : null,
              ),
              // child: Icon(
              //   Icons.add,
              //   color: Colors.red,
              // ),
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(stories.first.name),
      ],
    );
  }
}
