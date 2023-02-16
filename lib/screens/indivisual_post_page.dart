import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/auth/controllers/auth_controller.dart';

import 'package:social_media_app/utils/media_query.dart';

class IndivisualPostPage extends StatelessWidget {
  const IndivisualPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              width: screenWidth(context),
              height: screenHeight(context) * 0.5,
              child: Image.asset(
                "assets/images/clip path.jpg",
                fit: BoxFit.fill,
              ),
            ),
            Consumer<AuthController>(
              builder: (context, value, child) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: screenWidth(context) * 0.2,
                            height: 60,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: const [
                                Positioned(
                                  top: -35,
                                  // left: 40,
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        AssetImage('assets/images/1.png'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            value.appUser!.name,
                          ),
                        ],
                      ),
                      Container(
                        child: Row(
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
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: screenWidth(context) * 0.9,
              child: const Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: ((context, index) {
                    return Column(
                      children: const [
                        ListTile(
                          leading: MyCircleAvatars(
                            img: "assets/images/7.png",
                          ),
                          title: Text(
                            "Nisma",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            "Wao this is awsome",
                            style: TextStyle(fontSize: 17, color: Colors.grey),
                          ),
                          trailing: Text("20 min"),
                        ),
                      ],
                    );
                  })),
            )
          ],
        ),
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
