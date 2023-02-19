import 'package:flutter/material.dart';

import 'package:social_media_app/models/user_post.dart';
import 'package:social_media_app/utils/media_query.dart';

class AboutCurrentUser extends StatelessWidget {
  const AboutCurrentUser({
    required this.post,
    Key? key,
  }) : super(key: key);
  final UserPosts post;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: screenWidth(context) * 0.16,
                height: 60,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: -35,
                      // left: 40,
                      child: post.profilePicture != null
                          ? CircleAvatar(
                              radius: 40,
                              backgroundImage:
                                  NetworkImage(post.profilePicture!),
                            )
                          : CircleAvatar(
                              radius: 30,
                              child: Image.asset("assets/images/1.png"),
                            ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                post.name,
              ),
            ],
          ),
          Row(
            children: [
              Image.asset(
                "assets/images/Icon ionic-ios-heart.png",
                width: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Image.asset(
                "assets/images/chat.png",
                width: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Image.asset(
                "assets/images/send.png",
                width: 30,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class MyCircleAvatars extends StatelessWidget {
  const MyCircleAvatars({
    required this.img,
    Key? key,
  }) : super(key: key);
  final String img;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Colors.red,
          ),
          shape: BoxShape.circle),
      child: CircleAvatar(
        radius: 40,
        backgroundColor: const Color.fromARGB(255, 255, 174, 201),
        child: Image.asset(img),
      ),
    );
  }
}
