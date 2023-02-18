import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/controller/service_controller.dart';
import '../../screens/dashboard.dart';
import '../../utils/media_query.dart';
import '../list_of_persons_liked_post.dart';

class ListTileForNotificationScreen extends StatelessWidget {
  const ListTileForNotificationScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context),
      // height: screenHeight(context) * 0.4,
      color: Colors.white,
      child: ListView.builder(
        itemCount: context.read<ServiceController>().chats.length,
        itemBuilder: ((context, index) {
          final userData = context.read<ServiceController>().userStory[index];
          final userChat = context.read<ServiceController>().chats[index];
          return ListTile(
            leading: Stack(
              children: [
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.red),
                    shape: BoxShape.circle,
                    color: colors[index],
                  ),
                  child: Image.asset(userData.profilePicture),
                ),
                Positioned(
                    right: 5,
                    child: Container(
                      child: Icon(
                        Icons.favorite,
                        size: 20,
                        color: Colors.white,
                      ),
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ))
              ],
            ),
            title: Row(
              children: [
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
                        img: "assets/images/2.png",
                        clr: Color.fromARGB(255, 178, 235, 180),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  userData.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            subtitle: Text(
              userChat.text,
              style: const TextStyle(
                color: Colors.blue,
              ),
            ),
            trailing: Text(
              userChat.time,
            ),
          );
        }),
      ),
    );
  }
}
