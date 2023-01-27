import 'dart:convert';

Error errorFromJson(String str) => Error.fromJson(json.decode(str));

String errorToJson(Error data) => json.encode(data.toJson());

class Error {
  Error({
    required this.statusCode,
    required this.error,
  });

  int statusCode;
  String error;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    statusCode: json["status_code"],
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "error": error,
  };
}