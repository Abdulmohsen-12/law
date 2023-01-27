import 'dart:convert';

failureResponse failureResponseFromJson(String str) => failureResponse.fromJson(json.decode(str));

String failureResponseToJson(failureResponse data) => json.encode(data.toJson());

class failureResponse {
  failureResponse({
    required this.error,
    required this.status_code,
  });
  int status_code;
  String error;




  factory failureResponse.fromJson(Map<String, dynamic> json) => failureResponse(
    status_code: json["status_code"],
    error: json["error"],

  );

  Map<String, dynamic> toJson() => {
    "status_code": status_code,
    "error": error,
  };
}