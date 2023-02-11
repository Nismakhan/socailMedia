import 'package:flutter/material.dart';

class MyGridView extends StatelessWidget {
  const MyGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.amber,
        ),
        Container(
          color: Colors.teal[300],
        ),
        Container(
          color: Colors.pink,
        ),
        Container(
          color: Colors.black,
        ),
        Container(
          color: Colors.cyan,
        ),
      ],
    );
  }
}
