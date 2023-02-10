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
                  SizedBox(
                    height: 430,
                    child: ListView.builder(
                        itemCount:
                            context.read<ServiceController>().chats.length,
                        itemBuilder: ((context, index) {
                          final chatData =
                              context.read<ServiceController>().chats[index];

                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: MessagesContainer(
                                  clrForBackground:
                                      const Color.fromARGB(255, 209, 205, 205),
                                  clrForText:
                                      const Color.fromARGB(255, 126, 126, 126),
                                  text: chatData.text,
                                  width: screenWidth(context) * 0.7,
                                  height: 60),
                            ),
                          );
                        })),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 50,
                      height: 70,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 226, 226, 226),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.add),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 226, 226, 226),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: 300,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Enter Your Message Here",
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
