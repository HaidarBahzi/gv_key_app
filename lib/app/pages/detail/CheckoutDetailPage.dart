import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gv_key_app/app/controllers/action_controller.dart';

class ConfirmPaymentPage extends StatelessWidget {
  final int app_id;

  ConfirmPaymentPage({required this.app_id});

  final controller = Get.put(ActionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          title: const Text(
            'Choose Payment Method',
            style: TextStyle(color: Colors.white),
          )),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.08,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      controller.buyProduct(
                          app_id: app_id,
                          method: controller.paymentMethod.value);
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
      body: Column(
        children: [
          Obx(
            () => RadioListTile(
              activeColor: Colors.blue,
              title: Text(
                "Paypal",
                style: GoogleFonts.poppins(color: Colors.white),
              ),
              value: "Paypal",
              groupValue: controller.paymentMethod.value,
              onChanged: (value) {
                controller.paymentMethod.value = value.toString();
                print(controller.paymentMethod.value);
              },
            ),
          ),
          Obx(
            () => RadioListTile(
              activeColor: Colors.blue,
              title: Text(
                "OVO",
                style: GoogleFonts.poppins(color: Colors.white),
              ),
              value: "OVO",
              groupValue: controller.paymentMethod.value,
              onChanged: (value) {
                controller.paymentMethod.value = value.toString();
                print(controller.paymentMethod.value);
              },
            ),
          ),
          Obx(
            () => RadioListTile(
              activeColor: Colors.blue,
              title: Text(
                "Amazon Pay",
                style: GoogleFonts.poppins(color: Colors.white),
              ),
              value: "AmazonPay",
              groupValue: controller.paymentMethod.value,
              onChanged: (value) {
                controller.paymentMethod.value = value.toString();
                print(controller.paymentMethod.value);
              },
            ),
          ),
          Obx(
            () => RadioListTile(
              activeColor: Colors.blue,
              title: Text(
                "GoPay",
                style: GoogleFonts.poppins(color: Colors.white),
              ),
              value: "GoPay",
              groupValue: controller.paymentMethod.value,
              onChanged: (value) {
                controller.paymentMethod.value = value.toString();
                print(controller.paymentMethod.value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
