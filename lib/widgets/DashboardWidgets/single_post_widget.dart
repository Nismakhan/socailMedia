import 'package:flutter/material.dart';
import 'package:social_media_app/app/router/router.dart';
import 'package:social_media_app/models/user_post.dart';
import 'package:social_media_app/screens/indivisual_post_page.dart';
import 'package:social_media_app/screens/other_user_profile_screen.dart';
import '../list_of_persons_liked_post.dart';
import '../more_vert_outlined.dart';

class SinglePostWidget extends StatefulWidget {
  const SinglePostWidget({
    required this.post,
    Key? key,
  }) : super(key: key);
  final UserPosts post;

  @override
  State<SinglePostWidget> createState() => _SinglePostWidgetState();
}

class _SinglePostWidgetState extends State<SinglePostWidget> {
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
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    AppRouter.otherUserprofileScreen,
                    arguments: OtherUserProfileArgs(uid: widget.post.uid),
                  );
                },
                child: ListTile(
                  leading: widget.post.profilePicture != null
                      ? CircleAvatar(
                          backgroundColor: Colors.orange,
                          backgroundImage: NetworkImage(
                            widget.post.profilePicture!,
                          ),
                          // child: Image.network(post.profilePicture!),
                        )
                      : const CircleAvatar(
                          backgroundColor: Colors.orange,
                          // child:  Image.asset(post.profilePicture ?? ""),
                        ),
                  title: Text(
                    widget.post.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(widget.post.accopation),
                  trailing: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRouter.indivisualPostPage,
                          arguments: IndivisualPageArgs(post: widget.post),
                        );
                      },
                      child: const MoreVertOutlined()),
                ),
              ),
            ),
            SizedBox(
              child: widget.post.userPostsAsset != null
                  ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              widget.post.userPostsAsset != null
                                  ? GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          AppRouter.indivisualPostPage,
                                          arguments: IndivisualPageArgs(
                                              post: widget.post),
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        // color: Colors.red,
                                        child: Image.network(
                                          widget.post.userPostsAsset!,
                                          // height: 150,
                                          width: 150,
                                        ),
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
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        widget.post.about != null
                            ? Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: SizedBox(
                                      width: 200,
                                      child: Text(
                                        widget.post.about!,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        maxLines: 2,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : const SizedBox(),
                      ],
                    )
                  : Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              widget.post.about != null
                                  ? GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          AppRouter.indivisualPostPage,
                                          arguments: IndivisualPageArgs(
                                              post: widget.post),
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: SizedBox(
                                              width: 200,
                                              child: Text(
                                                widget.post.about!,
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                maxLines: 2,
                                              ),
                                            ),
                                          ),
                                        ],
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
                        ),
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
