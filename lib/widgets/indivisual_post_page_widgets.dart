import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/auth/controllers/auth_controller.dart';
import 'package:social_media_app/common/controllers/post_controller.dart';
import 'package:social_media_app/common/helper.dart';
import 'package:social_media_app/models/like_model.dart';

import 'package:social_media_app/models/user_post.dart';
import 'package:social_media_app/utils/const.dart';
import 'package:social_media_app/utils/media_query.dart';
import 'package:uuid/uuid.dart';

class AboutCurrentUser extends StatelessWidget {
  const AboutCurrentUser({
    required this.post,
    Key? key,
  }) : super(key: key);
  final UserPosts post;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: screenWidth(context) * 0.16,
                height: 60,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: -35,
                      // left: 40,
                      child: post.profilePicture != null
                          ? CircleAvatar(
                              radius: 40,
                              backgroundImage:
                                  NetworkImage(post.profilePicture!),
                            )
                          : CircleAvatar(
                              radius: 30,
                              child: Image.asset("assets/images/1.png"),
                            ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 35,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(Helper.getFormattedDateTime(post.dateAdded.toDate())),
                ],
              ),
            ],
          ),
          PostLikeCommentWidget(
            post: post,
          ),
        ],
      ),
    );
  }
}

class PostLikeCommentWidget extends StatefulWidget {
  const PostLikeCommentWidget({
    required this.post,
    Key? key,
  }) : super(key: key);

  final UserPosts post;

  @override
  State<PostLikeCommentWidget> createState() => _PostLikeCommentWidgetState();
}

class _PostLikeCommentWidgetState extends State<PostLikeCommentWidget> {
  int likeCount = 0;
  int commentCount = 0;
  LikeModel? isLikedByMe;

  @override
  void initState() {
    final controller = context.read<PostController>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      isLikedByMe = await controller.isPostLikeByMe(postId: widget.post.postId);
      setState(() {});
      initCountStream();
    });
    super.initState();
  }

  void initCountStream() {
    FirebaseFirestore.instance
        .collection("posts")
        .doc(widget.post.postId)
        .snapshots()
        .listen((event) {
      likeCount = event.data()!["likesCount"];
      commentCount = event.data()!["commentsCount"];
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              splashRadius: 20,
              onPressed: () async {
                if (isLikedByMe != null) {
                  await context.read<PostController>().unLike(
                      postId: widget.post.postId, likeId: isLikedByMe!.likeId);
                  setState(() {
                    isLikedByMe = null;
                  });
                } else {
                  final currentUser = context.read<AuthController>().appUser!;
                  final LikeModel likeModel = LikeModel(
                    likeId: const Uuid().v1(),
                    uid: currentUser.uid,
                    userName: currentUser.name,
                    profileUrl: currentUser.profileUrl,
                    dateAdded: Timestamp.now(),
                    postId: widget.post.postId,
                  );
                  context
                      .read<PostController>()
                      .addLike(post: widget.post, likeModel: likeModel);
                  setState(() {
                    isLikedByMe = likeModel;
                  });
                }
              },
              icon: isLikedByMe == null
                  ? const Icon(
                      Icons.favorite_border,
                      size: 30,
                    )
                  : const Icon(
                      Icons.favorite,
                      size: 30,
                      color: Colors.red,
                    ),
            ),
            Text(likeCount.toString()),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              splashRadius: 20,
              onPressed: () {},
              icon: const Icon(
                Icons.comment,
                size: 30,
              ),
            ),
            Text(commentCount.toString()),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              splashRadius: 20,
              onPressed: () {},
              icon: const Icon(
                Icons.share,
                size: 30,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class MyCircleAvatars extends StatelessWidget {
  const MyCircleAvatars({
    this.img,
    this.networkUrl,
    Key? key,
  }) : super(key: key);
  final String? img;
  final String? networkUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Colors.red,
          ),
          shape: BoxShape.circle),
      child: img != null
          ? CircleAvatar(
              radius: 40,
              backgroundColor: const Color.fromARGB(255, 255, 174, 201),
              child: Image.asset(img!),
            )
          : networkUrl != null
              ? CircleAvatar(
                  radius: 40,
                  backgroundColor: const Color.fromARGB(255, 255, 174, 201),
                  backgroundImage: NetworkImage(networkUrl!),
                  // child: Image.network(networkUrl!),
                )
              : const CircleAvatar(
                  radius: 40,
                  backgroundColor: Color.fromARGB(255, 255, 174, 201),
                ),
    );
  }
}
