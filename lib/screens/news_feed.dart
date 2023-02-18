import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:social_media_app/widgets/DashboardWidgets/uploaded_posts.dart';

import '../app/controller/service_controller.dart';

class NewsFeed extends StatelessWidget {
  const NewsFeed({super.key});

  @override
  Widget build(BuildContext context) {
    final hh = context.read<ServiceController>().posts;
    return Scaffold();
  }
}
