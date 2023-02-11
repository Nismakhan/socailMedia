import 'package:flutter/material.dart';

class NoOfFollowersPostAndFollowings extends StatelessWidget {
  const NoOfFollowersPostAndFollowings({
    Key? key,
    required this.counting,
    required this.text,
  }) : super(key: key);
  final String counting;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          counting,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Text(
          text,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
