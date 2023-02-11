import 'package:flutter/material.dart';
import 'package:social_media_app/app/splash.dart';
import 'package:social_media_app/auth/screens/login.dart';
import 'package:social_media_app/auth/screens/sign_up.dart';
import 'package:social_media_app/screens/chat_screen.dart';
import 'package:social_media_app/screens/dashboard.dart';
import 'package:social_media_app/screens/home_screen.dart';
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

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: ((context) => const Splash()),
        );
      case login:
        return MaterialPageRoute(
          builder: ((context) => Login()),
        );
      case signUp:
        return MaterialPageRoute(
          builder: ((context) => SignUp()),
        );
      case dashboard:
        return MaterialPageRoute(
          builder: ((context) => const Dashboard()),
        );
      case chat:
        return MaterialPageRoute(
          builder: ((context) => const Chat()),
        );
      case messagesScreen:
        return MaterialPageRoute(
          builder: ((context) => Messages()),
        );
      case profilePic:
        return MaterialPageRoute(
          builder: ((context) => const ProfileScreen()),
        );
      case notifications:
        return MaterialPageRoute(
          builder: ((context) => const Notifications()),
        );
      case newsFeed:
        return MaterialPageRoute(
          builder: ((context) => const NewsFeed()),
        );
      case homeScreen:
        return MaterialPageRoute(
          builder: ((context) => const HomeScreen()),
        );
    }
    return null;
  }
}
