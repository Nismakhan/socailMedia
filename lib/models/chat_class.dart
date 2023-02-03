class ChatClass {
  ChatClass({
    required this.text,
    required this.time,
    required this.isSentByMe,
  });

  String text;
  String time;
  bool isSentByMe;

  factory ChatClass.fromJson(Map<String, dynamic> json) => ChatClass(
        text: json["text"],
        time: json["time"],
        isSentByMe: json["isSentByMe"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "time": time,
        "isSentByMe": isSentByMe,
      };
}
