// // To parse this JSON data, do
// //
// //     final welcome = welcomeFromJson(jsonString);
//
// import 'dart:convert';
//
// Login lognFromJson(String str) => Login.fromJson(json.decode(str));
//
// String loginToJson(Login data) => json.encode(data.toJson());
//
// class Login {
//   Login({
//     required this.statusCode,
//     required this.data,
//   });
//
//   int statusCode;
//   Data data;
//
//   factory Login.fromJson(Map<String, dynamic> json) => Login(
//     statusCode: json["status_code"],
//     data: Data.fromJson(json["data"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status_code": statusCode,
//     "data": data.toJson(),
//   };
// }
//
// class Data {
//   Data({
//     required this.accessToken,
//     required this.tokenType,
//     required this.expiresIn,
//     required this.user,
//   });
//
//   String accessToken;
//   String tokenType;
//   int expiresIn;
//   User user;
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     accessToken: json["access_token"],
//     tokenType: json["token_type"],
//     expiresIn: json["expires_in"],
//     user: User.fromJson(json["user"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "access_token": accessToken,
//     "token_type": tokenType,
//     "expires_in": expiresIn,
//     "user": user.toJson(),
//   };
// }
//
// class User {
//   User({
//     required this.id,
//     required this.name,
//     required this.accountType,
//     required this.email,
//     required this.userType,
//     required  this.loginType,
//     required   this.phoneNo,
//     this.photo,
//     this.photoUrl,
//     this.socialEmail,
//     this.dob,
//     this.gender,
//     required this.balance,
//     this.notes,
//   });
//
//   int id;
//   String name;
//   int accountType;
//   String email;
//   int userType;
//   int loginType;
//   String phoneNo;
//   dynamic photo;
//   dynamic photoUrl;
//   dynamic socialEmail;
//   dynamic dob;
//   dynamic gender;
//   int balance;
//   dynamic notes;
//
//   factory User.fromJson(Map<String, dynamic> json) => User(
//     id: json["id"],
//     name: json["name"],
//     accountType: json["account_type"],
//     email: json["email"],
//     userType: json["user_type"],
//     loginType: json["login_type"],
//     phoneNo: json["phone_no"],
//     photo: json["photo"],
//     photoUrl: json["photo_url"],
//     socialEmail: json["social_email"],
//     dob: json["DOB"],
//     gender: json["gender"],
//     balance: json["balance"],
//     notes: json["notes"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "account_type": accountType,
//     "email": email,
//     "user_type": userType,
//     "login_type": loginType,
//     "phone_no": phoneNo,
//     "photo": photo,
//     "photo_url": photoUrl,
//     "social_email": socialEmail,
//     "DOB": dob,
//     "gender": gender,
//     "balance": balance,
//     "notes": notes,
//   };
// }
// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    required this.statusCode,
    required this.data,
  });

  int statusCode;
  Data data;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    statusCode: json["status_code"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.user,
  });

  String accessToken;
  String tokenType;
  int expiresIn;
  User user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    accessToken: json["access_token"],
    tokenType: json["token_type"],
    expiresIn: json["expires_in"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "token_type": tokenType,
    "expires_in": expiresIn,
    "user": user.toJson(),
  };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.accountType,
    required this.email,
    required this.userType,
    required this.loginType,
    required this.phoneNo,
    this.photo,
    this.photoUrl,
    this.socialEmail,
    required this.dob,
    required this.gender,
    required this.balance,
    this.notes,
    this.otherInfo,
  });

  String id;
  String name;
  int accountType;
  String email;
  int userType;
  int loginType;
  String phoneNo;
  dynamic photo;
  dynamic photoUrl;
  dynamic socialEmail;
  DateTime dob;
  String gender;
  int balance;
  dynamic notes;
  dynamic otherInfo;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    accountType: json["account_type"],
    email: json["email"],
    userType: json["user_type"],
    loginType: json["login_type"],
    phoneNo: json["phone_no"],
    photo: json["photo"],
    photoUrl: json["photo_url"],
    socialEmail: json["social_email"],
    dob: DateTime.parse(json["DOB"]),
    gender: json["gender"],
    balance: json["balance"],
    notes: json["notes"],
    otherInfo: json["other_info"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "account_type": accountType,
    "email": email,
    "user_type": userType,
    "login_type": loginType,
    "phone_no": phoneNo,
    "photo": photo,
    "photo_url": photoUrl,
    "social_email": socialEmail,
    "DOB": dob.toIso8601String(),
    "gender": gender,
    "balance": balance,
    "notes": notes,
    "other_info": otherInfo,
  };
}
