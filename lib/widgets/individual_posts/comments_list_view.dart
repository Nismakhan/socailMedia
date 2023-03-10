import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/app/router/router.dart';
import 'package:social_media_app/auth/controllers/auth_controller.dart';
import 'package:social_media_app/common/controllers/post_controller.dart';
import 'package:social_media_app/models/comment_model.dart';
import 'package:social_media_app/models/user_post.dart';
import 'package:social_media_app/screens/other_user_profile_screen.dart';
import 'package:social_media_app/utils/media_query.dart';
import 'package:social_media_app/widgets/indivisual_post_page_widgets.dart';
import 'package:uuid/uuid.dart';
import 'package:timeago/timeago.dart' as timeago;

class CommentsListView extends StatefulWidget {
  const CommentsListView({
    this.isBottomSheet,
    required this.post,
    Key? key,
  }) : super(key: key);

  final UserPosts post;
  final bool? isBottomSheet;

  @override
  State<CommentsListView> createState() => _CommentsListViewState();
}

class _CommentsListViewState extends State<CommentsListView> {
  final _formKey = GlobalKey<FormState>();

  final _commentCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: widget.isBottomSheet != null && widget.isBottomSheet == true
                ? screenHeight(context) / 2
                : screenHeight(context) * 0.25,
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("posts")
                    .doc(widget.post.postId)
                    .collection("comments")
                    .orderBy("dateAdded", descending: true)
                    .snapshots(),
                builder: (context, snapShot) {
                  switch (snapShot.connectionState) {
                    case ConnectionState.none:
                      return const SizedBox();
                    case ConnectionState.waiting:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case ConnectionState.active:

                    case ConnectionState.done:
                      final comments = snapShot.data!.docs
                          .map((e) => CommentModel.fromJson(e.data()))
                          .toList();
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: comments.length,
                          itemBuilder: ((context, index) {
                            final comment = comments[index];
                            return CommentWidget(
                              comment: comment,
                            );
                          }));
                  }
                }),
          ),
          Row(
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _commentCon,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Comment is required";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      label: Text('Write a comment...'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final currentUser =
                          context.read<AuthController>().appUser;
                      final comment = CommentModel(
                        commentId: const Uuid().v1(),
                        text: _commentCon.text,
                        uid: currentUser!.uid,
                        profileUrl: currentUser.profileUrl,
                        userName: currentUser.name,
                        dateAdded: Timestamp.now(),
                        postId: widget.post.postId,
                      );
                      context
                          .read<PostController>()
                          .addComment(commentModel: comment);
                      _commentCon.clear();
                    }
                  },
                  icon: const Icon(
                    Icons.send,
                    color: Colors.blue,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}

class CommentWidget extends StatelessWidget {
  const CommentWidget({
    required this.comment,
    Key? key,
  }) : super(key: key);

  final CommentModel comment;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        comment.uid == FirebaseAuth.instance.currentUser!.uid
            ? IconButton(
                onPressed: () {
                  context
                      .read<PostController>()
                      .deleteComment(commentModel: comment);
                },
                icon: const Icon(Icons.delete))
            : const SizedBox(),
        ListTile(
          leading: GestureDetector(
            onTap: () {
              if (comment.uid == FirebaseAuth.instance.currentUser!.uid) {
                Navigator.of(context).pushNamed(
                  AppRouter.profileScreen,
                );
              } else {
                Navigator.of(context).pushNamed(
                  AppRouter.otherUserprofileScreen,
                  arguments: OtherUserProfileArgs(uid: comment.uid),
                );
              }
            },
            child: MyCircleAvatars(
              networkUrl: comment.profileUrl,
            ),
          ),
          title: Text(
            comment.userName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            comment.text,
            style: const TextStyle(fontSize: 17, color: Colors.grey),
          ),
          trailing: Text(timeago.format(comment.dateAdded.toDate())),
        ),
      ],
    );
  }
}
