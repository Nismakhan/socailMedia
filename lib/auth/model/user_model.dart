// To parse this JSON data, do

class UserModel {
  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.designation,
    this.profileUrl,
    required this.fcm,
  });

  String uid;
  String name;
  String email;
  String designation;
  String? profileUrl;
  String fcm;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json["uid"],
        name: json["name"],
        email: json["email"],
        designation: json["designation"],
        profileUrl: json["profileUrl"],
        fcm: json["fcm"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "email": email,
        "designation": designation,
        "profileUrl": profileUrl,
        "fcm": fcm,
      };
}
