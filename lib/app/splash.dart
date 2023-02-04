import 'package:flutter/material.dart';
import 'package:social_media_app/app/controller/service_controller.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/app/router.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    loadData();
    super.initState();
  }

  Future<void> loadData() async {
    await context.read<ServiceController>().getData();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushNamed(AppRouter.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}