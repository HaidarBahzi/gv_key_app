import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gv_key_app/app/components/auth_widgets.dart';
import 'package:gv_key_app/app/controllers/auth_controller.dart';

class ResetPasswordInit extends GetView<AuthController> {
  ResetPasswordInit({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
              vertical: height * 0.15, horizontal: width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/ic_email_send.png',
                height: height * 0.35,
              ),
              Text(
                'Reset password',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text('Enter your email to reset your password',
                  style:
                      GoogleFonts.poppins(color: Colors.white, fontSize: 15)),
              const SizedBox(height: 30),
              authForm(
                  formController: controller.emailController,
                  formValidator: controller.emailValidate,
                  hintText: 'Enter your email',
                  keyboardType: TextInputType.emailAddress,
                  iconForm: const Icon(Icons.email, color: Colors.grey)),
              const SizedBox(height: 30),
              authButton(
                  context: context,
                  controller: () {
                    controller.resetInitApi();
                  },
                  text: 'Send OTP')
            ],
          ),
        ),
      ),
    );
  }
}

class ResetPasswordPage extends GetView<AuthController> {
  ResetPasswordPage({super.key});

  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
              vertical: height * 0.1, horizontal: width * 0.05),
          child: Form(
            key: _form,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Create new password',
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                authForm(
                  formController: controller.passwordController,
                  formValidator: controller.passwordValidate,
                  keyboardType: TextInputType.visiblePassword,
                  hintText: "Enter your new password",
                  iconForm: const Icon(
                    Icons.lock,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),
                authButton(
                    context: context,
                    controller: () => controller.resetPasswordApi(),
                    text: 'Reset Password'),
                const SizedBox(
                  height: 10,
                ),
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
          ),
        ),
      ),
    );
  }
}
