import 'package:flutter/material.dart';
import 'package:social_media_app/app/splash.dart';
import 'package:social_media_app/auth/screens/login.dart';
import 'package:social_media_app/auth/screens/sign_up.dart';
import 'package:social_media_app/screens/chat_screen.dart';
import 'package:social_media_app/screens/dashboard.dart';
import 'package:social_media_app/screens/home_screen.dart';
import 'package:social_media_app/screens/indivisual_post_page.dart';
import 'package:social_media_app/screens/messages_screen.dart';
import 'package:social_media_app/screens/news_feed.dart';
import 'package:social_media_app/screens/notifications_screen.dart';
import 'package:social_media_app/screens/profile_screen.dart';

class AppRouter {
  static const String splash = "/";
  static const String login = "/login";
  static const String signUp = "/sign_up";
  static const String dashboard = "/dashboard";
  static const String chat = "/chat";
  static const String profilePic = "/profile_screen";

  static const String messagesScreen = "/messages_screen";
  static const String notifications = "/notifications_screen";
  static const String onboarding = "/onboarding";
  static const String newsFeed = "/news_feed";

  static const String homeScreen = "/homeScreen";

  static const String indivisualPostPage = "/indivisualPostPage";

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: ((context) => const Splash()),
          settings: settings,
        );
      case login:
        return MaterialPageRoute(
          builder: ((context) => Login()),
          settings: settings,
        );
      case signUp:
        return MaterialPageRoute(
          builder: ((context) => SignUp()),
          settings: settings,
        );
      case dashboard:
        return MaterialPageRoute(
          builder: ((context) => const Dashboard()),
          settings: settings,
        );
      case chat:
        return MaterialPageRoute(
          builder: ((context) => const Chat()),
          settings: settings,
        );
      case messagesScreen:
        return MaterialPageRoute(
          builder: ((context) => Messages()),
          settings: settings,
        );
      case profilePic:
        return MaterialPageRoute(
          builder: ((context) => const ProfileScreen()),
          settings: settings,
        );
      case notifications:
        return MaterialPageRoute(
          builder: ((context) => const Notifications()),
          settings: settings,
        );
      case newsFeed:
        return MaterialPageRoute(
          builder: ((context) => const NewsFeed()),
          settings: settings,
        );
      case homeScreen:
        return MaterialPageRoute(
          builder: ((context) => const HomeScreen()),
          settings: settings,
        );
      case indivisualPostPage:
        final args = settings.arguments as IndivisualPageArgs;
        return MaterialPageRoute(
          builder: ((context) => IndivisualPostPage(
                post: args.post,
              )),
          settings: settings,
        );
    }
    return null;
  }
}
