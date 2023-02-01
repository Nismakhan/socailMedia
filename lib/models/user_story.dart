class UserStory {
  UserStory({
    required this.name,
    required this.profilePicture,
  });

  String name;
  String profilePicture;

  factory UserStory.fromJson(Map<String, dynamic> json) => UserStory(
        name: json["name"],
        profilePicture: json["profilePicture"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "profilePicture": profilePicture,
      };
}
