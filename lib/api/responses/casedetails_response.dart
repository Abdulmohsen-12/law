// To parse this JSON data, do
//
//     final caseDetailsResponse = caseDetailsResponseFromJson(jsonString);

import 'dart:convert';

CaseDetailsResponse caseDetailsResponseFromJson(String str) => CaseDetailsResponse.fromJson(json.decode(str));

String caseDetailsResponseToJson(CaseDetailsResponse data) => json.encode(data.toJson());

class CaseDetailsResponse {
  CaseDetailsResponse({
    required this.statusCode,
    required this.data,
  });

  int statusCode;
  Data data;

  factory CaseDetailsResponse.fromJson(Map<String, dynamic> json) => CaseDetailsResponse(
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
    required this.id,
    required this.uid,
    required this.orderNo,
    required this.serviceName,
    required this.serviceCategory,
    required this.clientName,
    required this.purpouse,
    required this.contractTerm,
    required this.contractAmmount,
    required this.deadline,
    this.caseVoice,
    required this.documentDetails,
    this.capacity,
    this.against,
    this.capacity2,
    this.paymentId,
    this.courtLocation,
    this.expertLocation,
    this.chamber,
    this.room,
    this.automatedNo,
    this.courtCaseNo,
    required this.details,
    required this.caseStatus,
    // required this.createTime,
  });

  int id;
  int uid;
  String orderNo;
  String serviceName;
  int serviceCategory;
  String? clientName;
  String?purpouse;
  String? contractTerm;
  String? contractAmmount;
  String? deadline;
  dynamic caseVoice;
  String? documentDetails;
  dynamic capacity;
  dynamic against;
  dynamic capacity2;
  dynamic paymentId;
  dynamic courtLocation;
  dynamic expertLocation;
  dynamic chamber;
  dynamic room;
  dynamic automatedNo;
  dynamic courtCaseNo;
  String? details;
  int caseStatus;
  // DateTime createTime;


  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    uid: json["uid"],
    orderNo: json["order_no"],
    serviceName: json["service_name"],
    serviceCategory: json["service_category"],
    clientName: json["client_name"],
    purpouse: json["purpouse"],
    contractTerm: json["contract_term"],
    contractAmmount: json["contract_ammount"],
    deadline: json["deadline"],
    caseVoice: json["case_voice"],
    documentDetails: json["document_details"],
    capacity: json["capacity"],
    against: json["against"],
    capacity2: json["capacity2"],
    paymentId: json["payment_id"],
    courtLocation: json["court_location"],
    expertLocation: json["expert_location"],
    chamber: json["chamber"],
    room: json["room"],
    automatedNo: json["automated_no"],
    courtCaseNo: json["court_case_no"],
    details: json["details"],
    caseStatus: json["case_status"],
    // createTime: DateTime.parse(json["create_time"]),

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "uid": uid,
    "order_no": orderNo,
    "service_name": serviceName,
    "service_category": serviceCategory,
    "client_name": clientName,
    "purpouse": purpouse,
    "contract_term": contractTerm,
    "contract_ammount": contractAmmount,
    "deadline": deadline,
    "case_voice": caseVoice,
    "document_details": documentDetails,
    "capacity": capacity,
    "against": against,
    "capacity2": capacity2,
    "payment_id": paymentId,
    "court_location": courtLocation,
    "expert_location": expertLocation,
    "chamber": chamber,
    "room": room,
    "automated_no": automatedNo,
    "court_case_no": courtCaseNo,
    "details": details,
    "case_status": caseStatus,
    // "create_time": createTime.toIso8601String(),

  };
}
