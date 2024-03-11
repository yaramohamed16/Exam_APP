import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../shared/app_storage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      if (GetIt.instance.get<AppStorage>().getToken() != null) {
        Navigator.pushNamed(context, '/home_screen');
      } else {
        Navigator.pushNamed(context, '/login');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Image.asset(
          "assets/images/Splash Screen.png",
          fit: BoxFit.cover,
        ),
      ),
    ));
  }
}
