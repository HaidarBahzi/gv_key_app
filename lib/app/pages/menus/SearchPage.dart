import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gv_key_app/app/components/menu_widget.dart';
import 'package:gv_key_app/app/controllers/action_controller.dart';
import 'package:gv_key_app/app/pages/detail/GameDetailPage.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  final controller = Get.put(ActionController());
  final TextEditingController searchController = TextEditingController();

  SeachFunction() async {
    await controller.loadDataName(name: searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Search(() => SeachFunction(), searchController),
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.steamResponseModelSearchCtr.length,
                itemBuilder: (context, index) {
                  final game = controller.steamResponseModelSearchCtr[index];

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
                        (game.category != null && game.category!.length > 30)
                            ? "${game.category!.substring(0, 30)}..."
                            : game.category ?? "No category",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 126, 126, 126),
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
                      // Add more details as needed
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
