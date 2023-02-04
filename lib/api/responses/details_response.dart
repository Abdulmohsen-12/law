// To parse this JSON data, do
//
//     final detailsResponse = detailsResponseFromJson(jsonString);

import 'dart:convert';

DetailsResponse detailsResponseFromJson(String str) => DetailsResponse.fromJson(json.decode(str));

String detailsResponseToJson(DetailsResponse data) => json.encode(data.toJson());

class DetailsResponse {
  DetailsResponse({
    required this.statusCode,
    required this.data,
  });

  int statusCode;
  Data data;

  factory DetailsResponse.fromJson(Map<String, dynamic> json) => DetailsResponse(
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
    required this.details,
  });

  String details;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    details: json["details"],
  );

  Map<String, dynamic> toJson() => {
    "details": details,
  };
}
