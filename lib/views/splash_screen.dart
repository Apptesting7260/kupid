import 'dart:async';

import 'package:cupid_match/match_seeker/tab_screen.dart';
import 'package:cupid_match/views/sign_up/signup_screen.dart';
import 'package:cupid_match/views/user/login_Screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 3),
        // () => Navigator.of(context).pushReplacement(MaterialPageRoute(
        // builder: (BuildContext context) => isLogin==false ? LoginScreen(): TabScreen(index: 0))));

        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => SignUp())));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          child: Image.asset(
            "assets/images/splash screen.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
