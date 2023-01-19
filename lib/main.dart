import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vespa/UI/Catalogue/catalogueVespa.dart';
import 'package:vespa/UI/Homepage/homepage.dart';
import 'package:vespa/UI/IntroPage/loginPage.dart';
import 'package:vespa/UI/IntroPage/registerPage.dart';
import 'package:vespa/UI/IntroPage/startPage.dart';
import 'package:vespa/UI/ProfilePage/profilepage.dart';
import 'package:vespa/UI/SplashScreen/splashScreen.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vespa/features/auth/repository/authentication_repository.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthenticationRepository()));

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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: CircularProgressIndicator()
    );
  }
}
