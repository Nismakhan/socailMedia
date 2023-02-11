import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:social_media_app/app/controller/service_controller.dart';
import '../utils/media_query.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/listview_for_stories.dart';

class Messages extends StatelessWidget {
  Messages({super.key});

  final colors = [
    const Color.fromARGB(255, 241, 187, 184),
    const Color.fromARGB(255, 230, 215, 172),
    const Color.fromARGB(255, 178, 186, 231),
    const Color.fromARGB(255, 174, 205, 231),
    const Color.fromARGB(255, 238, 168, 191),
    const Color.fromARGB(255, 187, 158, 236),
    const Color.fromARGB(255, 156, 255, 245),
    const Color.fromARGB(255, 174, 205, 231),
    const Color.fromARGB(255, 241, 187, 184),
    const Color.fromARGB(255, 178, 186, 231),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Container(
                width: screenWidth(context),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          Text(
                            "Messages",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "STORIES",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListviewForStories(
                        colors: colors,
                      )
                    ],
                  ),
                )),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            flex: 6,
            child: Container(
              width: screenWidth(context),
              color: Colors.white,
              child: ListView.builder(
                itemCount: context.read<ServiceController>().chats.length,
                itemBuilder: ((context, index) {
                  final userData =
                      context.read<ServiceController>().userStory[index];
                  final userChat =
                      context.read<ServiceController>().chats[index];
                  return ListTile(
                    leading: Container(
                      // width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colors[index],
                      ),
                      child: Image.asset(userData.profilePicture),
                    ),
                    title: Text(
                      userData.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      userChat.text,
                      style: const TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                    trailing: Column(
                      children: [
                        Text(
                          userChat.time,
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
          BottomNav(number: 2),
        ],
      )),
    );
  }
}
