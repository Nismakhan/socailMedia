class UserPosts {
  UserPosts({
    required this.name,
    required this.profilePicture,
    required this.userPostsAsset,
    required this.about,
    required this.accopation,
  });

  String name;
  String profilePicture;
  String userPostsAsset;
  String about;
  String accopation;

  factory UserPosts.fromJson(Map<String, dynamic> json) => UserPosts(
        name: json["name"],
        profilePicture: json["profilePicture"],
        userPostsAsset: json["userPostsAsset"],
        about: json["about"],
        accopation: json["accopation"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "profilePicture": profilePicture,
        "userPostsAsset": userPostsAsset,
        "about": about,
        "accopation": accopation,
      };
}
