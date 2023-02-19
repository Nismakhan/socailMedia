import 'package:flutter/material.dart';
import 'package:social_media_app/app/router/router.dart';
import 'package:social_media_app/models/user_post.dart';
import 'package:social_media_app/screens/indivisual_post_page.dart';
import '../list_of_persons_liked_post.dart';
import '../more_vert_outlined.dart';

class SinglePostWidget extends StatelessWidget {
  const SinglePostWidget({
    required this.post,
    Key? key,
  }) : super(key: key);
  final UserPosts post;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: post.profilePicture != null
                  ? CircleAvatar(
                      backgroundColor: Colors.orange,
                      backgroundImage: NetworkImage(
                        post.profilePicture!,
                      ),
                      // child: Image.network(post.profilePicture!),
                    )
                  : const CircleAvatar(
                      backgroundColor: Colors.orange,
                      // child:  Image.asset(post.profilePicture ?? ""),
                    ),
              title: Text(
                post.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(post.accopation),
              trailing: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRouter.indivisualPostPage,
                      arguments: IndivisualPageArgs(post: post),
                    );
                  },
                  child: const MoreVertOutlined()),
            ),
            SizedBox(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      post.userPostsAsset != null
                          ? Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              // color: Colors.red,
                              child: Image.network(
                                post.userPostsAsset!,
                                // height: 150,
                                width: 150,
                              ),
                            )
                          : const SizedBox(),
                      Column(
                        children: [
                          Image.asset(
                            "assets/images/Icon ionic-ios-heart.png",
                            width: 30,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Image.asset(
                            "assets/images/chat.png",
                            width: 30,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Image.asset(
                            "assets/images/send.png",
                            width: 30,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  post.about != null
                      ? Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                post.about!,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                maxLines: 2,
                              ),
                            ),
                          ],
                        )
                      : const SizedBox(),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: const [
                ListOfPersonsLikedTheUserPosts(
                  img: "assets/images/1.png",
                  clr: Color.fromARGB(255, 143, 200, 247),
                ),
                Positioned(
                  left: 15,
                  child: ListOfPersonsLikedTheUserPosts(
                    img: "assets/images/2.png",
                    clr: Color.fromARGB(255, 255, 246, 164),
                  ),
                ),
                Positioned(
                  left: 30,
                  child: ListOfPersonsLikedTheUserPosts(
                    img: "assets/images/3.png",
                    clr: Color.fromARGB(255, 163, 236, 166),
                  ),
                ),
                Positioned(
                  left: 45,
                  child: ListOfPersonsLikedTheUserPosts(
                    img: "assets/images/3.png",
                    clr: Color.fromARGB(255, 172, 212, 245),
                  ),
                ),
                Positioned(
                  left: 100,
                  top: 7,
                  child: Text(
                    "Liked By Hayra and 1K other",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
