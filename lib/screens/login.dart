import 'package:flutter/material.dart';

import '../app/router.dart';
import '../utils/media_query.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 97, 96, 96),
                Color.fromARGB(255, 15, 48, 15),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 130),
            child: Column(
              children: [
                Stack(
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
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "The Best Social App To",
                  style: TextStyle(
                    fontFamily: "Times new roman",
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Make New Friends",
                      style: TextStyle(
                        fontFamily: "Times new roman",
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      "!",
                      style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 233, 148, 20),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Find people with the same",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                const Text(
                  "interest as you",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SizedBox(
                    width: screenWidth(context) * 0.8,
                    height: screenHeight(context) * 0.08,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, AppRouter.signUp);
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Container(
                  width: screenWidth(context) * 0.8,
                  height: screenHeight(context) * 0.08,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 228, 211, 62),
                        Colors.deepOrange,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRouter.dashboard,
                      );
                    },
                    child: const Text(
                      "Log In",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
