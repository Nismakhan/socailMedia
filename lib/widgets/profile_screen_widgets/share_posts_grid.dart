import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/app/router/router.dart';
import 'package:social_media_app/models/shared_post_model.dart';
import 'package:social_media_app/models/user_post.dart';
import 'package:social_media_app/screens/indivisual_post_page.dart';

class SharedPostGrid extends StatefulWidget {
  SharedPostGrid({
    required this.uid,
    // required this.postType,
    Key? key,
  }) : super(key: key);
  String uid;

  @override
  State<SharedPostGrid> createState() => _SharedPostGridState();
}

class _SharedPostGridState extends State<SharedPostGrid> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final sharedPosts = (await FirebaseFirestore.instance
              .collection("sharedPosts")
              .where("uid", isEqualTo: widget.uid)
              .get())
          .docs
          .map((e) => SharedPostModel.fromJson(e.data()))
          .toList();

      final postIds = sharedPosts.map((e) => e.postId).toList();
      log("Posts IDS $postIds");
      for (String postId in postIds) {
        final doc = (await FirebaseFirestore.instance
                .collection("posts")
                .doc(postId)
                .get())
            .data()!;
        log("Doc : $doc");
        posts.add(UserPosts.fromJson(doc));
      }
      isLoading = false;
      log("Total Posts : ${posts.length.toString()}");
      setState(() {});
    });
    super.initState();
  }

  bool isLoading = true;
  List<UserPosts> posts = [];
  // final PostType postType;
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : posts.isEmpty
            ? Center(
                child: Text("No Shared Posts"),
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
                  log(post.toString());
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, AppRouter.indivisualPostPage,
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
                        child: post.about != null && post.userPostsAsset == null
                            ? Center(
                                child: Text(post.about!),
                              )
                            : SizedBox(),
                      ),
                    ),
                  );
                },
              );
  }
}

enum PostType { photo, video }
