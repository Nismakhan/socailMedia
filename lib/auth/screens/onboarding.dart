import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hello'),
          ],
        ),
      ),
    );
  }
}
