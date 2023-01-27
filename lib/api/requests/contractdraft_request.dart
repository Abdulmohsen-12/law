// To parse this JSON data, do
//
//     final postcontractDraftRequest = postcontractDraftRequestFromJson(jsonString);

import 'dart:convert';

PostcontractDraftRequest? postcontractDraftRequestFromJson(String str) => PostcontractDraftRequest.fromJson(json.decode(str));

String postcontractDraftRequestToJson(PostcontractDraftRequest? data) => json.encode(data!.toJson());

class PostcontractDraftRequest {
  PostcontractDraftRequest({
    this.serviceName,
    this.clientName,
    this.purpose,
    this.details,
    this.deadline,
    this.contractTerm,
  });

  String? serviceName;
  String? clientName;
  String? purpose;
  String? details;
  String? deadline;
  String? contractTerm;

  factory PostcontractDraftRequest.fromJson(Map<String, dynamic> json) => PostcontractDraftRequest(
    serviceName: json["ServiceName"],
    clientName: json["ClientName"],
    purpose: json["Purpose"],
    details: json["Details"],
    deadline: json["Deadline"],
    contractTerm: json["ContractTerm"],
  );

  Map<String, dynamic> toJson() => {
    "ServiceName": serviceName,
    "ClientName": clientName,
    "Purpose": purpose,
    "Details": details,
    "Deadline": deadline,
    "ContractTerm": contractTerm,
  };
}
