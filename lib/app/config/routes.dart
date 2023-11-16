import 'package:get/get.dart';
import 'package:gv_key_app/app/bindings/auth_binding.dart';
import 'package:gv_key_app/app/pages/BottomNavigation.dart';
import 'package:gv_key_app/app/pages/auth/LoginPage.dart';
import 'package:gv_key_app/app/pages/auth/RegisterPage.dart';
import 'package:gv_key_app/app/pages/auth/ResetPasswordPage.dart';
import 'package:gv_key_app/app/pages/auth/VerificationPage.dart';
import 'package:gv_key_app/app/pages/splash/SplashScreenPage.dart';

final PageRoutes = [
  GetPage(
      name: '/',
      page: () => SplashScreen(),
      transitionDuration: const Duration(milliseconds: 500),
      transition: Transition.fadeIn),
  GetPage(
      name: '/auth/login',
      page: () => LoginPage(),
      binding: AuthBinding(),
      transitionDuration: const Duration(milliseconds: 500),
      transition: Transition.fadeIn),
  GetPage(
      name: '/auth/register',
      page: () => RegisterPage(),
      binding: AuthBinding(),
      transitionDuration: const Duration(milliseconds: 500),
      transition: Transition.fadeIn),
  GetPage(
      name: '/auth/init-reset-password',
      page: () => ResetPasswordInit(),
      binding: AuthBinding(),
      transitionDuration: const Duration(milliseconds: 500),
      transition: Transition.fadeIn),
  GetPage(
      name: '/auth/reset-password',
      page: () => ResetPasswordPage(),
      binding: AuthBinding(),
      transitionDuration: const Duration(milliseconds: 500),
      transition: Transition.fadeIn),
  GetPage(
      name: '/auth/verify-account',
      page: () => VerificationAccountPage(),
      binding: AuthBinding(),
      transitionDuration: const Duration(milliseconds: 500),
      transition: Transition.fadeIn),
  GetPage(
      name: '/auth/verify-reset-password',
      page: () => VerificationResetPage(),
      binding: AuthBinding(),
      transitionDuration: const Duration(milliseconds: 500),
      transition: Transition.fadeIn),
  GetPage(
      name: '/bottom-navbar',
      page: () => BottomNavbar(),
      transitionDuration: const Duration(milliseconds: 500),
      transition: Transition.fadeIn),
];
