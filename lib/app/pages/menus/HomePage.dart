import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:get/get.dart';
import 'package:gv_key_app/app/components/menu_widget.dart';
import 'package:gv_key_app/app/controllers/action_controller.dart';
import 'package:gv_key_app/app/models/ProductModel.dart';
import 'package:gv_key_app/app/pages/detail/GameDetailPage.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomePage extends StatelessWidget {
  final controller = Get.put(ActionController());

  List<Games> getRandomItems(List<Games> list, int count) {
    list.shuffle();
    return list.take(count).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.loadData();
          controller.update();
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              FutureBuilder(
                future: controller.loadData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return GetBuilder<ActionController>(
                      builder: (controller) => FlutterCarousel(
                        options: CarouselOptions(
                          enableInfiniteScroll: true,
                          autoPlay: true,
                          aspectRatio: 16 / 9,
                          floatingIndicator: false,
                          slideIndicator: CircularSlideIndicator(),
                          showIndicator: true,
                          viewportFraction: 1,
                        ),
                        items: getRandomItems(
                                controller.steamResponseModelCarrouselCtr, 5)
                            .map((game) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: double.infinity,
                                child: Image.network(game.headerImageUrl!),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    );
                  } else {
                    // Handle errors
                    return Text('Error loading data');
                  }
                },
              ),
              SizedBox(height: 21),
              buildCategoryGrid(),
              SizedBox(height: 21),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'All Games',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              FutureBuilder(
                future: controller.loadData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return GetBuilder<ActionController>(
                      builder: (controller) => Skeleton.leaf(
                        enabled: controller.enableSkeleton.value,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.steamResponModelCtr.length,
                          itemBuilder: (context, index) {
                            final game = controller.steamResponModelCtr[index];

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
                                    color: const Color.fromARGB(
                                        255, 126, 126, 126),
                                  ),
                                ),
                                leading: game.headerImageUrl != null
                                    ? SizedBox(
                                        height: 48,
                                        width: 100,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child:
                                              Icon(Icons.image_not_supported),
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
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
