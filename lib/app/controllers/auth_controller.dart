import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gv_key_app/app/services/auth_api.dart';

final localStorage = GetStorage();

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

  final TextEditingController otpController = TextEditingController();

  String tempEmail = "";
  String tempOtp = "";

  void clearController() {
    usernameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    otpController.clear();
    tempEmail = "";
    tempOtp = "";
  }


  final usernameValidate = ValidationBuilder().build();

  final emailValidate =
      ValidationBuilder().email('Please enter a valid email!').build();

  final passwordValidate = ValidationBuilder()
      .minLength(8, 'Password must be at least 8 characters')
      .build();

  Future<void> loginApi() async {
    Map body = {
      'email': emailController.text,
      'password': passwordController.text,
    };

    SmartDialog.showLoading();
    await await Future.delayed(const Duration(seconds: 2));

    SmartDialog.dismiss();

    if (connection() != ConnectivityResult.none) {
      try {
        final response = await loginProcess(body: body);
        final responseApi = jsonDecode(response.body);

        if (response.statusCode == 200) {
          localStorage.write('userEmail', responseApi['email']);
          localStorage.write('userToken', responseApi['token']);

          print(localStorage.read('userToken'));

          clearController();

          Get.offAllNamed('/bottom-navbar');
        } else {
          SmartDialog.showNotify(
              notifyType: NotifyType.failure, msg: responseApi['detail']);

          clearController();
        }
      } catch (e) {
        SmartDialog.showToast(e.toString());
      }
    } else {
      SmartDialog.showToast('Cant connect to server');
    }
  }

  Future<void> registerApi() async {
    Map body = {
      'username': usernameController.text,
      'email': emailController.text,
      'password': passwordController.text,
    };

    SmartDialog.showLoading();
    await await Future.delayed(const Duration(seconds: 2));

    SmartDialog.dismiss();

    if (connection() != ConnectivityResult.none) {
      try {
        final response = await registerProcess(body: body);
        final responseApi = jsonDecode(response.body);

        if (response.statusCode == 200) {
          SmartDialog.showNotify(
              notifyType: NotifyType.success, msg: responseApi['message']);

          tempEmail = emailController.text;

          Get.toNamed('/auth/verify-account');
        } else {
          SmartDialog.showNotify(
              notifyType: NotifyType.failure, msg: responseApi['detail']);

          clearController();
        }
      } catch (e) {
        SmartDialog.showToast(e.toString());
      }
    } else {
      SmartDialog.showToast('Cant connect to server');
    }
  }

  Future<void> reloginApi() async {
    Map body = {
      'email': localStorage.read('userEmail'),
      'token': localStorage.read('userToken'),
    };

    await await Future.delayed(const Duration(seconds: 2));

    if (connection() != ConnectivityResult.none) {
      try {
        final response = await reloginProcess(body: body);

        if (response.statusCode == 200) {
          Get.offAndToNamed('/bottom-navbar');
        } else {
          Get.toNamed('/auth/login');
        }
      } catch (e) {
        SmartDialog.showToast(e.toString());
      }
    } else {
      SmartDialog.showToast('Cant connect to server');
    }
  }

  Future<void> accountVerifyApi() async {
    Map body = {
      'email': tempEmail,
      'OTP': otpController.text,
    };

    SmartDialog.showLoading();

    await await Future.delayed(const Duration(seconds: 2));

    SmartDialog.dismiss();

    if (connection() != ConnectivityResult.none) {
      try {
        final response = await verifyAccountProcess(body: body);
        final responseApi = jsonDecode(response.body);

        if (response.statusCode == 200) {
          SmartDialog.showNotify(
              msg: responseApi["message"], notifyType: NotifyType.success);

          clearController();

          Get.toNamed('/auth/login');
        } else {
          SmartDialog.showNotify(
              msg: responseApi["detail"], notifyType: NotifyType.failure);
        }
      } catch (e) {
        SmartDialog.showToast(e.toString());
      }
    } else {
      SmartDialog.showToast('Cant connect to server');
    }
  }

  Future<void> resetInitApi() async {
    Map body = {
      'email': emailController.text,
    };

    SmartDialog.showLoading();

    await await Future.delayed(const Duration(seconds: 2));

    SmartDialog.dismiss();

    if (connection() != ConnectivityResult.none) {
      try {
        final response = await initResetProcess(body: body);
        final responseApi = jsonDecode(response.body);

        if (response.statusCode == 200) {
          SmartDialog.showNotify(
              msg: responseApi["message"], notifyType: NotifyType.success);

          tempEmail = emailController.text;

          Get.toNamed('/auth/verify-reset-password');
        } else {
          SmartDialog.showNotify(
              msg: responseApi["detail"], notifyType: NotifyType.failure);
        }
      } catch (e) {
        SmartDialog.showToast(e.toString());
      }
    } else {
      SmartDialog.showToast('Cant connect to server');
    }
  }

  Future<void> resetVerifyApi() async {
    Map body = {
      'email': tempEmail,
      'token': otpController.text,
    };

    SmartDialog.showLoading();

    await await Future.delayed(const Duration(seconds: 2));

    SmartDialog.dismiss();

    if (connection() != ConnectivityResult.none) {
      try {
        final response = await verifyOtpResetProcess(body: body);
        final responseApi = jsonDecode(response.body);

        if (response.statusCode == 200) {
          SmartDialog.showNotify(
              msg: responseApi["message"], notifyType: NotifyType.success);

          tempOtp = otpController.text;

          Get.toNamed('/auth/reset-password');
        } else {
          SmartDialog.showNotify(
              msg: responseApi["detail"], notifyType: NotifyType.failure);
        }
      } catch (e) {
        SmartDialog.showToast(e.toString());
      }
    } else {
      SmartDialog.showToast('Cant connect to server');
    }
  }

  Future<void> resetPasswordApi() async {
    Map body = {
      'email': tempEmail,
      'token': tempOtp,
      'password': passwordController.text,
    };

    print(body);

    SmartDialog.showLoading();

    await await Future.delayed(const Duration(seconds: 2));

    SmartDialog.dismiss();

    if (connection() != ConnectivityResult.none) {
      try {
        final response = await resetPasswordProcess(body: body);
        final responseApi = jsonDecode(response.body);

        if (response.statusCode == 200) {
          SmartDialog.showNotify(
              msg: responseApi["message"], notifyType: NotifyType.success);

          clearController();

          Get.toNamed('/auth/login');
        } else {
          SmartDialog.showNotify(
              msg: responseApi["detail"], notifyType: NotifyType.failure);
        }
      } catch (e) {
        SmartDialog.showToast(e.toString() + " err");
      }
    } else {
      SmartDialog.showToast('Cant connect to server');
    }
  }
}
