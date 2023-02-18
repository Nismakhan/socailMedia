import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:social_media_app/auth/controllers/auth_controller.dart';
import 'package:social_media_app/common/controllers/post_controller.dart';

import 'package:social_media_app/models/user_post.dart';
import 'package:social_media_app/utils/media_query.dart';
import 'package:social_media_app/widgets/DashboardWidgets/post_widget.dart';
import 'package:social_media_app/widgets/DashboardWidgets/uploaded_posts.dart';

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
                  ListviewForStories(
                    colors: colors,
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: const [
                    PostWidget(),
                    UploadedPosts(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
