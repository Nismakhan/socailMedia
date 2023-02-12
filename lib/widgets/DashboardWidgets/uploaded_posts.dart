import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/controller/service_controller.dart';
import '../../utils/media_query.dart';
import '../list_of_persons_liked_post.dart';

class UploadedPosts extends StatelessWidget {
  const UploadedPosts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth(context) * 0.89,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: context.read<ServiceController>().posts.length,
          itemBuilder: ((context, index) {
            final userData = context.read<ServiceController>().posts[index];
            return Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.orange,
                        child: Image.asset(userData.profilePicture ?? ""),
                      ),
                      title: Text(
                        userData.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(userData.accopation),
                      trailing: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 250, 155, 148),
                              width: 3),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.more_vert_outlined,
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                // color: Colors.red,
                                child: Image.asset(
                                  userData.userPostsAsset ?? "",
                                  // height: 150,
                                  width: 150,
                                ),
                              ),
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
                          userData.about != null
                              ? Text(
                                  userData.about!,
                                  overflow: TextOverflow.ellipsis,
                                  // textAlign: TextAlign.center,
                                  maxLines: 2,
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
          })),
    );
  }
}
