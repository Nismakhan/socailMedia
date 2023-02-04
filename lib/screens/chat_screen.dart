import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/app/controller/service_controller.dart';

import '../utils/media_query.dart';
import '../widgets/messages_container.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Column(
            children: [
              ListTile(
                leading: Container(
                  // width: 90,
                  // height: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.red, width: 3),
                    color: const Color.fromARGB(255, 255, 194, 103),
                  ),
                  child: Image.asset(
                    "assets/images/6.png",
                  ),
                ),
                title: const Text(
                  "Ahmad Haris",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  "Active Now",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: SizedBox(
                  width: screenWidth(context) * 0.31,
                  child: Row(
                    children: const [
                      Icon(
                        Icons.voice_chat,
                        color: Colors.red,
                        size: 38,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.phone,
                        color: Colors.green,
                        size: 38,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              const Text(
                "YESTEDAY",
                style: TextStyle(
                  color: Color.fromARGB(255, 56, 55, 55),
                  fontSize: 17,
                ),
              ),
              Column(
                children: [
                  Container(
                    height: 400,
                    child: ListView.builder(
                        itemCount:
                            context.read<ServiceController>().chats.length,
                        itemBuilder: ((context, index) {
                          final chatData =
                              context.read<ServiceController>().chats[index];

                          return Align(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: MessagesContainer(
                                    clrForBackground:
                                        Color.fromARGB(255, 209, 205, 205),
                                    clrForTet:
                                        Color.fromARGB(255, 126, 126, 126),
                                    text: chatData.text,
                                    width: screenWidth(context),
                                    height: 60),
                              ),
                            ),
                          );
                        })),
                  )
                ],
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 15),
              //   child: Column(
              //     children: const [
              //       SizedBox(
              //         height: 30,
              //       ),
              //       Align(
              //         alignment: Alignment.centerLeft,
              //         child: MessagesContainer(
              //           clrForTet: Colors.grey,
              //           text: "Hi rehan How are you?",
              //           width: 170,
              //           height: 60,
              //           clrForBackground: Color.fromARGB(255, 211, 211, 211),
              //         ),
              //       ),
              //       Align(
              //         alignment: Alignment.centerRight,
              //         child: MessagesContainer(
              //           clrForTet: Colors.white,
              //           text: "I m good what about you?",
              //           width: 190,
              //           height: 60,
              //           clrForBackground: Colors.blue,
              //         ),
              //       ),
              //       Align(
              //         alignment: Alignment.centerLeft,
              //         child: MessagesContainer(
              //           clrForTet: Colors.grey,
              //           text: "Do you want a burgur?",
              //           width: 180,
              //           height: 60,
              //           clrForBackground: Color.fromARGB(255, 211, 211, 211),
              //         ),
              //       ),
              //       Align(
              //         alignment: Alignment.centerRight,
              //         child: MessagesContainer(
              //           clrForTet: Colors.white,
              //           text: "Would be awesome..",
              //           width: 180,
              //           height: 60,
              //           clrForBackground: Colors.blue,
              //         ),
              //       ),
              //       Align(
              //         alignment: Alignment.centerLeft,
              //         child: MessagesContainer(
              //           clrForTet: Colors.grey,
              //           text: "Okey then wait for it",
              //           width: 170,
              //           height: 60,
              //           clrForBackground: Color.fromARGB(255, 211, 211, 211),
              //         ),
              //       ),
              //       Align(
              //         alignment: Alignment.centerRight,
              //         child: MessagesContainer(
              //           clrForTet: Colors.white,
              //           text: "Thank you",
              //           width: 170,
              //           height: 60,
              //           clrForBackground: Colors.blue,
              //         ),
              //       ),
              //       Align(
              //         alignment: Alignment.centerLeft,
              //         child: MessagesContainer(
              //           clrForTet: Colors.grey,
              //           text: "Mention NOt",
              //           width: 170,
              //           height: 60,
              //           clrForBackground: Color.fromARGB(255, 211, 211, 211),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40, top: 20),
                    child: Container(
                      width: 50,
                      height: 70,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.add),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 9),
                    child: MessagesContainer(
                      text: "Type Message Here",
                      clrForTet: Colors.black,
                      clrForBackground: Color.fromARGB(255, 185, 185, 185),
                      width: 260,
                      height: 40,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    ChatScreenBottemWidgets(
                      icondata: Icons.image,
                      clr: Colors.blue,
                      text: "Images",
                    ),
                    ChatScreenBottemWidgets(
                      icondata: Icons.location_on,
                      clr: Colors.purple,
                      text: "Location",
                    ),
                    ChatScreenBottemWidgets(
                      icondata: Icons.file_copy,
                      clr: Colors.orange,
                      text: "File",
                    ),
                    ChatScreenBottemWidgets(
                      icondata: Icons.contact_phone,
                      clr: Colors.pink,
                      text: "Contact",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
