import 'package:flutter/material.dart';

class ListOfPersonsLikedTheUserPosts extends StatelessWidget {
  const ListOfPersonsLikedTheUserPosts({
    Key? key,
    this.clr,
    required this.img,
  }) : super(key: key);
  final Color? clr;
  final String? img;

  @override
  Widget build(BuildContext context) {
    return img != null
        ? Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: clr,
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                      img!,
                    ),
                    fit: BoxFit.cover)),
          )
        : Container(
            decoration: BoxDecoration(
              color: clr,
              shape: BoxShape.circle,
            ),
            child: const SizedBox(
              width: 40,
            ));
  }
}
