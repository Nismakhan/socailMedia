import 'package:flutter/material.dart';
import 'package:social_media_app/app/splash.dart';
import 'package:social_media_app/auth/screens/login.dart';
import 'package:social_media_app/auth/screens/sign_up.dart';
import 'package:social_media_app/screens/add_story_screen.dart';
import 'package:social_media_app/screens/message_screen.dart';
import 'package:social_media_app/screens/dashboard.dart';
import 'package:social_media_app/screens/followers_screen.dart';
import 'package:social_media_app/screens/following_screen.dart';
import 'package:social_media_app/screens/home_screen.dart';
import 'package:social_media_app/screens/indivisual_post_page.dart';
import 'package:social_media_app/screens/chat_screen.dart';
import 'package:social_media_app/screens/news_feed.dart';
import 'package:social_media_app/screens/notifications_screen.dart';
import 'package:social_media_app/screens/other_user_profile_screen.dart';
import 'package:social_media_app/screens/profile_screen.dart';
import 'package:social_media_app/screens/story_screen.dart';

class AppRouter {
  static const String splash = "/";
  static const String login = "/login";
  static const String signUp = "/sign_up";
  static const String dashboard = "/dashboard";
  static const String chatScreen = "/chatScreen";
  static const String profileScreen = "/profile_screen";
  static const String otherUserprofileScreen = "/otherUserprofileScreen";

  static const String messagesScreen = "/messages_screen";
  static const String notifications = "/notifications_screen";
  static const String onboarding = "/onboarding";
  static const String newsFeed = "/news_feed";

  static const String homeScreen = "/homeScreen";

  static const String indivisualPostPage = "/indivisualPostPage";

  static const String followersScreen = "/followersScreen";
  static const String followingScreen = "/followingScreen";

  static const String addStoryScreen = "/addStoryScreen";

  static const String storyScreen = "/storyScreen";

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
      case chatScreen:
        return MaterialPageRoute(
          builder: ((context) => ChatScreen()),
          settings: settings,
        );
      case messagesScreen:
        final args = settings.arguments as MessageScreenArgs;
        return MaterialPageRoute(
          builder: ((context) => MessageScreen(
                args: args,
              )),
          settings: settings,
        );
      case profileScreen:
        return MaterialPageRoute(
          builder: ((context) => const ProfileScreen()),
          settings: settings,
        );
      case otherUserprofileScreen:
        final args = settings.arguments as OtherUserProfileArgs;
        return MaterialPageRoute(
          builder: ((context) => OtherUserProfileScreen(
                args: args,
              )),
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
      case followersScreen:
        final uid = settings.arguments as String;
        return MaterialPageRoute(
          builder: ((context) => FollowersScreen(
                uid: uid,
              )),
          settings: settings,
        );
      case followingScreen:
        final uid = settings.arguments as String;
        return MaterialPageRoute(
          builder: ((context) => FollowingScreen(
                uid: uid,
              )),
          settings: settings,
        );
      case addStoryScreen:
        return MaterialPageRoute(
          builder: ((context) => AddStoryScreen()),
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
      case storyScreen:
        final args = settings.arguments as StoryScreenArgs;
        return MaterialPageRoute(
          builder: ((context) => StoryScreen(
                stories: args.stories,
              )),
          settings: settings,
        );
    }
    return null;
  }
}
