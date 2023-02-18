import 'package:flutter/material.dart';

import 'package:social_media_app/utils/media_query.dart';
import 'package:social_media_app/widgets/indivisual_post_page_widgets.dart';

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
            const AboutCurrentUser(),
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
