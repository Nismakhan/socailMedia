import 'package:flutter/material.dart';
import 'package:social_media_app/models/user_post.dart';

import 'package:social_media_app/utils/media_query.dart';
import 'package:social_media_app/widgets/individual_posts/comments_list_view.dart';
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
        body: SingleChildScrollView(
          child: Column(
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
                height: screenHeight(context) * 0.4,
              ),
              AboutCurrentUser(
                post: post,
              ),
              const SizedBox(
                height: 10,
              ),
              if (post.about != null)
                SizedBox(
                  width: screenWidth(context) * 0.8,
                  child: Text(
                    post.about!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  thickness: 1,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CommentsListView(
                post: post,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IndivisualPageArgs {
  UserPosts post;
  IndivisualPageArgs({required this.post});
}
