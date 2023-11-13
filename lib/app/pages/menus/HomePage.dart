import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gv_key_app/app/components/menu_widget.dart';

class HomePage extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildHeader(),
            buildCategoryGrid(),
            buildRecommendationList(),
          ],
        ),
      ),
    );
  }
}
