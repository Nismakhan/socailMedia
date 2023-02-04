import 'package:flutter/material.dart';
import 'package:social_media_app/utils/media_query.dart';

class LoginImageDesign extends StatelessWidget {
  const LoginImageDesign({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.asset(
          "assets/images/pink circle.png",
          width: screenWidth(context) * 0.7,
        ),
        Positioned(
          bottom: 70,
          left: 15,
          child: Image.asset(
            "assets/images/above grey circle.png",
          ),
        ),
        Positioned(
          bottom: 90,
          right: 20,
          child: Image.asset(
            "assets/images/grey1.png",
          ),
        ),
        Positioned(
          bottom: 80,
          right: 25,
          child: Image.asset(
            "assets/images/grey2.png",
          ),
        ),
        Positioned(
          bottom: 70,
          right: 30,
          child: Image.asset(
            "assets/images/grey3.png",
          ),
        ),
        Positioned(
          top: -50,
          right: 5,
          child: Image.asset(
            "assets/images/orange curve1.png",
          ),
        ),
        Positioned(
          bottom: -130,
          left: 3,
          child: Image.asset(
            "assets/images/white curve.png",
          ),
        ),
        Positioned(
          bottom: 0,
          left: 17,
          child: Image.asset(
            "assets/images/pink shirt woman1.png",
          ),
        ),
      ],
    );
  }
}
