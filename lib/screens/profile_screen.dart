import 'package:flutter/material.dart';
import 'package:social_media_app/screens/dashboard.dart';
import 'package:social_media_app/widgets/more_vert_outlined.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: const Icon(
          Icons.arrow_back,
          size: 30,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: MoreVertOutlined(),
          ),
        ],
      ),
      body: Column(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 100,
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
                    children: const [
                      Text(
                        "Rubby Alexa",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Rubby Alexa",
                        style: TextStyle(
                          fontSize: 17,
                          color: Color.fromARGB(255, 68, 68, 68),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
