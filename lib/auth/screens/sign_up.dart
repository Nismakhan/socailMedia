import 'package:flutter/material.dart';

import '../../app/router/router.dart';
import '../../utils/media_query.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 110),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  "assets/images/big grey circle1.png",
                  width: 300,
                  height: 200,
                ),
                Positioned(
                  top: 25,
                  left: 50,
                  child: Image.asset(
                    "assets/images/big grey circle2.png",
                    width: 200,
                    height: 150,
                  ),
                ),
                Positioned(
                  top: 90,
                  left: 66,
                  child: Image.asset(
                    "assets/images/small dark yellow.png",
                  ),
                ),
                Positioned(
                  top: 100,
                  right: 66,
                  child: Image.asset(
                    "assets/images/small orange.png",
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 140,
                  child: Image.asset(
                    "assets/images/small dark blue.png",
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 65,
                  child: Image.asset(
                    "assets/images/red shirt man.png",
                    width: 170,
                    height: 120,
                  ),
                ),
                Positioned(
                  bottom: -180,
                  left: 3,
                  child: Image.asset(
                    "assets/images/orange curve2.png",
                  ),
                ),
                Positioned(
                  bottom: -15,
                  left: -35,
                  child: Image.asset(
                    "assets/images/big blue.png",
                  ),
                ),
                Positioned(
                  bottom: -15,
                  left: -35,
                  child: Image.asset(
                    "assets/images/blackshirt_man.png",
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 65,
                  child: Image.asset(
                    "assets/images/small light blue.png",
                  ),
                ),
                Positioned(
                  bottom: -30,
                  right: -7,
                  child: Image.asset(
                    "assets/images/big purple.png",
                  ),
                ),
                Positioned(
                  bottom: 30,
                  right: 86,
                  child: Image.asset(
                    "assets/images/small purple.png",
                  ),
                ),
                Positioned(
                  bottom: -30,
                  right: -7,
                  child: Image.asset(
                    "assets/images/pink shirt woman2.png",
                  ),
                ),
                Positioned(
                  top: -30,
                  left: 40,
                  child: Image.asset(
                    "assets/images/big orange.png",
                  ),
                ),
                Positioned(
                  top: -30,
                  left: 40,
                  child: Image.asset(
                    "assets/images/small orange.png",
                  ),
                ),
                Positioned(
                  top: -30,
                  left: 40,
                  child: Image.asset(
                    "assets/images/yellow shirt woman.png",
                  ),
                ),
                Positioned(
                  top: -27,
                  right: -45,
                  child: Image.asset(
                    "assets/images/big yellow.png",
                  ),
                ),
                Positioned(
                  top: -27,
                  right: -45,
                  child: Image.asset(
                    "assets/images/blue shirt man.png",
                  ),
                ),
                Positioned(
                  top: 69,
                  right: 13,
                  child: Image.asset(
                    "assets/images/small light  yellow.png",
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 55,
            ),
            const Text(
              "The Best Social App To",
              style: TextStyle(
                fontFamily: "Times new roman",
                fontSize: 25,
                color: Colors.black,
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
                    color: Colors.black,
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
                    // fontFamily: "Times new roman",
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Find people with the same",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            const Text(
              "interest as you",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
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
                  // style: ButtonStyle(
                  //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  //     RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //       side: const BorderSide(
                  //         color: Colors.white,
                  //         width: 7,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  onPressed: () {},
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(255, 51, 49, 49),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
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
                  Navigator.pushReplacementNamed(context, AppRouter.dashboard);
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
    );
  }
}
