import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:social_media_app/auth/controllers/auth_controller.dart';
import 'package:social_media_app/common/controllers/post_controller.dart';

import 'package:social_media_app/models/user_post.dart';
import 'package:social_media_app/utils/media_query.dart';
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
  final _formKey = GlobalKey<FormState>();
  final _postText = TextEditingController();
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
            Form(
              key: _formKey,
              child: Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
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
                              title: TextFormField(
                                controller: _postText,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Post text is required";
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  label: Text("Write Something..."),
                                ),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.emoji_emotions,
                                        color:
                                            Color.fromARGB(255, 168, 153, 14),
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
                                  Consumer<PostController>(
                                      builder: (context, provider, _) {
                                    return provider.isLoading
                                        ? const Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        : Container(
                                            width: 100,
                                            height: 30,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color.fromARGB(
                                                      255, 228, 211, 62),
                                                  Colors.deepOrange,
                                                ],
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                              ),
                                            ),
                                            child: OutlinedButton(
                                              onPressed: () async {
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  try {
                                                    final currentUser = context
                                                        .read<AuthController>()
                                                        .appUser!;
                                                    final postModel = UserPosts(
                                                      uid: currentUser.uid,
                                                      postId: const Uuid().v1(),
                                                      name: currentUser.name,
                                                      userPostsAsset: "",
                                                      about: _postText.text,
                                                      accopation: currentUser
                                                          .designation,
                                                    );
                                                    await context
                                                        .read<PostController>()
                                                        .uploadPost(context,
                                                            post: postModel);
                                                  } catch (e) {
                                                    // show scafold messenger
                                                  }
                                                }
                                              },
                                              child: const Text(
                                                "Share",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          );
                                  }),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const UploadedPosts(),
                    ],
                  ),
                ),
              ),
            ),
            // BottomNav(
            //   number: 0,
            // ),
          ],
        ),
      ),
    );
  }
}
