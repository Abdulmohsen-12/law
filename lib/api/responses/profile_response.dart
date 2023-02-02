// To parse this JSON data, do
//
//     final profileResponse = profileResponseFromJson(jsonString);

import 'dart:convert';

ProfileResponse profileResponseFromJson(String str) => ProfileResponse.fromJson(json.decode(str));

String profileResponseToJson(ProfileResponse data) => json.encode(data.toJson());

class ProfileResponse {
  ProfileResponse({
    required this.statusCode,
    required this.data,
  });

  int statusCode;
  Data data;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) => ProfileResponse(
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
    required this.userInfo,
  });

  UserInfo userInfo;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userInfo: UserInfo.fromJson(json["user_info"]),
  );

  Map<String, dynamic> toJson() => {
    "user_info": userInfo.toJson(),
  };
}

class UserInfo {
  UserInfo({
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

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
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
