// To parse this JSON data, do
//
//     final contractdraft = contractdraftFromJson(jsonString);

import 'dart:convert';

Contractdraft contractdraftFromJson(String str) => Contractdraft.fromJson(json.decode(str));

String contractdraftToJson(Contractdraft data) => json.encode(data.toJson());

class Contractdraft {
  Contractdraft({
    required this.statusCode,
    required this.data,
    required this.message,
  });

  int statusCode;
  Data data;
  String message;

  factory Contractdraft.fromJson(Map<String, dynamic> json) => Contractdraft(
    statusCode: json["status_code"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  Data({
    required this.caseId,
  });

  int caseId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    caseId: json["case_id"],
  );

  Map<String, dynamic> toJson() => {
    "case_id": caseId,
  };
}
