// import 'package:flutter/material.dart';

// import '../app/router/router.dart';
// import '../utils/media_query.dart';

// class BottemNavigation extends StatelessWidget {
//   const BottemNavigation({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: screenWidth(context),
//       height: screenHeight(context) * 0.1,
//       decoration: const BoxDecoration(
//         color: Colors.white,
//       ),
//       child: Row(
//         children: [
//           const SizedBox(
//             width: 35,
//           ),
//           GestureDetector(
//             child: const Icon(
//               Icons.home,
//               size: 50,
//             ),
//             onTap: () => Navigator.of(context).pushNamed(AppRouter.dashboard),
//           ),
//           const SizedBox(
//             width: 35,
//           ),
//           GestureDetector(
//             child: const Icon(
//               Icons.person,
//               size: 50,
//             ),
//             onTap: () {
//               Navigator.of(context).pushNamed(
//                 AppRouter.notifications,
//                 // arguments: Dummy.fromJson(dumy));
//               );
//             },
//           ),
//           const SizedBox(
//             width: 35,
//           ),
//           GestureDetector(
//             child: const Icon(
//               Icons.explore,
//               size: 50,
//             ),
//             onTap: () =>
//                 Navigator.of(context).pushNamed(AppRouter.messagesScreen),
//           ),
//           const SizedBox(
//             width: 35,
//           ),
//           GestureDetector(
//             child: const Icon(
//               Icons.chat,
//               size: 50,
//             ),
//             onTap: () => Navigator.of(context).pushNamed(AppRouter.chat),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:social_media_app/app/router/router.dart';
import 'package:social_media_app/screens/chat_screen.dart';
import 'package:social_media_app/screens/messages_screen.dart';
import 'package:social_media_app/screens/profile_screen.dart';

class BottomNav extends StatefulWidget {
  int number;
  BottomNav({Key? key, required this.number}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: GestureDetector(
              onTap: (() {
                Navigator.of(context).pushNamed(AppRouter.dashboard);
              }),
              child: Icon(Icons.home)),
          //backgroundColor: Color.fromARGB(255, 62, 111, 151),
          label: 'home',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () =>
                Navigator.of(context).pushNamed(AppRouter.notifications),
            child: Icon(
              Icons.person,
            ),
          ),
          //backgroundColor: Colors.green[300],
          label: 'Person',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
              onTap: () =>
                  Navigator.of(context).pushNamed(AppRouter.messagesScreen),
              child: Icon(Icons.explore)),
          //backgroundColor: Color.fromARGB(255, 243, 173, 69),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
              onTap: (() {
                Navigator.push(
                    context, MaterialPageRoute(builder: ((context) => Chat())));
              }),
              child: Icon(Icons.favorite)),
          // backgroundColor: Colors.indigo,
          label: 'Favorite',
        ),
      ],
      currentIndex: widget.number,
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.amber,
      selectedFontSize: 20,
      showSelectedLabels: true,
      iconSize: 35,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      onTap: (index) {
        setState(() {
          widget.number = index;
        });
      },
    );
  }
}
