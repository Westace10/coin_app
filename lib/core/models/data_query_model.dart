// To parse this JSON data, do
//
//     final dataQueryModel = dataQueryModelFromJson(jsonString);

import 'dart:convert';

DataQueryModel? dataQueryModelFromJson(String str) =>
    DataQueryModel.fromJson(json.decode(str));

String dataQueryModelToJson(DataQueryModel? data) =>
    json.encode(data!.toJson());

class DataQueryModel {
  DataQueryModel({
    this.meta,
    this.records,
  });

  Map<String, dynamic>? meta;
  List<Record?>? records;

  factory DataQueryModel.fromJson(Map<String, dynamic> json) => DataQueryModel(
        meta: json["meta"],
        records: json["records"] == null
            ? []
            : json["records"] == null
                ? []
                : List<Record?>.from(
                    json["records"]!.map((x) => Record.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta,
        "records": records == null
            ? []
            : records == null
                ? []
                : List<dynamic>.from(records!.map((x) => x!.toJson())),
      };
}

class Meta {
  Meta({
    this.page,
  });

  Page? page;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        page: json["page"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
      };
}

class Page {
  Page({
    this.cursor,
    this.more,
  });

  String? cursor;
  bool? more;

  factory Page.fromJson(Map<String, dynamic> json) => Page(
        cursor: json["cursor"],
        more: json["more"],
      );

  Map<String, dynamic> toJson() => {
        "cursor": cursor,
        "more": more,
      };
}

class Record {
  Record({
    this.address,
    this.bio,
    this.cointag,
    this.email,
    this.firstname,
    this.id,
    this.lastname,
    this.team,
    this.xata,
  });

  Map<String, dynamic>? address;
  String? bio;
  Map<String, dynamic>? cointag;
  String? email;
  String? firstname;
  String? id;
  String? lastname;
  Map<String, dynamic>? team;
  Map<String, dynamic>? xata;

  factory Record.fromJson(Map<String, dynamic> json) => Record(
        address: json["address"],
        bio: json["bio"],
        cointag: json["cointag"],
        email: json["email"],
        firstname: json["firstname"],
        id: json["id"],
        lastname: json["lastname"],
        team: json["team"],
        xata: json["xata"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "bio": bio,
        "cointag": cointag,
        "email": email,
        "firstname": firstname,
        "id": id,
        "lastname": lastname,
        "team": team,
        "xata": xata,
      };
}

class Address {
  Address({
    this.city,
    this.street,
    this.zipcode,
  });

  String? city;
  String? street;
  int? zipcode;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        city: json["city"],
        street: json["street"],
        zipcode: json["zipcode"],
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "street": street,
        "zipcode": zipcode,
      };
}

class Cointag {
  Cointag({
    this.id,
    this.password,
  });

  String? id;
  String? password;

  factory Cointag.fromJson(Map<String, dynamic> json) => Cointag(
        id: json["id"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "password": password,
      };
}

class Team {
  Team({
    this.id,
  });

  String? id;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

class Xata {
  Xata({
    this.version,
  });

  int? version;

  factory Xata.fromJson(Map<String, dynamic> json) => Xata(
        version: json["version"],
      );

  Map<String, dynamic> toJson() => {
        "version": version,
      };
}
