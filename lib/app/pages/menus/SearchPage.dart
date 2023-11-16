import 'package:flutter/material.dart';
import 'package:gv_key_app/app/components/menu_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Search(),
          ],
        ),
      ),
    );
  }
}
