import 'package:flutter/material.dart';
import 'package:social_media_app/app/splash.dart';
import 'package:social_media_app/screens/dashboard.dart';
import 'package:social_media_app/screens/login.dart';
import 'package:social_media_app/screens/sing_up.dart';

class AppRouter {
  static const String splash = "/";
  static const String login = "/login";
  static const String signUp = "/sign_up";
  static const String dashboard = "/dashboard";
  static const String chat = "/chat";
  static const String user = "/user";
  static const String messagesScreen = "/messages_screen";

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: ((context) => const Splash()),
        );
      case login:
        return MaterialPageRoute(
          builder: ((context) => const Login()),
        );
      case signUp:
        return MaterialPageRoute(
          builder: ((context) => const SignUp()),
        );
      case dashboard:
        return MaterialPageRoute(
          builder: ((context) => const Dashboard()),
        );
    }
    return null;
  }
}
