import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/app/controller/ui_controller.dart';
import 'package:social_media_app/common/my_bottom_nav.dart';

import 'package:social_media_app/screens/dashboard.dart';
import 'package:social_media_app/screens/explore.dart';

import 'package:social_media_app/screens/chat_screen.dart';
import 'package:social_media_app/screens/notifications_screen.dart';
import 'package:social_media_app/screens/profile_screen.dart';

import 'indivisual_post_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const MyBottomNav(),
        body: Consumer<UiController>(builder: (context, provider, _) {
          return PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: provider.pageCon,
            // onPageChanged: (value) {
            //   provider.changeCurrentIndex(value);
            // },
            children: [
              const Dashboard(),
              const ProfileScreen(),
              const Notifications(),
              Explore()
              // IndivisualPostPage(),
            ],
          );
        }));
  }
}
