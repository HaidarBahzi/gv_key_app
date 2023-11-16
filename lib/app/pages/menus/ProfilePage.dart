import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gv_key_app/app/components/menu_widget.dart';
import 'package:get_storage/get_storage.dart';

class ProfilePage extends GetView {
  final localStorage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: Container(
        margin: const EdgeInsets.only(bottom: 75, top: 75),
        child: Column(
          children: [
            ProfileAvatar(),
            const SizedBox(height: 20),
            const Text(
              'Fardan Athilla Haidar',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            const Text(
              'athillahaidar@gmail.com',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 40),
            CustomButton(
              icon: Icons.settings,
              label: 'Account Settings',
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            CustomButton(
              icon: Icons.public,
              label: 'Language',
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            CustomButton(
              icon: Icons.policy,
              label: 'Privacy Policy',
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            CustomButton(
              icon: Icons.logout,
              label: 'Log Out',
              onPressed: () {
                localStorage.erase();
                Get.offAllNamed('/auth/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
