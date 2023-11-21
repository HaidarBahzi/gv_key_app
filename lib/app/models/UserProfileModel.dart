import 'dart:convert';

List<Userprofile> userprofileFromJson(String str) => List<Userprofile>.from(
    json.decode(str).map((x) => Userprofile.fromJson(x)));

String userprofileToJson(List<Userprofile> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Userprofile {
  int userId;
  String userName;
  String userEmail;
  String userPassword;
  int isVerified;
  int isBlocked;

  Userprofile({
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.userPassword,
    required this.isVerified,
    required this.isBlocked,
  });

  factory Userprofile.fromJson(Map<String, dynamic> json) => Userprofile(
        userId: json["user_id"],
        userName: json["user_name"],
        userEmail: json["user_email"],
        userPassword: json["user_password"],
        isVerified: json["is_verified"],
        isBlocked: json["is_blocked"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_name": userName,
        "user_email": userEmail,
        "user_password": userPassword,
        "is_verified": isVerified,
        "is_blocked": isBlocked,
      };
}
