// To parse this JSON data, do
//
//     final myOrdersResponse = myOrdersResponseFromJson(jsonString);

import 'dart:convert';

MyOrdersResponse myOrdersResponseFromJson(String str) => MyOrdersResponse.fromJson(json.decode(str));

String myOrdersResponseToJson(MyOrdersResponse data) => json.encode(data.toJson());

class MyOrdersResponse {
  MyOrdersResponse({
    required this.statusCode,
    required this.data,
  });

  int statusCode;
  Data data;

  factory MyOrdersResponse.fromJson(Map<String, dynamic> json) => MyOrdersResponse(
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
    required this.open,
    required this.closed,
  });

  List<Open> open;
  List<dynamic> closed;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    open: List<Open>.from(json["open"].map((x) => Open.fromJson(x))),
    closed: List<dynamic>.from(json["closed"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "open": List<dynamic>.from(open.map((x) => x.toJson())),
    "closed": List<dynamic>.from(closed.map((x) => x)),
  };
}

class Open {
  Open({
    required this.id,
    required this.orderNo,
    required this.caseStatus,
    required this.service_name,
  });

  int id;
  String orderNo;
  int caseStatus;
  String service_name;

  factory Open.fromJson(Map<String, dynamic> json) => Open(
    id: json["id"],
    orderNo: json["order_no"],
    caseStatus: json["case_status"],
    service_name: json["service_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "order_no": orderNo,
    "case_status": caseStatus,
    "service_name": service_name,
  };
}
