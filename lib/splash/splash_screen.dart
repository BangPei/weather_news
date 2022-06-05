import 'package:flutter/material.dart';
import 'package:weather_news/helpers/session_manager.dart';
import 'package:weather_news/home/home_screen.dart';
import 'package:weather_news/login/login_screen.dart';
import 'package:weather_news/widgets/loading_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getSession();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoadingScreen(),
    );
  }

  getSession() async {
    bool isUsername = await Session.checkValue("username");
    if (isUsername) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
          (route) => false);
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (route) => false);
    }
  }
}
