import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:vespa/features/auth/repository/authentication_repository.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();


  /// TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();


  /// TextField Validation

  //Call this Function from Design & it will do the rest
   void loginUser(String email, String password) async{
    String? error =  await AuthenticationRepository.instance.loginUserWithEmailAndPassword(email, password);
    if(error != null) {
      Get.showSnackbar(GetSnackBar(message: error.toString(),));
    }
  }

}