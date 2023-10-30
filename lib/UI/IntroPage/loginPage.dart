import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vespa/UI/Homepage/homepage.dart';
import 'package:get/get.dart';
import 'package:vespa/UI/IntroPage/registerPage.dart';
import 'package:vespa/features/auth/controllers/login_controlller.dart';
import 'package:vespa/features/auth/repository/authentication_repository.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Color.fromRGBO(109, 203, 176, 1),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/vespa_logo.jpg",height: 300, width: 300, ),
                  Text(
                    "HELLO!",
                    style: GoogleFonts.bebasNeue(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                      letterSpacing: 1.2,
                    ),
                  ),
                  Text(
                    "Welcome to Vespa app!",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: TextFormField(
                          controller: controller.email,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "Email"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: TextFormField(
                          controller: controller.password,
                          obscureText: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          LoginController. instance.loginUser(controller.email.text.trim(), controller.password.text.trim());
                          // _formKey.currentState!.save();
                          // AuthenticationRepository()
                          // .loginUserWithEmailAndPassword(email: controller.email.text, password: controller.password.text)
                          //     .then((ok) {
                          //   if (ok == null) {
                          //     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Homepage(),), (route) => false);
                          //   } else {
                          //     ScaffoldMessenger.of(context)
                          //         .showSnackBar(SnackBar(
                          //       content: Text(
                          //         ok,
                          //         style: TextStyle(fontSize: 16),
                          //       ),
                          //     ));
                          //   }
                          // });

                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(color: Colors.cyan,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ),
                    ),
                  ),
                  SizedBox(height: 25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Not a member? "),
                      GestureDetector(
                        child: Text("Register Now", style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                        onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage(),)); },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
