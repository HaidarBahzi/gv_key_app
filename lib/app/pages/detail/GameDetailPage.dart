import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:gv_key_app/app/controllers/action_controller.dart';
import 'package:intl/intl.dart';

class GameDetailPage extends StatelessWidget {
  final int app_id;

  GameDetailPage({required this.app_id});

  NumberFormat format = NumberFormat('#,###', 'id_ID');

  final controller = Get.put(ActionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: controller.loadDetailGame(app_id: app_id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final game = controller.steamResponModelCtr.first;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image Header
                  Image.network(
                    game.headerImageUrl ?? "",
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                  ),
                  // Game Details
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      game.gameName ?? "No Title",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
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
                      game.category ?? "No Category",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Html(
                      data: game.detailedDescription ?? "No Description",
                      style: {
                        "body": Style(
                          fontSize: FontSize(16),
                          color: Colors.white,
                        ),
                      },
                    ),
                  ),
                  // Bottom Navigation Bar
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.08,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  size: 33,
                ),
                onPressed: () => controller.addCartProduct(
                  app_id: app_id,
                ),
                color: Colors.white,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      // Buy Now logic here
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      foregroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    child: Text(
                      'Buy Now',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
