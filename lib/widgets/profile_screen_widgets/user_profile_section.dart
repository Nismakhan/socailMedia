import 'package:flutter/material.dart';

import '../../utils/media_query.dart';
import 'no_of_followers_posts_and_followings.dart';

class UserProfileSection extends StatelessWidget {
  const UserProfileSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: screenWidth(context) * 0.35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromARGB(255, 243, 171, 195),
                border: Border.all(
                  color: Colors.red,
                  width: 2,
                ),
              ),
              child: Image.asset(
                "assets/images/1.png",
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Rubby Alexa",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Photographer",
                  style: TextStyle(
                    fontSize: 17,
                    color: Color.fromARGB(255, 68, 68, 68),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      width: 120,
                      height: 35,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 228, 211, 62),
                            Colors.deepOrange,
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text(
                          "Follow Me",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      // height: 30,

                      child: const Center(
                        child: Icon(
                          Icons.message,
                          size: 17,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            NoOfFollowersPostAndFollowings(
              counting: "95",
              text: "Following",
            ),
            NoOfFollowersPostAndFollowings(
              counting: "2.3k",
              text: "Posts",
            ),
            NoOfFollowersPostAndFollowings(
              counting: "1.5M",
              text: "Followers",
            ),
          ],
        )
      ],
    );
  }
}
