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
          padding: const EdgeInsets.all(8),
          color: Colors.red,
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.amber,
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[300],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.pink,
        ),
        Container(padding: const EdgeInsets.all(8), color: Colors.black),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.cyan,
        ),
      ],
    );
  }
}
