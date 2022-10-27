import 'dart:async';

import 'package:flutter/material.dart';

import '../Homepage/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Homepage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(109, 203, 176, 1),
      body: Center(
        child: Container(
            height: 200,
            width: 200,
            child: Image(image: AssetImage("assets/images/vespa_logo.jpg"))),
      ),
    );
  }
}
