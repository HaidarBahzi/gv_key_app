import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';

showLoading() async {
  await SmartDialog.show(
      builder: (_) {
        return Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Column(
            children: [
              LoadingIndicator(
                  indicatorType: Indicator.ballRotate,
                  colors: [Colors.red, Colors.green, Colors.blue],
                  strokeWidth: 1.5,
                  backgroundColor: Colors.black,
                  pathBackgroundColor: Colors.black),
              Text(
                'Loading...',
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            ],
          ),
        );
      },
      clickMaskDismiss: false,
      backDismiss: false,
      maskColor: Colors.black);
}
