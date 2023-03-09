import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/app/controller/service_controller.dart';
import 'package:social_media_app/app/controller/ui_controller.dart';
import 'package:social_media_app/app/router/router.dart';
import 'package:social_media_app/auth/controllers/auth_controller.dart';
import 'package:social_media_app/common/controllers/chat_controller.dart';
import 'package:social_media_app/common/controllers/post_controller.dart';
import 'package:social_media_app/common/controllers/story_controller.dart';
import 'package:social_media_app/screens/animations/screens/screen_1.dart';
import 'package:social_media_app/screens/api/screens/api_screen1.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return AuthController();
        }),
        ChangeNotifierProvider(
          create: (context) => ServiceController(),
        ),
        ChangeNotifierProvider(
          create: (context) => UiController(),
        ),
        ChangeNotifierProvider(
          create: (context) => PostController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChatController(),
        ),
        ChangeNotifierProvider(
          create: (context) => StoryController(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) {
          return AppRouter.onGenerateRoute(settings);
        },
        home: ApiScreen1(),
        builder: (context, child) {
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
            },
            child: child!,
          );
        },
      ),
    );
  }
}
