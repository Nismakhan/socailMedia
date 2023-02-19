import 'package:flutter/material.dart';
import 'package:social_media_app/models/user_post.dart';

import 'package:social_media_app/utils/media_query.dart';
import 'package:social_media_app/widgets/indivisual_post_page_widgets.dart';

class IndivisualPostPage extends StatelessWidget {
  const IndivisualPostPage({required this.post, super.key});

  final UserPosts post;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
        ),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                image: post.userPostsAsset != null
                    ? DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          post.userPostsAsset!,
                        ),
                      )
                    : const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/images/clip path.png",
                        ),
                      ),
              ),
              width: screenWidth(context),
              height: screenHeight(context) * 0.5,
            ),
            AboutCurrentUser(
              post: post,
            ),
            const SizedBox(
              height: 10,
            ),
            if (post.about != null)
              SizedBox(
                width: screenWidth(context) * 0.9,
                child: Text(
                  post.about!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: ((context, index) {
                    return Column(
                      children: const [
                        ListTile(
                          leading: MyCircleAvatars(
                            img: "assets/images/7.png",
                          ),
                          title: Text(
                            "Nisma",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            "Wao this is awsome",
                            style: TextStyle(fontSize: 17, color: Colors.grey),
                          ),
                          trailing: Text("20 min"),
                        ),
                      ],
                    );
                  })),
            )
          ],
        ),
      ),
    );
  }
}

class IndivisualPageArgs {
  UserPosts post;
  IndivisualPageArgs({required this.post});
}
