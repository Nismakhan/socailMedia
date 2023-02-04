// To parse this JSON data, do

class UserModel {
  UserModel({
    required this.name,
    required this.email,
    required this.designation,
    required this.profileUrl,
  });

  String name;
  String email;
  String designation;
  String profileUrl;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        email: json["email"],
        designation: json["designation"],
        profileUrl: json["profileUrl"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "designation": designation,
        "profileUrl": profileUrl,
      };
}
