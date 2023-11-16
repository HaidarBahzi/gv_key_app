import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gv_key_app/app/components/auth_widgets.dart';
import 'package:gv_key_app/app/controllers/auth_controller.dart';
import 'package:pinput/pinput.dart';

class VerificationAccountPage extends GetView<AuthController> {
  const VerificationAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Verify your account',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text('Enter the 5 digit code sent to your email',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20,
                )),
            const SizedBox(
              height: 20,
            ),
            Pinput(
              defaultPinTheme: defaultPinTheme,
              showCursor: true,
              length: 5,
              controller: controller.otpController,
            ),
            SizedBox(
              height: 50,
            ),
            authButton(
                context: context,
                controller: () => controller.accountVerifyApi(),
                text: 'Verify Now'),
            authTextButton(
                controller: () => Get.toNamed('/auth/login'),
                child: Text('Back to Login',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16))),
          ],
        ),
      )),
    );
  }
}

class VerificationResetPage extends GetView<AuthController> {
  VerificationResetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Verify your Reset Request',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text('Enter the 5 digit code sent to your email',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20,
                )),
            const SizedBox(
              height: 20,
            ),
            Pinput(
              defaultPinTheme: defaultPinTheme,
              showCursor: true,
              length: 5,
              controller: controller.otpController,
            ),
            SizedBox(
              height: 50,
            ),
            authButton(
                context: context,
                controller: () => controller.resetVerifyApi(),
                text: 'Verify Now'),
            authTextButton(
                controller: () {
                  controller.clearController();
                  Get.toNamed('/auth/login');
                },
                child: Text('Back to Login',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16))),
          ],
        ),
      )),
    );
  }
}
