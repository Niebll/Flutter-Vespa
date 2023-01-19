import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vespa/features/auth/repository/authentication_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  void registerUser(String email, String password) {
    AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
    }
  }


