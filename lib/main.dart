import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vespa/UI/Catalogue/catalogueVespa.dart';
import 'package:vespa/UI/Homepage/homepage.dart';
import 'package:vespa/UI/IntroPage/loginPage.dart';
import 'package:vespa/UI/IntroPage/startPage.dart';
import 'package:vespa/UI/SplashScreen/splashScreen.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'UI/BuyingPage/payment.dart';

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
    initializeDateFormatting('az');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PaymentPage()
    );
  }
}
