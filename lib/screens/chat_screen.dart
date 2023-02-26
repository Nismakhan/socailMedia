import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:social_media_app/app/controller/service_controller.dart';
import 'package:social_media_app/models/chat_model.dart';

import '../utils/media_query.dart';

import '../widgets/listview_for_stories.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final colors = [
    const Color.fromARGB(255, 241, 187, 184),
    const Color.fromARGB(255, 230, 215, 172),
    const Color.fromARGB(255, 178, 186, 231),
    const Color.fromARGB(255, 174, 205, 231),
    const Color.fromARGB(255, 238, 168, 191),
    const Color.fromARGB(255, 187, 158, 236),
    const Color.fromARGB(255, 156, 255, 245),
    const Color.fromARGB(255, 174, 205, 231),
    const Color.fromARGB(255, 241, 187, 184),
    const Color.fromARGB(255, 178, 186, 231),
  ];

  @override
  Widget build(BuildContext context) {
    final chatQuery = FirebaseFirestore.instance
        .collection("chats")
        .where("userData.${FirebaseAuth.instance.currentUser!.uid}.uid",
            isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .withConverter<ChatModel>(
          fromFirestore: (snapshot, options) =>
              ChatModel.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toJson(),
        );

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                width: screenWidth(context),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              size: 30,
                              color: Colors.red,
                            ),
                          ),
                          const SizedBox(
                            width: 80,
                          ),
                          const Text(
                            "Chats",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      Expanded(
                        child: FirestoreListView<ChatModel>(
                          query: chatQuery,
                          itemBuilder: (context, doc) {
                            return Text("daw");
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
