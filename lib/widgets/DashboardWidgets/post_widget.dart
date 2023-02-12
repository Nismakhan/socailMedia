import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/auth/controllers/auth_controller.dart';
import 'package:social_media_app/common/controllers/post_controller.dart';
import 'package:social_media_app/models/user_post.dart';
import 'package:social_media_app/utils/media_query.dart';
import 'package:uuid/uuid.dart';

class PostWidget extends StatefulWidget {
  PostWidget({
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
                    leading: CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 245, 148, 180),
                      child: Image.asset("assets/images/1.png"),
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
                                showBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return SizedBox(
                                        width: screenWidth(context),
                                        height: screenHeight(context) * 0.15,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text("Select Picker"),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                IconButton(
                                                    onPressed: () {
                                                      pickImage(
                                                          imageSource:
                                                              ImageSource
                                                                  .camera);
                                                    },
                                                    icon: const Icon(
                                                      Icons.camera,
                                                      color: Colors.blue,
                                                      size: 40,
                                                    )),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                IconButton(
                                                    onPressed: () {
                                                      pickImage(
                                                          imageSource:
                                                              ImageSource
                                                                  .gallery);
                                                    },
                                                    icon: const Icon(
                                                      Icons.browse_gallery,
                                                      color: Colors.purple,
                                                      size: 40,
                                                    )),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
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
                                            accopation: currentUser.designation,
                                          );
                                          await context
                                              .read<PostController>()
                                              .uploadPost(context,
                                                  post: postModel,
                                                  pickedImage: _pickedImage);
                                          _postText.clear();
                                          WidgetsBinding.instance.focusManager
                                              .primaryFocus
                                              ?.unfocus();
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

  void pickImage({required ImageSource imageSource}) async {
    final ImagePicker _picker = ImagePicker();
    final img = await _picker.pickImage(source: imageSource);
    setState(() {
      _pickedImage = img;
    });
  }
}
