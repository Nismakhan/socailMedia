import 'package:flutter/material.dart';
import 'package:social_media_app/app/router/router.dart';

class IconsCardsForDashboardOnTop extends StatelessWidget {
  const IconsCardsForDashboardOnTop({Key? key, required this.stack})
      : super(key: key);
  final Stack stack;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Card(
        elevation: 7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(
          child: stack,
        ),
      ),
    );
  }
}

class IconsOnTheTopOfDashboard extends StatelessWidget {
  const IconsOnTheTopOfDashboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconsCardsForDashboardOnTop(
            stack: Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(
              "assets/images/notification.png",
              width: 20,
              height: 40,
            ),
            Positioned(
              top: -13,
              left: 20,
              child: Image.asset("assets/images/small orange.png"),
            )
          ],
        )),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRouter.chatScreen);
          },
          child: IconsCardsForDashboardOnTop(
            stack: Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  "assets/images/message.png",
                  width: 20,
                  height: 40,
                ),
                Positioned(
                  top: -13,
                  left: 20,
                  child: Container(
                    width: 30,
                    height: 16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.red,
                    ),
                    child: const Center(
                        child: Text(
                      "34+",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
