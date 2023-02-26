import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/app/controller/service_controller.dart';
import 'package:social_media_app/auth/controllers/auth_controller.dart';
import 'package:social_media_app/auth/model/user_model.dart';
import 'package:social_media_app/common/controllers/chat_controller.dart';
import 'package:social_media_app/models/chat_model.dart';
import 'package:social_media_app/models/message_model.dart';
import 'package:social_media_app/utils/const.dart';
import 'package:uuid/uuid.dart';
import '../utils/media_query.dart';
import '../widgets/messages_container.dart';

class MessageScreen extends StatefulWidget {
  MessageScreen({required this.args, super.key});
  MessageScreenArgs args;

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  LoadingState state = LoadingState.idle;
  late Query<MessageModel> query;

  final _textCon = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    final firebaseAuth = FirebaseAuth.instance;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      try {
        state = LoadingState.processing;
        setState(() {});
        if (widget.args.chatModel != null) {
          log("Chat gotten from chat screen");
          setQuery();
        } else {
          widget.args.chatModel = await context
              .read<AuthController>()
              .doesChatExists(uid: widget.args.passedUser!.uid);
          if (widget.args.chatModel != null) {
            log("Chat gotten from database");
            setQuery();
          } else {
            log("not chat found");
          }
        }
        state = LoadingState.loaded;
        setState(() {});
      } catch (e) {
        state = LoadingState.error;
      }
    });
    super.initState();
  }

  void setQuery() {
    final firestore = FirebaseFirestore.instance;
    query = firestore
        .collection("chats")
        .doc(widget.args.chatModel!.chatId)
        .collection("messages")
        .withConverter(
            fromFirestore: (snap, option) =>
                MessageModel.fromJson(snap.data()!),
            toFirestore: (snap, options) => snap.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: state == LoadingState.processing
          ? const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Scaffold(
              body: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const UserChatHeader(),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(child: Text("data")),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 226, 226, 226),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: 300,
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Text is required";
                                  }
                                  return null;
                                },
                                controller: _textCon,
                                decoration: const InputDecoration(
                                  labelText: "Enter Your Message Here",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 50,
                              height: 70,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 226, 226, 226),
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    final _firebaseAuth = FirebaseAuth.instance;
                                    if (widget.args.chatModel != null) {
                                      final message = MessageModel(
                                        messageId: const Uuid().v1(),
                                        chatId: widget.args.chatModel!.chatId,
                                        uid: _firebaseAuth.currentUser!.uid,
                                        text: _textCon.text,
                                        dateAdded: Timestamp.now(),
                                      );
                                      context
                                          .read<ChatController>()
                                          .sendMessage(message: message);
                                    } else {
                                      final chatId = const Uuid().v1();
                                      final currentUser = context
                                          .read<AuthController>()
                                          .appUser!;
                                      final messageModel = MessageModel(
                                        messageId: const Uuid().v1(),
                                        chatId: chatId,
                                        uid: _firebaseAuth.currentUser!.uid,
                                        text: _textCon.text,
                                        dateAdded: Timestamp.now(),
                                      );

                                      final chatModel = ChatModel(
                                        chatId: chatId,
                                        lastMessage: messageModel,
                                        usersData: [
                                          // mine
                                          UsersData(
                                              name: currentUser.name,
                                              profilePic:
                                                  currentUser.profileUrl,
                                              uid: currentUser.uid),
                                          // otherUser
                                          UsersData(
                                              name:
                                                  widget.args.passedUser!.name,
                                              profilePic: widget
                                                  .args.passedUser!.profileUrl,
                                              uid: widget.args.passedUser!.uid),
                                        ],
                                        dateAdded: Timestamp.now(),
                                        dateModified: Timestamp.now(),
                                      );
                                      // Create a chat model and send message
                                      await context
                                          .read<ChatController>()
                                          .createChat(
                                              message: messageModel,
                                              chatModel: chatModel);

                                      widget.args.chatModel = chatModel;
                                    }
                                  }
                                },
                                icon: const Icon(Icons.send),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // FilesViewMessages(),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

class FilesViewMessages extends StatelessWidget {
  const FilesViewMessages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            ChatScreenBottemWidgets(
              icondata: Icons.image,
              clr: Colors.blue,
              text: "Images",
            ),
            ChatScreenBottemWidgets(
              icondata: Icons.location_on,
              clr: Colors.purple,
              text: "Location",
            ),
            ChatScreenBottemWidgets(
              icondata: Icons.file_copy,
              clr: Colors.orange,
              text: "File",
            ),
            ChatScreenBottemWidgets(
              icondata: Icons.contact_phone,
              clr: Colors.pink,
              text: "Contact",
            ),
          ],
        ),
      ),
    );
  }
}

class UserChatHeader extends StatelessWidget {
  const UserChatHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        // width: 90,
        // height: 90,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.red, width: 3),
          color: const Color.fromARGB(255, 255, 194, 103),
        ),
        child: Image.asset(
          "assets/images/6.png",
        ),
      ),
      title: const Text(
        "Ahmad Haris",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: const Text(
        "Active Now",
        style: TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: SizedBox(
        width: screenWidth(context) * 0.31,
        child: Row(
          children: const [
            Icon(
              Icons.voice_chat,
              color: Colors.red,
              size: 38,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.phone,
              color: Colors.green,
              size: 38,
            ),
          ],
        ),
      ),
    );
  }
}

class MessageScreenArgs {
  UserModel? passedUser;
  ChatModel? chatModel;
  MessageScreenArgs({this.passedUser, this.chatModel});
}
