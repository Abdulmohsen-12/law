import 'dart:convert';

statuscode errorcodeFromJson(String str) => statuscode.fromJson(json.decode(str));

String errorcodeToJson(statuscode data) => json.encode(data.toJson());

class statuscode {
  statuscode({
    required this.statusCode,
  });

  int statusCode;

  factory statuscode.fromJson(Map<String, dynamic> json) => statuscode(
    statusCode: json["status_code"],
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
  };
}