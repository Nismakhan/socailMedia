import 'package:flutter/material.dart';

class MoreVertOutlined extends StatelessWidget {
  const MoreVertOutlined({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: const Color.fromARGB(255, 250, 155, 148), width: 3),
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.more_vert_outlined,
      ),
    );
  }
}
