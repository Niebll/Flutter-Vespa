import 'package:flutter/material.dart';

class Login_email_password {
  final String message;

  const Login_email_password(
      [this.message = "unkonwn error occured."]);

  factory Login_email_password.code(String code) {
    switch (code) {
      case 'user-not-found':
        return Login_email_password('Pengguna tidak ditemukan');
      case 'wrong-password':
        return Login_email_password('Kata sandi salah');
       default:
        return const Login_email_password();
    }
  }
}

