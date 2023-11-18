import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gv_key_app/app/controllers/action_controller.dart';
import 'package:gv_key_app/app/pages/detail/GameDetailPage.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoryDetailPage extends StatelessWidget {
  final String pass;

  final controller = Get.put(ActionController());

  CategoryDetailPage({super.key, required this.pass});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Game with $pass Category",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 14, // Sesuaikan ukuran teks sesuai kebutuhan
            ),
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            FutureBuilder(
              future: controller.loadDataCategory(category: pass),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return GetBuilder<ActionController>(
                    builder: (controller) => Skeleton.leaf(
                      enabled: controller.enableSkeleton.value,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount:
                            controller.steamResponseModelCategoryCtr.length,
                        itemBuilder: (context, index) {
                          final game =
                              controller.steamResponseModelCategoryCtr[index];

                          return GestureDetector(
                            onTap: () {
                              Get.to(GameDetailPage(game: game));
                            },
                            child: ListTile(
                              title: Text(
                                game.gameName ?? "No Name",
                                style: TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(
                                (game.category != null &&
                                        game.category!.length > 30)
                                    ? "${game.category!.substring(0, 30)}..."
                                    : game.category ?? "No category",
                                style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 126, 126, 126),
                                ),
                              ),
                              leading: game.headerImageUrl != null
                                  ? SizedBox(
                                      height: 48,
                                      width: 100,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.network(
                                          game.headerImageUrl!,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )
                                  : SizedBox(
                                      height: 48,
                                      width: 100,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Icon(Icons.image_not_supported),
                                      ),
                                    ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                } else {
                  return Text('Error loading data');
                }
              },
            ),
          ]),
        ));
  }
}
