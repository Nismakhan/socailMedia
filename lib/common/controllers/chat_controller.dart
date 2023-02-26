import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:social_media_app/common/repo/chat_repo.dart';
import 'package:social_media_app/models/chat_model.dart';
import 'package:social_media_app/models/message_model.dart';

class ChatController extends ChangeNotifier {
  final _repo = ChatRepo();
  Future<void> sendMessage({required MessageModel message}) async {
    try {
      await _repo.sendMessage(message: message);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<void> createChat(
      {required ChatModel chatModel, required MessageModel message}) async {
    try {
      await _repo.createChat(chatModel: chatModel, message: message);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
