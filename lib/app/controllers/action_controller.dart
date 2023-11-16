import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gv_key_app/app/models/ProductModel.dart';
import 'package:http/http.dart' as http;

final localStorage = GetStorage();

connection() async {
  final networkResult = await (Connectivity().checkConnectivity());
  return networkResult;
}

class ActionController extends GetxController {
  RxList<Games> steamResponModelCtr = <Games>[].obs;
  RxBool enableSkeleton = true.obs;

  loadData() async {
    try {
      Map body = {'email': localStorage.read('userEmail')};

      SmartDialog.showLoading();

      final response = await http.post(
          Uri.parse("https://knowing-fit-goose.ngrok-free.app/api/product"),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ${localStorage.read('userToken')}',
          },
          body: jsonEncode(body));

      Future.delayed(Duration(seconds: 2), () => SmartDialog.dismiss());

      if (response.statusCode == 200) {
        steamResponModelCtr.assignAll(gamesFromJson(response.body));

        enableSkeleton.value = false;
      } else {
        print("status code : " +
            response.statusCode.toString() +
            " gagal " +
            response.body);
      }
    } catch (e) {
      print("error : " + e.toString());
    }
  }
}
