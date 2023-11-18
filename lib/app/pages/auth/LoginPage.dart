import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gv_key_app/app/components/auth_widgets.dart';
import 'package:gv_key_app/app/controllers/auth_controller.dart';

class LoginPage extends GetView<AuthController> {
  LoginPage({super.key});

  // final controller = Get.put(LoginController());
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
                Image.asset('assets/ic_app_transparent.png'),
                const SizedBox(height: 5),
                Text(
                  'Login to continue',
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                authForm(
                  formController: controller.emailController,
                  formValidator: controller.emailValidate,
                  keyboardType: TextInputType.emailAddress,
                  hintText: "Enter your email",
                  iconForm: const Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                authForm(
                    formController: controller.passwordController,
                    formValidator: controller.passwordValidate,
                    keyboardType: TextInputType.visiblePassword,
                    hintText: "Enter your password",
                    iconForm: const Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    obscureText: true),
                authTextButton(
                  alignment: Alignment.centerRight,
                  controller: () {
                    Get.toNamed('/auth/init-reset-password');
                  },
                  child: Text(
                    'Forgot Password?',
                    style:
                        GoogleFonts.poppins(color: Colors.white, fontSize: 14),
                  ),
                ),
                const SizedBox(height: 20),
                authButton(
                    context: context,
                    text: 'Login',
                    controller: () {
                      if (_form.currentState!.validate()) {
                        controller.loginApi();
                      }
                    }),
                authTextButton(
                  controller: () {
                    controller.clearController();
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
