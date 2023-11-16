import 'dart:convert';

List<Games> gamesFromJson(String str) =>
    List<Games>.from(json.decode(str).map((x) => Games.fromJson(x)));

String gamesToJson(List<Games> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Games {
  int? appId;
  String? gameName;
  String? category;
  int? requiredAge;
  int? isFree;
  String? detailedDescription;
  String? headerImageUrl;
  Ers? developers;
  Ers? publishers;
  String? currency; // Change the type to String
  int? initialPrice;
  int? discountPercent;
  DateTime? releaseDate;

  Games({
    required this.appId,
    required this.gameName,
    required this.category,
    required this.requiredAge,
    required this.isFree,
    required this.detailedDescription,
    required this.headerImageUrl,
    required this.developers,
    required this.publishers,
    required this.currency,
    required this.initialPrice,
    required this.discountPercent,
    required this.releaseDate,
  });

  factory Games.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return Games(
        appId: null,
        gameName: null,
        category: null,
        requiredAge: null,
        isFree: null,
        detailedDescription: null,
        headerImageUrl: null,
        developers: null,
        publishers: null,
        currency: null,
        initialPrice: null,
        discountPercent: null,
        releaseDate: null,
      );
    }

    return Games(
      appId: json["app_id"] as int?,
      gameName: json["game_name"] as String?,
      category: json["category"] as String?,
      requiredAge: json["required_age"] as int?,
      isFree: json["is_free"] as int?,
      detailedDescription: json["detailed_description"] as String?,
      headerImageUrl: json["header_image_url"] as String?,
      developers: ersValues.map[json["developers"]] as Ers?,
      publishers: ersValues.map[json["publishers"]] as Ers?,
      currency: json["currency"] as String?, // Update currency field
      initialPrice: json["initial_price"] as int?,
      discountPercent: json["discount_percent"] as int?,
      releaseDate: json["release_date"] != null
          ? DateTime.parse(json["release_date"].toString())
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        "app_id": appId,
        "game_name": gameName,
        "category": category,
        "required_age": requiredAge,
        "is_free": isFree,
        "detailed_description": detailedDescription,
        "header_image_url": headerImageUrl,
        "developers":
            developers != null ? ersValues.reverse[developers!] : null,
        "publishers":
            publishers != null ? ersValues.reverse[publishers!] : null,
        "currency": currency, // Update currency field
        "initial_price": initialPrice,
        "discount_percent": discountPercent,
        "release_date": releaseDate != null
            ? "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}"
            : null,
      };
}

enum Currency { IDR }

enum Ers { GEARBOX_SOFTWARE, VALVE }

final currencyValues = EnumValues({"IDR": Currency.IDR});
final ersValues =
    EnumValues({"Gearbox Software": Ers.GEARBOX_SOFTWARE, "Valve": Ers.VALVE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
