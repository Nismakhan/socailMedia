import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/app/controller/service_controller.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Text("data"),
            ),
            Expanded(
              child: Text("data"),
            ),
            // Expanded(
            //   child: Text("data"),
            // ),
          ],
        ),
        bottomNavigationBar: BottemNavigationBarClass(),
      ),
    );
  }
}

class BottemNavigationBarClass extends StatelessWidget {
  const BottemNavigationBarClass({
    Key? key,
  }) : super(key: key);
  final int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
          backgroundColor: Colors.amber,
          icon: Icon(
            Icons.home,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.red,
          icon: Icon(
            Icons.person,
          ),
          label: "User",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.explore,
          ),
          label: "Explore",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.abc,
          ),
          label: "heat",
        ),
      ],
      onTap: ((value) => value = currentIndex),
    );
  }
}
