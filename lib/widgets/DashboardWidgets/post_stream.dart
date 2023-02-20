import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:social_media_app/models/user_post.dart';
import 'package:social_media_app/utils/media_query.dart';
import 'package:social_media_app/widgets/DashboardWidgets/single_post_widget.dart';

class PostStream extends StatelessWidget {
  const PostStream({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("posts")
          .orderBy("dateAdded", descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        final data = snapshot.data?.docs
            .map((e) => UserPosts.fromJson(e.data()))
            .toList();

        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const SizedBox();
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.active:
          // return SinglePostWidget(post: UserPosts.fromJson(data!.first));
          case ConnectionState.done:
            return ListView.builder(
              shrinkWrap: true,
              itemCount: data!.length,
              itemBuilder: (context, index) {
                return SinglePostWidget(post: data[index]);
              },
            );
        }
      },
    );
  }
}
