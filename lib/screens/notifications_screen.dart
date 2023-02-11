import 'package:flutter/material.dart';
import 'package:social_media_app/common/my_bottom_nav.dart';
import '../widgets/notificationscreen_widgets/notification_screen__widget.dart';

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
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "Today",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Expanded(
              flex: 3,
              child: ListTileForNotificationScreen(),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "Yesturday",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: ListTileForNotificationScreen(),
            ),
            // BottomNav(number: 1)
          ],
        ),
      ),
    );
  }
}
