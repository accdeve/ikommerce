import 'package:flutter/material.dart';
import 'package:ikommerce/ui/screen/global/login_page.dart';
import 'package:ikommerce/utils/extensions.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  static const String routename = "/";

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      pushAndRemoveScreen(context, pageRef: LoginPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Splash Screen",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
