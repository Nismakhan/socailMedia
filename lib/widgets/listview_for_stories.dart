import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/app/controller/service_controller.dart';

class ListviewForStories extends StatelessWidget {
  const ListviewForStories({
    required this.colors,
    Key? key,
  }) : super(key: key);
  final List<Color> colors;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: context.read<ServiceController>().userStory.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final userData = context.read<ServiceController>().userStory[index];
          final color = colors[index];
          return Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.red, width: 3),
                  ),
                  child: Image.asset(userData.profilePicture),
                ),
                Text(userData.name),
              ],
            ),
          );
        },
      ),
    );
  }
}
