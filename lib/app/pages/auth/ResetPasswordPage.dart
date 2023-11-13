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
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.89,
                height: 40,
                child: ElevatedButton(
                  onPressed: () => Get.toNamed('/auth/verify-reset-password'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  child: Text(
                    'Login',
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                ),
              ),
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
                Image.asset(
                  'assets/ic_email_send.png',
                  height: height * 0.35,
                ),
                const SizedBox(height: 5),
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
                  keyboardType: TextInputType.emailAddress,
                  hintText: "Enter your email",
                  iconForm: const Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),
                authForm(
                    formController: controller.confirmPasswordController,
                    formValidator: controller.passwordValidate,
                    //TODO: change to password validator and controller
                    keyboardType: TextInputType.visiblePassword,
                    hintText: "Enter your password",
                    iconForm: const Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    obscureText: true),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => Get.toNamed('/auth/init-reset-password'),
                    child: Text(
                      'Forgot Password?',
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.89,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_form.currentState!.validate()) {
                        print('Password is valid');
                      } else {
                        print('nah');
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                    child: Text(
                      'Login',
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed('/auth/register');
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: "Dont have an account? ",
                      style: TextStyle(color: Colors.white),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Register",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
