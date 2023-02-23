import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/auth/controllers/auth_controller.dart';
import 'package:social_media_app/common/controllers/post_controller.dart';
import 'package:social_media_app/models/user_post.dart';
import 'package:social_media_app/utils/image_dialgue.dart';
import 'package:social_media_app/utils/media_query.dart';
import 'package:social_media_app/widgets/indivisual_post_page_widgets.dart';
import 'package:uuid/uuid.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  final _formKey = GlobalKey<FormState>();

  final _postText = TextEditingController();

  XFile? _pickedImage;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ListTile(
                    leading: Consumer<AuthController>(
                      builder: (context, value, child) {
                        return value.appUser!.profileUrl != null
                            ? CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                  value.appUser!.profileUrl!,
                                ),
                              )
                            : const MyCircleAvatars(img: "assets/images/1.png");
                      },
                    ),
                    title: TextFormField(
                      controller: _postText,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty && _pickedImage == null) {
                          return "Either enter post text or upload image";
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
                  _pickedImage != null
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Row(
                            children: [
                              Builder(builder: (context) {
                                final file = File(_pickedImage!.path);
                                return Stack(
                                  children: [
                                    Image.file(
                                      file,
                                      width: 80,
                                      height: 80,
                                    ),
                                    Positioned(
                                      right: -10,
                                      child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              _pickedImage = null;
                                            });
                                          },
                                          icon: const Icon(Icons.close)),
                                    ),
                                  ],
                                );
                              })
                            ],
                          ),
                        )
                      : const SizedBox(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.emoji_emotions,
                              color: Color.fromARGB(255, 168, 153, 14),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.image,
                                color: Colors.blue,
                              ),
                              onPressed: () async {
                                imageDialogue(context, onSelect: (image) {
                                  setState(() {
                                    _pickedImage = image;
                                  });
                                });
                              },
                              // Icons.image,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.location_on,
                              color: Colors.red,
                            ),
                          ],
                        ),
                        Consumer<PostController>(
                            builder: (context, provider, _) {
                          return provider.isLoading
                              ? const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.amber,
                                    ),
                                  ),
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
                                        Color.fromARGB(255, 228, 211, 62),
                                        Colors.deepOrange,
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                  ),
                                  child: OutlinedButton(
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        try {
                                          final currentUser = context
                                              .read<AuthController>()
                                              .appUser!;
                                          final postModel = UserPosts(
                                            uid: currentUser.uid,
                                            postId: const Uuid().v1(),
                                            name: currentUser.name,
                                            about: _postText.text,
                                            profilePicture:
                                                currentUser.profileUrl,
                                            accopation: currentUser.designation,
                                            dateAdded: Timestamp.now(),
                                            likesCount: 0,
                                            commentsCount: 0,
                                            lastLikes: [],
                                          );
                                          await context
                                              .read<PostController>()
                                              .uploadPost(context,
                                                  post: postModel,
                                                  pickedImage: _pickedImage);
                                          _postText.clear();
                                          // WidgetsBinding.instance.focusManager
                                          //     .primaryFocus
                                          //     ?.unfocus();
                                          setState(() {
                                            _pickedImage = null;
                                          });
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content:
                                                      Text("Post Uploaded")));
                                        } catch (e) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      "There was an issue $e")));
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
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
