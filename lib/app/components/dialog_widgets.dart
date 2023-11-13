import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:loading_indicator/loading_indicator.dart';

void showLoading() {
  SmartDialog.show(
      builder: (_) {
        return Container(
          height: 80,
          width: 180,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: const Column(
            children: [
              LoadingIndicator(
                  indicatorType: Indicator.ballRotate,
                  colors: [Colors.red, Colors.green, Colors.blue],
                  strokeWidth: 1.5,
                  backgroundColor: Colors.black,
                  pathBackgroundColor: Colors.black),
              Text(
                'easy custom dialog',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        );
      },
      clickMaskDismiss: false,
      backDismiss: false,
      maskColor: Colors.black);
}
