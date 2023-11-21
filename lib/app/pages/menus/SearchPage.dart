import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gv_key_app/app/components/menu_widget.dart';
import 'package:gv_key_app/app/controllers/action_controller.dart';
import 'package:gv_key_app/app/pages/detail/GameDetailPage.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  final controller = Get.put(ActionController());

  void performSearch() {
    final searchText = controller.searchController.text;
    if (searchText.isNotEmpty) {
      controller.loadDataName(name: searchText);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchForm(controller.searchController),
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.steamResponseModelSearchCtr.length,
                itemBuilder: (context, index) {
                  final game = controller.steamResponseModelSearchCtr[index];

                  return GestureDetector(
                    onTap: () {
                      Get.to(() => GameDetailPage(app_id: game.appId!));
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

  Widget SearchForm(
    TextEditingController searchController,
  ) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF1B1B1B),
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.white.withOpacity(0.5)),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                ),
                Expanded(
                  child: TextFormField(
                    controller: searchController,
                    style: TextStyle(color: Colors.white.withOpacity(0.75)),
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle:
                          TextStyle(color: Colors.white.withOpacity(0.75)),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: performSearch,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0,
                    ),
                    child: Icon(
                      Icons.search,
                      color: Colors.white.withOpacity(0.75),
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
