import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gv_key_app/app/components/menu_widget.dart';
import 'package:gv_key_app/app/controllers/action_controller.dart';
import 'package:gv_key_app/app/pages/detail/PolicyDetailPage.dart';

class ProfilePage extends StatelessWidget {
  final controller = Get.put(ActionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.loadUserProfile();
        },
        child: FutureBuilder(
          future: controller.loadUserProfile(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final profile = controller.profileResponseModelCtr.first;

              return Container(
                margin: const EdgeInsets.only(bottom: 75, top: 75),
                child: Column(
                  children: [
                    ProfileAvatar(),
                    const SizedBox(height: 20),
                    Text(
                      profile.userName,
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    Text(
                      profile.userEmail,
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
                      onPressed: () {
                        Get.to(PrivacyPolicyPage());
                      },
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
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
