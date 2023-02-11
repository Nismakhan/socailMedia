import 'package:flutter/material.dart';

class ListOfPersonsLikedTheUserPosts extends StatelessWidget {
  const ListOfPersonsLikedTheUserPosts({
    Key? key,
    this.clr,
    required this.img,
  }) : super(key: key);
  final Color? clr;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: clr,
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        img,
        width: 40,
      ),
    );
  }
}
