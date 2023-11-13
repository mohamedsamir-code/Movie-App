import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movie_app/home/home_Screen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  static const String routeName = "Splash";

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), navigateTo);
  }

  void navigateTo() {
    Navigator.pushNamedAndRemoveUntil(
        context, HomeScreen.routeName, (route) => false);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Image.asset(
             'assets/images/splash.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
