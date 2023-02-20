import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/auth/controllers/auth_controller.dart';
import 'package:social_media_app/common/controllers/post_controller.dart';
import 'package:social_media_app/utils/const.dart';
import 'package:social_media_app/utils/media_query.dart';
import 'package:social_media_app/widgets/more_vert_outlined.dart';

import '../widgets/profile_screen_widgets/posts_grid.dart';
import '../widgets/profile_screen_widgets/photos_vedios_and_tagged_section.dart';
import '../widgets/profile_screen_widgets/user_profile_section.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        // leading: const Icon(
        //   Icons.arrow_back,
        //   size: 30,
        // ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: MoreVertOutlined(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            SizedBox(
              width: screenWidth(context),
              child: UserProfileSection(
                user: context.read<AuthController>().appUser!,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              // color: Colors.grey,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 228, 224, 224),
                borderRadius: BorderRadius.circular(10),
              ),

              width: screenWidth(context) * 0.7,
              // height: screenHeight(context),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    PhotosVediosAndTaggedSection(
                      text: "Photos",
                    ),
                    PhotosVediosAndTaggedSection(
                      text: "Vedios",
                    ),
                    PhotosVediosAndTaggedSection(
                      text: "Tagged",
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              height: 2,
            ),
            Expanded(
              child: Consumer<PostController>(builder: (context, provider, _) {
                switch (provider.state) {
                  case LoadingState.idle:
                    return const SizedBox();
                  case LoadingState.processing:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case LoadingState.error:
                    return const Center(
                      child: Text("Error"),
                    );
                  case LoadingState.loaded:
                    return PostsGrid(
                      posts: provider.currentUserPosts,
                    );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
