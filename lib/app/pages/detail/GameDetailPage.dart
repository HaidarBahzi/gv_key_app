import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:gv_key_app/app/models/ProductModel.dart';
import 'package:intl/intl.dart';

class GameDetailPage extends GetView {
  final Games game;

  GameDetailPage({required this.game});

  NumberFormat format = NumberFormat('#,###', 'id_ID');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'option1') {}
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'option1',
                  child: Text('Kosong Astagrifullah'),
                ),
              ];
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.network(
                game.headerImageUrl ??
                    "", // Menggunakan URL gambar dari objek game
                fit: BoxFit.cover,
              ),
            ),

            // Judul
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                game.gameName ??
                    "No Title", // Menggunakan nama game dari objek game
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Mengatur warna teks menjadi putih
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                game.isFree == 0
                    ? '${game.currency} ${format.format(game.initialPrice! / 100)}'
                    : 'Free',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                game.category ??
                    "No Category", // Menggunakan nama game dari objek game
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue, // Mengatur warna teks menjadi putih
                ),
              ),
            ),

            // Deskripsi
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Html(
                data: game.detailedDescription ??
                    "No Description", // Menggunakan nama game dari objek game
                style: {
                  "body": Style(
                    fontSize: FontSize(16),
                    color: Colors.white,
                  ),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
