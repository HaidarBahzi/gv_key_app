import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          title: const Text(
            'Privacy Policy',
            style: TextStyle(color: Colors.white),
          )),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '1. Pengumpulan dan Penggunaan Informasi Pribadi',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 8.0),
            Text(
              'Kami mengumpulkan informasi pribadi tertentu yang Anda berikan secara sukarela...',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 16.0),
            Text(
              '2. Cookie',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 8.0),
            Text(
              'Kami menggunakan cookie untuk meningkatkan pengalaman pengguna dan analisis...',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 16.0),
            Text(
              '3. Keamanan',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 8.0),
            Text(
              'Kami mengambil langkah-langkah keamanan untuk melindungi informasi pribadi Anda...',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 16.0),
            Text(
              '4. Perubahan pada Kebijakan Privasi',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 8.0),
            Text(
              'Kami dapat memperbarui Kebijakan Privasi ini dari waktu ke waktu. Perubahan tersebut...',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 16.0),
            Text(
              '5. Hubungi Kami',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 8.0),
            Text(
              'Jika Anda memiliki pertanyaan atau masalah mengenai Kebijakan Privasi ini, hubungi kami di: biglamp.gang@gmail.com',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
