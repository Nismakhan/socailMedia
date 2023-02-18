class UserPosts {
  UserPosts({
    required this.postId,
    required this.uid,
    required this.name,
    this.profilePicture,
    this.userPostsAsset,
    this.about,
    required this.accopation,
  });

  String postId;
  String uid;
  String name;
  String? profilePicture;
  String? userPostsAsset;
  String? about;
  String accopation;

  factory UserPosts.fromJson(Map<String, dynamic> json) => UserPosts(
        postId: json["postId"] ?? "",
        uid: json["uid"] ?? "",
        name: json["name"],
        profilePicture: json["profilePicture"],
        userPostsAsset: json["userPostsAsset"],
        about: json["about"],
        accopation: json["accopation"],
      );

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "uid": uid,
        "name": name,
        "profilePicture": profilePicture,
        "userPostsAsset": userPostsAsset,
        "about": about,
        "accopation": accopation,
      };
}
