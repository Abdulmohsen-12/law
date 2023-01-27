import 'dart:convert';

SucceededResponse succeededResponseFromJson(String str) => SucceededResponse.fromJson(json.decode(str));

String succeededResponseToJson(SucceededResponse data) => json.encode(data.toJson());

class SucceededResponse {
  SucceededResponse({
    required this.status_code,
    required this.message,
  });
  int status_code;
  String message;



  factory SucceededResponse.fromJson(Map<String, dynamic> json) => SucceededResponse(
    status_code: json["status_code"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status_code": status_code,
    "message": message,
  };
}