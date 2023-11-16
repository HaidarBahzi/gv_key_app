import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gv_key_app/app/controllers/auth_controller.dart';

class SplashScreen extends GetView<AuthController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () => controller.reloginApi());

    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/ic_app.png',
        ),
      ),
    );
  }
}
