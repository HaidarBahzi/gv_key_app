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
            Text('Enter the 4 digit code sent to \n osas@osas.com',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20,
                )),
            const SizedBox(
              height: 20,
            ),
            const Pinput(
              defaultPinTheme: defaultPinTheme,
              showCursor: true,
              // controller: , controller buat ngirim
            ),
            TextButton(onPressed: () {}, child: const Text('Resend Code')),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Verify Now',
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            ),
            TextButton(
                onPressed: () => Get.offAndToNamed('/auth/login'),
                child: const Text('Back to Login')),
          ],
        ),
      )),
    );
  }
}

class VerificationResetPage extends GetView<AuthController> {
  VerificationResetPage({super.key});

  // final conttroller = Get.put(VerifyResetPasswordController());

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
              'Verify your email',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text('Enter the 4 digit code sent to \n osas@osas.com',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20,
                )),
            const SizedBox(
              height: 20,
            ),
            const Pinput(
              defaultPinTheme: defaultPinTheme,
              showCursor: true,
              // controller: , controller buat ngirim
            ),
            TextButton(
              onPressed: () {},
              child: const Text("Resend Code",
                  style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.89,
              height: 40,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                ),
                child: const Text(
                  'Verify',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            TextButton(
              onPressed: () => Get.offAndToNamed('/auth/login'),
              child: const Text("Back to Login",
                  style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      )),
    );
  }
}
