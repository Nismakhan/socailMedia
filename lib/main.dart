import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/app/social_media.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await FirebaseAuth.instance.signOut();
  // final currentUser = FirebaseAuth.instance.currentUser;
  // if (currentUser != null) {
  //   //  currentUser.uid
  //   FirebaseFirestore.instance.collection("users").doc(currentUser.uid).get();
  //   log(currentUser.email!);
  //   log(currentUser.uid);
  //   log("I am logged in ");
  // } else {
  //   log("I am logged out");
  // }
  return runApp(const SocialMedia());
}
