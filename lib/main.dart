import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/app/social_media.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await FirebaseAuth.instance.signOut();
  // FirebaseMessaging.onBackgroundMessage(onBackgroundMessageHandler());
  final token =
      await FirebaseMessaging.instance.getToken().then((value) => log(value!));
  // log(token);
  return runApp(const SocialMedia());
}

// onBackgroundMessageHandler() {
//   return FirebaseMessaging.onBackgroundMessage((message) async {
//     RemoteNotification? notification = message.notification;
//     AndroidNotification? android = message.notification?.android;
//     // // if (message.data["isChat"] != null) {
//     // //   Get.to(
//     // //     () => ChangeNotifierProvider<MessageProvider>.value(
//     // //       value: MessageProvider(),
//     // //       child: Chat(
//     // //         matchIdFromNot: message.data["matchId"],
//     // //       ),
//     // //     ),
//     // //   );
//     // }
//   });
// }
