import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:social_media_app/app/router/router.dart';
import 'package:social_media_app/models/user_post.dart';
import 'package:social_media_app/screens/indivisual_post_page.dart';

class PostsGrid extends StatelessWidget {
  PostsGrid({
    required this.posts,
    // required this.postType,
    Key? key,
  }) : super(key: key);
  List<UserPosts> posts;
  // final PostType postType;

  @override
  Widget build(BuildContext context) {
    posts = posts.where((element) => element.userPostsAsset != null).toList();

    return posts.isEmpty
        ? const Center(
            child: Text("No posts"),
          )
        : GridView.builder(
            itemCount: posts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
              crossAxisSpacing: 20,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final post = posts[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AppRouter.indivisualPostPage,
                        arguments: IndivisualPageArgs(post: post));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      image: post.userPostsAsset != null
                          ? DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(post.userPostsAsset!),
                            )
                          : null,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              );
            },
          );
  }
}

enum PostType { photo, video }
