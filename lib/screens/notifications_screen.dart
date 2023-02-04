import 'package:flutter/material.dart';
import 'package:social_media_app/screens/dashboard.dart';

import '../app/controller/service_controller.dart';
import 'package:provider/provider.dart';

import '../utils/media_query.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 70,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          title: const Text("Notifications"),
        ),
        body: Column(
          children: [
            Expanded(flex: 1, child: Text("Today")),
            Expanded(
              flex: 6,
              child: Container(
                width: screenWidth(context),
                color: Colors.white,
                child: ListView.builder(
                  itemCount: context.read<ServiceController>().userStory.length,
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
                      ),
                      subtitle: Text(userChat.text),
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
          ],
        ),
      ),
    );
  }
}
