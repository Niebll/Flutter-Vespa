import 'package:flutter/material.dart';
import 'package:vespa/UI/Homepage/homepage.dart';
import 'package:vespa/UI/IntroPage/loginPage.dart';
import 'package:vespa/UI/IntroPage/startPage.dart';
import 'package:vespa/UI/SplashScreen/splashScreen.dart';
import 'package:vespa/widget/search.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Search()
    );
  }
}
