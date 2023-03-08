import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class DynamicLinkService {
  static Future handleDynamicLinks() async {
    // 1. Get the initial dynamic link if the app is opened with a dynamic link
    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();

    // 2. handle link that has been retrieved
    // _handleDeepLink(data!);

    // 3. Register a link callback to fire if the app is opened up from the background
    // using a dynamic link.
    FirebaseDynamicLinks.instance.onLink.listen((event) {
      print("handle:");
      print(event.link.path);
      print(event.link.queryParameters);

      if (event.link.path == "/sharePost") {
        if (FirebaseAuth.instance.currentUser != null) return;
        //   Get.off(
        //       () => RegisterView(
        //             customerReferalId:
        //                 event.link.queryParameters["data"].toString(),
        //           ),
        //       binding: AuthBinding());
        // } else if (event.link.path == "/signUpProvider") {
        //   if (FirebaseAuth.instance.currentUser != null) return;
        //   Get.off(
        //       () => PRegisterView(
        //             providerReferId:
        //                 event.link.queryParameters["data"].toString(),
        //           ),
        //       binding: PAuthBinding());
        // } else {
        //   var argumentsEService =
        //       json.decode(event.link.queryParameters["data"].toString())
        //           as Map<String, dynamic>;

        //   Get.toNamed(Routes.E_SERVICE, arguments: {
        //     'eService': EService.fromJson(argumentsEService),
        //     'heroTag': event.link.queryParameters["heroTag"]
        //   });
      }
    }).onError((error) {
      print(error);
    });
  }

  static void _handleDeepLink(PendingDynamicLinkData data) {
    final Uri deepLink = data.link;
    final String path = deepLink.path;
    // var params = deepLink.queryParameters['title'];
    // var paramsName = deepLink.queryParameters["postname"];
    if (deepLink != null) {
      print('_handleDeepLink | deeplink: $deepLink');
      print('_handleDeepLink | deeplink: $path');
      // print('_handleDeepLink | deeplink: $params');
      // print('_handleDeepLink | deeplink: $paramsName');
      print(deepLink.queryParameters);
      if (path.contains("sharePost")) {}
    }
  }

  static Future<String> sharePost(
      {required String postId, required bool isShort}
      // bool isShort,
      // String postId,
      ) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://codvets.page.link',
      link: Uri.parse('https://codvets.page.link/postShare/$postId'),
      androidParameters: AndroidParameters(
        packageName: 'com.codvets.socialmedia',
      ),
      // NOT ALL ARE REQUIRED ===== HERE AS AN EXAMPLE =====
      // iosParameters: IOSParameters(
      //   bundleId: 'com.codvets.socialmedia',
      //   minimumVersion: '1.0.1',
      //   appStoreId: '123456789',
      // ),
      // googleAnalyticsParameters: GoogleAnalyticsParameters(
      //   campaign: 'example-promo',
      //   medium: 'social sharing',
      //   source: 'orkut',
      // ),
      socialMetaTagParameters: SocialMetaTagParameters(
        title: "Social App",
        description: "Share a post",
      ),
    );

    Uri dynamicUrl;
    if (isShort) {
      final ShortDynamicLink shortDynamicLink =
          await FirebaseDynamicLinks.instance.buildShortLink(parameters);
      dynamicUrl = shortDynamicLink.shortUrl;
    } else {
      dynamicUrl = await FirebaseDynamicLinks.instance.buildLink(parameters);
    }
    print(dynamicUrl);
    return dynamicUrl.toString();
  }
}
