import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vespa/UI/Homepage/homepage.dart';
import 'package:vespa/features/auth/controllers/signup_controller.dart';
import 'package:vespa/features/auth/repository/authentication_repository.dart';
import 'package:vespa/widget/Colors/colors.dart';
import 'package:vespa/widget/Text/text.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: MainColor(),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/biru.png",
                ),
                fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    CustomText(text: "Sign up", size: 35, color: Colors.white),
                    SizedBox(
                      height: 100,
                    ),
                    Image.asset(
                      "assets/images/vespa_logo_putih.png",
                      height: 60,
                    ),
                    SizedBox(
                      height: 200,
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
                                border: InputBorder.none, hintText: "Password"),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();

                            AuthenticationRepository()
                                .createUserWithEmailAndPassword(controller.email.text.trim(), controller.password.text.trim())
                                .then((ok) {
                              if (ok == null) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Homepage()));
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                    ok,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ));
                              }
                            });
                          }
                          // if (_formKey.currentState!.validate()) {
                          //   _formKey.currentState!.save();
                          //   SignUpController. instance.registerUser(controller.email.text.trim(), controller.password.text.trim());
                          // }
                          // else {
                          //   ScaffoldMessenger.of(context)
                          //       .showSnackBar(SnackBar(
                          //     content: Text(
                          //        AuthenticationRepository.instance.createUserWithEmailAndPassword(controller.email.text.trim(), controller.email.text.trim()).toString(),
                          //       style: TextStyle(fontSize: 16),
                          //     ),
                          //   ));
                          //
                          // }
                          // if (controller.password.text.length<6){
                          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password dari 6 karakter")));
                          // }
                          // else {
                          //   SignUpController. instance.registerUser(controller.email.text.trim(), controller.password.text.trim());
                          // }
                        },
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.cyan,
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                              child: Text(
                            "Sign up",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
