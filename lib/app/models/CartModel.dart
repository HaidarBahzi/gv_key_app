import 'dart:convert';

List<Cart> cartFromJson(String str) =>
    List<Cart>.from(json.decode(str).map((x) => Cart.fromJson(x)));

String cartToJson(List<Cart> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cart {
  int cartId;
  String cartUser;
  int productInfoAppId;
  String productInfoGameName;
  String productInfoCategory;
  String productInfoHeaderImageUrl;

  Cart({
    required this.cartId,
    required this.cartUser,
    required this.productInfoAppId,
    required this.productInfoGameName,
    required this.productInfoCategory,
    required this.productInfoHeaderImageUrl,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        cartId: json["cart_id"],
        cartUser: json["cart_user"],
        productInfoAppId: json["PRODUCT_INFO.app_id"],
        productInfoGameName: json["PRODUCT_INFO.game_name"],
        productInfoCategory: json["PRODUCT_INFO.category"],
        productInfoHeaderImageUrl: json["PRODUCT_INFO.header_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "cart_id": cartId,
        "cart_user": cartUser,
        "PRODUCT_INFO.app_id": productInfoAppId,
        "PRODUCT_INFO.game_name": productInfoGameName,
        "PRODUCT_INFO.category": productInfoCategory,
        "PRODUCT_INFO.header_image_url": productInfoHeaderImageUrl,
      };
}
