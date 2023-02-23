import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/app/router/router.dart';
import 'package:social_media_app/auth/controllers/auth_controller.dart';
import 'package:social_media_app/common/controllers/post_controller.dart';
import 'package:social_media_app/models/like_model.dart';
import 'package:social_media_app/models/user_post.dart';
import 'package:social_media_app/screens/indivisual_post_page.dart';
import 'package:social_media_app/screens/other_user_profile_screen.dart';
import 'package:social_media_app/utils/media_query.dart';
import 'package:social_media_app/widgets/individual_posts/comments_list_view.dart';
import 'package:uuid/uuid.dart';
import '../list_of_persons_liked_post.dart';
import '../more_vert_outlined.dart';

class SinglePostWidget extends StatefulWidget {
  const SinglePostWidget({
    required this.post,
    Key? key,
  }) : super(key: key);
  final UserPosts post;

  @override
  State<SinglePostWidget> createState() => _SinglePostWidgetState();
}

class _SinglePostWidgetState extends State<SinglePostWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    AppRouter.otherUserprofileScreen,
                    arguments: OtherUserProfileArgs(uid: widget.post.uid),
                  );
                },
                child: ListTile(
                  leading: widget.post.profilePicture != null
                      ? CircleAvatar(
                          backgroundColor: Colors.orange,
                          backgroundImage: NetworkImage(
                            widget.post.profilePicture!,
                          ),
                          // child: Image.network(post.profilePicture!),
                        )
                      : const CircleAvatar(
                          backgroundColor: Colors.orange,
                          // child:  Image.asset(post.profilePicture ?? ""),
                        ),
                  title: Text(
                    widget.post.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(widget.post.accopation),
                  trailing: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRouter.indivisualPostPage,
                          arguments: IndivisualPageArgs(post: widget.post),
                        );
                      },
                      child: const MoreVertOutlined()),
                ),
              ),
            ),
            SizedBox(
              child: widget.post.userPostsAsset != null
                  ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              widget.post.userPostsAsset != null
                                  ? GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          AppRouter.indivisualPostPage,
                                          arguments: IndivisualPageArgs(
                                              post: widget.post),
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        // color: Colors.red,
                                        child: Image.network(
                                          widget.post.userPostsAsset!,
                                          // height: 150,
                                          width: 150,
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                              LikesCommentsWidgetVerticle(
                                post: widget.post,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        widget.post.about != null
                            ? Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: SizedBox(
                                      width: 200,
                                      child: Text(
                                        widget.post.about!,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        maxLines: 2,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : const SizedBox(),
                      ],
                    )
                  : Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              widget.post.about != null
                                  ? GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          AppRouter.indivisualPostPage,
                                          arguments: IndivisualPageArgs(
                                              post: widget.post),
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: SizedBox(
                                              width: 200,
                                              child: Text(
                                                widget.post.about!,
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                maxLines: 2,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : const SizedBox(),
                              LikesCommentsWidgetVerticle(
                                post: widget.post,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 60,
              child: LastLikesWidget(
                post: widget.post,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LastLikesWidget extends StatelessWidget {
  LastLikesWidget({
    required this.post,
    Key? key,
  }) : super(key: key);
  final UserPosts post;
  double left = -15.0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        if (post.lastLikes.isNotEmpty)
          ...post.lastLikes.map((e) {
            left = left + 15;
            return Positioned(
              left: left,
              child: ListOfPersonsLikedTheUserPosts(
                img: e["profileUrl"],
                clr: const Color.fromARGB(255, 143, 200, 247),
              ),
            );
          }).toList(),
        post.lastLikes.isNotEmpty
            ? Positioned(
                left: 100,
                child: Text(
                  post.lastLikes.length == 1
                      ? "Liked By ${post.lastLikes.last["name"]}"
                      : "Liked By ${post.lastLikes.last["name"]} and ${post.likesCount} other",
                  style: const TextStyle(color: Colors.red),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}

class LikesCommentsWidgetVerticle extends StatefulWidget {
  const LikesCommentsWidgetVerticle({
    required this.post,
    Key? key,
  }) : super(key: key);

  final UserPosts post;

  @override
  State<LikesCommentsWidgetVerticle> createState() =>
      _LikesCommentsWidgetVerticleState();
}

class _LikesCommentsWidgetVerticleState
    extends State<LikesCommentsWidgetVerticle> {
  LikeModel? isLikedByMe;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (mounted) {
      final controller = context.read<PostController>();
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        isLikedByMe =
            await controller.isPostLikeByMe(postId: widget.post.postId);
        setState(() {});
      });
    }

    return Column(
      children: [
        Column(
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
            Text(widget.post.likesCount.toString()),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              splashRadius: 20,
              onPressed: () {
                showBottomSheet(
                  context: context,
                  builder: (context) => SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Close"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CommentsListView(
                          post: widget.post,
                          isBottomSheet: true,
                        ),
                      ],
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.comment,
                size: 30,
              ),
            ),
            Text(widget.post.commentsCount.toString()),
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
