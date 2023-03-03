import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:social_media_app/utils/media_query.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> with TickerProviderStateMixin {
  late Animation containerColorAnimation;
  late AnimationController _containerColorController;

  @override
  void initState() {
    _containerColorController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    containerColorAnimation = Tween<double>(begin: 100, end: 300).animate(
        CurvedAnimation(
            parent: _containerColorController,
            curve: Curves.easeInOutCubicEmphasized))
      ..addListener(() {
        setState(() {});
      });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // _containerColorController
      // _containerColorController.forward();
      // _containerColorController.reverse();
    });

    super.initState();
  }

  double opacity = 0.5;
  double width = 200;
  double height = 200;
  Color color = Colors.red;
  bool isAnimated = false;
  CrossFadeState state = CrossFadeState.showFirst;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen 1"),
      ),
      body: SizedBox(
        width: screenWidth(context),
        height: screenHeight(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // AnimatedCrossFade(
            //     firstChild: CircleAvatar(
            //       radius: 60,
            //     ),
            //     secondChild: Container(
            //       width: 200,
            //       height: 200,
            //       color: Colors.red,
            //     ),
            //     crossFadeState: state,
            //     duration: const Duration(seconds: 1)),
            Container(
              // duration: const Duration(seconds: 2),
              // curve: Curves.easeInOutCubicEmphasized,
              width: containerColorAnimation.value,
              height: 200,
              color: Colors.red,
            ),
            ElevatedButton(
                onPressed: () {
                  if (isAnimated) {
                    _containerColorController.reverse();
                    isAnimated = !isAnimated;
                    // setState(() {});
                  } else {
                    _containerColorController.forward();
                    isAnimated = !isAnimated;
                    // setState(() {});
                  }

                  // _containerColorController.
                  // if (isAnimated) {
                  //   opacity = 0.5;
                  //   width = 200;
                  //   height = 200;
                  //   color = Colors.red;
                  //   state = CrossFadeState.showFirst;
                  //   isAnimated = !isAnimated;

                  //   setState(() {});
                  // } else {
                  //   opacity = 1;
                  //   width = 100;
                  //   height = 100;
                  //   color = Colors.green;
                  //   state = CrossFadeState.showSecond;
                  //   isAnimated = !isAnimated;
                  //   setState(() {});
                  // }
                },
                child: Text("Animated")),
          ],
        ),
      ),
    );
  }
}
