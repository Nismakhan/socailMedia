import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_media_app/models/message_model.dart';

class ChatModel {
  ChatModel(
      {required this.chatId,
      required this.lastMessage,
      required this.usersData,
      required this.dateAdded,
      required this.dateModified});

  String chatId;
  MessageModel lastMessage;
  List<UsersData> usersData;
  Timestamp dateAdded;
  Timestamp dateModified;

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        chatId: json["chatId"],
        lastMessage: MessageModel.fromJson(json["lastMessage"]),
        usersData: (json["usersData"] as Map)
            .values
            .map((e) => UsersData.fromJson(e))
            .toList(),
        dateAdded: json["dateAdded"],
        dateModified: json["dateModified"],
      );

  Map<String, dynamic> toJson() => {
        "chatId": chatId,
        "lastMessage": lastMessage.toJson(),
        "usersData": {
          usersData.first.uid: usersData.first.toJson(),
          usersData[1].uid: usersData[1].toJson()
        },
        "dateAdded": dateAdded,
        "dateModified": dateModified
      };
}

class UsersData {
  UsersData({
    required this.name,
    this.profilePic,
    required this.uid,
  });

  String name;
  String? profilePic;
  String uid;

  factory UsersData.fromJson(Map<String, dynamic> json) => UsersData(
        name: json["name"],
        profilePic: json["profilePic"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "profilePic": profilePic,
        "uid": uid,
      };
}
