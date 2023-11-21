import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gv_key_app/app/controllers/action_controller.dart';
import 'package:gv_key_app/app/pages/detail/GameDetailPage.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  final controller = Get.put(ActionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
      onRefresh: () async {
        await controller.loadDataCart();
        controller.update();
      },
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Text(
              'Your Personal Cart',
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            FutureBuilder(
              future: controller.loadDataCart(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return GetBuilder<ActionController>(
                    builder: (controller) => Skeleton.leaf(
                      enabled: controller.enableSkeleton.value,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount:
                            controller.steamResponseModelAllCartCtr.length,
                        itemBuilder: (context, index) {
                          final game =
                              controller.steamResponseModelAllCartCtr[index];

                          return GestureDetector(
                            onTap: () {
                              Get.to(() => GameDetailPage(
                                  app_id: game.productInfoAppId));
                            },
                            child: ListTile(
                              title: Text(
                                game.productInfoGameName ?? "No Name",
                                style: TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(
                                (game.productInfoCategory != null &&
                                        game.productInfoCategory!.length > 30)
                                    ? "${game.productInfoCategory!.substring(0, 30)}..."
                                    : game.productInfoCategory ?? "No category",
                                style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 126, 126, 126),
                                ),
                              ),
                              leading: game.productInfoHeaderImageUrl != null
                                  ? SizedBox(
                                      height: 48,
                                      width: 100,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.network(
                                          game.productInfoHeaderImageUrl!,
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
                              trailing: GestureDetector(
                                onTap: () {
                                  controller.deleteCartProduct(
                                      cart_id: game.cartId);

                                  controller.loadDataCart();

                                  controller.update();
                                },
                                child: Icon(
                                  Icons.delete,
                                  color:
                                      Colors.red, // You can customize the color
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
          ],
        ),
      ),
    ));
  }
}
