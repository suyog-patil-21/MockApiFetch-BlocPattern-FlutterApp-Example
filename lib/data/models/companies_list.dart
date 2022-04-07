// To parse this JSON data, do
//
//     final companiesList = companiesListFromJson(jsonString);

import 'dart:convert';

CompaniesListModel companiesListFromJson(String str) =>
    CompaniesListModel.fromMap(json.decode(str));

String companiesListToJson(CompaniesListModel data) =>
    json.encode(data.toJson());

class CompaniesListModel {
  CompaniesListModel({
    required this.companiesList,
  });

  final List<CompaniesListElement> companiesList;

  factory CompaniesListModel.fromMap(Map<String, dynamic> json) =>
      CompaniesListModel(
        companiesList: List<CompaniesListElement>.from(
            json["companiesList"].map((x) => CompaniesListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "companiesList":
            List<dynamic>.from(companiesList.map((x) => x.toJson())),
      };
}

class CompaniesListElement {
  CompaniesListElement({
    required this.name,
    required this.company,
    required this.role,
    required this.verified,
    required this.status,
    required this.companyImageUrl,
  });

  final String name;
  final String company;
  final String role;
  final bool verified;
  final String status;
  final String companyImageUrl;

  factory CompaniesListElement.fromJson(Map<String, dynamic> json) =>
      CompaniesListElement(
        name: json["name"],
        company: json["company"],
        role: json["role"],
        verified: json["verified"],
        status: json["status"],
        companyImageUrl: json["companyImageURL"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "company": company,
        "role": role,
        "verified": verified,
        "status": status,
        "companyImageURL": companyImageUrl,
      };
}
