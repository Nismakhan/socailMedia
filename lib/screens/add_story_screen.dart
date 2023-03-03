import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/auth/controllers/auth_controller.dart';
import 'package:social_media_app/common/controllers/post_controller.dart';
import 'package:social_media_app/common/controllers/story_controller.dart';
import 'package:social_media_app/common/helper.dart';
import 'package:social_media_app/models/story_model.dart';
import 'package:social_media_app/utils/image_dialgue.dart';
import 'package:uuid/uuid.dart';
import 'package:video_player/video_player.dart';

class AddStoryScreen extends StatefulWidget {
  AddStoryScreen({super.key});

  @override
  State<AddStoryScreen> createState() => _AddStoryScreenState();
}

class _AddStoryScreenState extends State<AddStoryScreen> {
  final _textCon = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  XFile? selectedFile;

  VideoPlayerController? videoController;

  @override
  void dispose() {
    videoController?.dispose();
    _textCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Story"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty && selectedFile == null) {
                    return "Either text or image is required for status";
                  }
                  return null;
                },
                controller: _textCon,
                maxLines: 5,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text("Story Text")),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return imageDialogue(
                              context,
                              onSelect: (file) {
                                log(file.path.toString());
                                setState(() {
                                  selectedFile = file;
                                });
                              },
                            );
                          });
                    },
                    child: Text("Image")),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      final _picker = ImagePicker();
                      final file =
                          await _picker.pickVideo(source: ImageSource.camera);
                      if (file != null) {
                        selectedFile = file;
                        videoController = await VideoPlayerController.file(
                            File(selectedFile!.path),
                            videoPlayerOptions: VideoPlayerOptions())
                          ..initialize();
                        setState(() {});
                      }
                    },
                    child: Text("Video")),
              ],
            ),

            // VideoPlayerController.file(file)
            selectedFile != null
                ? Image(
                    width: 200,
                    height: 200,
                    image: FileImage(
                      File(
                        selectedFile!.path,
                      ),
                    ),
                  )
                : SizedBox(),

            selectedFile != null && videoController != null
                ? SizedBox(
                    width: 200,
                    height: 200,
                    child: AspectRatio(
                        aspectRatio: videoController!.value.aspectRatio,
                        child: VideoPlayer(videoController!)))
                : SizedBox(),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final currentUser =
                          context.read<AuthController>().appUser!;
                      StoryType type = StoryType.text;
                      if (selectedFile == null && _textCon.text.isNotEmpty) {
                        type = StoryType.text;
                      } else {
                        type = getStoryTypeByPath(selectedFile!.path);
                      }

                      final storyModel = StoryModel(
                        uid: currentUser.uid,
                        name: currentUser.name,
                        profileUrl: currentUser.profileUrl,
                        storyId: const Uuid().v1(),
                        storyUploadTime: DateTime.now(),
                        storyText: _textCon.text.isEmpty ? null : _textCon.text,
                        storyType: type,
                      );
                      await context
                          .read<StoryController>()
                          .addStory(story: storyModel, file: selectedFile);
                      Navigator.pop(context);
                    }
                  },
                  child: Text("Add Status")),
            ),
          ],
        ),
      ),
    );
  }

  StoryType getStoryTypeByPath(String path) {
    if (path.endsWith(".jpg") ||
        path.endsWith(".png") ||
        path.endsWith(".jpeg")) {
      return StoryType.picture;
    } else {
      return StoryType.video;
    }
  }
}
