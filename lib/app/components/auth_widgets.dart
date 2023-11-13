import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

Widget authForm({
  required TextEditingController formController,
  required String? Function(String?)? formValidator,
  required String hintText,
  required TextInputType keyboardType,
  required Icon iconForm,
  bool obscureText = false,
}) {
  return TextFormField(
      keyboardType: keyboardType,
      controller: formController,
      style: const TextStyle(color: Colors.white),
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: iconForm,
        contentPadding: const EdgeInsets.all(20),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          // borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          // borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          // borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          // borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
      ),
      validator: formValidator);
}

const defaultPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  ),
  decoration: BoxDecoration(
    border: Border(
      bottom: BorderSide(color: Colors.white, width: 1),
    ),
  ),
);
