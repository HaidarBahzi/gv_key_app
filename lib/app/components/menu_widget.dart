import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gv_key_app/app/pages/detail/CategoryDetailPage.dart';
// import 'package:get/get.dart';

//
class buildHeader extends StatefulWidget {
  @override
  _buildHeaderState createState() => _buildHeaderState();
}

class _buildHeaderState extends State<buildHeader> {
  int _imageIndex = 0;
  List<String> imagePaths = [
    'assets/banner1.png',
    'assets/banner2.png',
    'assets/banner3.png',
  ];
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        _imageIndex = (_imageIndex + 1) % imagePaths.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imagePaths[_imageIndex],
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ],
    );
  }
}

//
Widget buildCategoryGrid() {
  return GridView.count(
    physics: const NeverScrollableScrollPhysics(),
    crossAxisCount: 2,
    padding: const EdgeInsets.all(0),
    shrinkWrap: true,
    children: [
      CategoryItem(
        image: 'assets/1.png',
        text: 'Multiplayer',
        icon: Icons.people,
        onPressed: () {
          Get.to(() => CategoryDetailPage(
                pass: 'Multi-player',
              ));
        },
      ),
      CategoryItem(
        image: 'assets/2.png',
        text: 'Singleplayer',
        icon: Icons.person,
        onPressed: () {
          Get.to(() => CategoryDetailPage(
                pass: 'Single-player',
              ));
        },
      ),
      CategoryItem(
        image: 'assets/3.png',
        text: 'PVP',
        icon: Icons.sports_soccer,
        onPressed: () {
          Get.to(() =>CategoryDetailPage(
            pass: 'PvP',
          ));
        },
      ),
      CategoryItem(
        image: 'assets/4.png',
        text: 'Cross Platform',
        icon: Icons.monetization_on,
        onPressed: () {
          Get.to(() => CategoryDetailPage(
                pass: 'Cross-Platform',
              ));
        },
      ),
    ],
  );
}

class CategoryItem extends StatelessWidget {
  final String image;
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  CategoryItem({
    required this.image,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.white.withOpacity(0.5)),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Opacity(
                opacity: 0.5,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: Colors.white.withOpacity(0.75),
                    size: 32,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    text,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.75),
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Profile
class ProfileAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF1B1B1B),
      ),
      child: const Center(
        child: Icon(
          Icons.person,
          size: 80,
          color: Color(0xFFFFFFFF),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const CustomButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.white),
                const SizedBox(width: 10),
                Text(
                  label,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
            const Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.arrow_forward, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
