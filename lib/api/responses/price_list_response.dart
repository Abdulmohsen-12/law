// To parse this JSON data, do
//
//     final priceListResponse = priceListResponseFromJson(jsonString);

import 'dart:convert';

PriceListResponse priceListResponseFromJson(String str) => PriceListResponse.fromJson(json.decode(str));

String priceListResponseToJson(PriceListResponse data) => json.encode(data.toJson());

class PriceListResponse {
  PriceListResponse({
    required this.statusCode,
    required this.data,
  });

  int statusCode;
  List<Datum> data;

  factory PriceListResponse.fromJson(Map<String, dynamic> json) => PriceListResponse(
    statusCode: json["status_code"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.price,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String name;
  int price;
  String type;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    type: json["type"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "type": type,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
