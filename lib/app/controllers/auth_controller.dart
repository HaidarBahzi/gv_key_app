import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';

connection() async {
  final networkResult = await (Connectivity().checkConnectivity());
  return networkResult;
}

class AuthController extends GetxController {
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final usernameValidate = ValidationBuilder().build();

  final emailValidate =
      ValidationBuilder().email('Please enter a valid email!').build();

  final passwordValidate = ValidationBuilder()
      .minLength(8, 'Password must be at least 8 characters')
      .build();

  Future<void> reloginApi() async {
    SmartDialog.showLoading();
    await await Future.delayed(const Duration(seconds: 1));

    if (connection() != ConnectivityResult.none) {
    } else {}
  }
}
