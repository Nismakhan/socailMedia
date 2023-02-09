import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/app/controller/service_controller.dart';
import 'package:social_media_app/app/router/router.dart';
import 'package:social_media_app/utils/media_query.dart';
import 'package:social_media_app/widgets/bottom_navigation_bar.dart';
import 'package:social_media_app/widgets/icona_for_dashboard_on_top.dart';
import 'package:social_media_app/widgets/list_of_persons_liked_post.dart';
import 'package:social_media_app/widgets/listview_for_stories.dart';

import '../widgets/DashboardWidgets/uploaded_posts.dart';

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
            Expanded(
              flex: 3,
              child: Container(
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
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: screenWidth(context) * 0.89,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor:
                            const Color.fromARGB(255, 245, 148, 180),
                        child: Image.asset("assets/images/1.png"),
                      ),
                      title: const Text(
                        "Write Something...",
                        style: TextStyle(color: Colors.grey),
                      ),
                      trailing: const Icon(Icons.edit),
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.emoji_emotions,
                                color: Color.fromARGB(255, 168, 153, 14),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.image,
                                color: Colors.blue,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.location_on,
                                color: Colors.red,
                              ),
                            ],
                          ),
                          Container(
                            width: 100,
                            height: 30,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 228, 211, 62),
                                  Colors.deepOrange,
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, AppRouter.chat);
                              },
                              child: const Text(
                                "Share",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const UploadedPosts(),
            BottomNav(
              number: 0,
            ),
          ],
        ),
      ),
    );
  }
}
