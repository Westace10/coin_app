// To parse this JSON data, do
//
//     final postsQueryModel = postsQueryModelFromMap(jsonString);

import 'dart:convert';

DataQueryModel? postsQueryModelFromMap(String str) =>
    DataQueryModel.fromMap(json.decode(str));

String postsQueryModelToMap(DataQueryModel? data) => json.encode(data!.toMap());

class DataQueryModel {
  DataQueryModel({
    required this.meta,
    required this.records,
  });

  final Map<String, dynamic>? meta;
  final List<Record?>? records;

  factory DataQueryModel.fromMap(Map<String, dynamic> json) => DataQueryModel(
        meta: json["meta"],
        records: json["records"] == null
            ? []
            : json["records"] == null
                ? []
                : List<Record?>.from(
                    json["records"]!.map((x) => Record.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "meta": meta,
        "records": records == null
            ? []
            : records == null
                ? []
                : List<dynamic>.from(records!.map((x) => x!.toMap())),
      };
}

// class Mettas {
//   Mettas({
//     required this.page,
//   });

//   final Page? page;

//   factory Mettas.fromMap(Map<String, dynamic> json) => Mettas(
//         page: json["page"],
//       );

//   Map<String, dynamic> toMap() => {
//         "page": page,
//       };
// }

class Page {
  Page({
    required this.cursor,
    required this.more,
  });

  final String? cursor;
  final bool? more;

  factory Page.fromMap(Map<String, dynamic> json) => Page(
        cursor: json["cursor"],
        more: json["more"],
      );

  Map<String, dynamic> toMap() => {
        "cursor": cursor,
        "more": more,
      };
}

class Record {
  Record({
    required this.author,
    required this.createdAt,
    required this.id,
    required this.labels,
    required this.slug,
    required this.text,
    required this.title,
    required this.views,
    required this.xata,
  });

  final Map<String, dynamic>? author;
  final String? createdAt;
  final String? id;
  final List<String?>? labels;
  final String? slug;
  final String? text;
  final String? title;
  final int? views;
  final Map<String, dynamic>? xata;

  factory Record.fromMap(Map<String, dynamic> json) => Record(
        author: json["author"],
        createdAt: json["createdAt"],
        id: json["id"],
        labels: json["labels"] == null
            ? []
            : json["labels"] == null
                ? []
                : List<String?>.from(json["labels"]!.map((x) => x)),
        slug: json["slug"],
        text: json["text"],
        title: json["title"],
        views: json["views"],
        xata: json["xata"],
      );

  Map<String, dynamic> toMap() => {
        "author": author,
        "createdAt": createdAt,
        "id": id,
        "labels": labels == null
            ? []
            : labels == null
                ? []
                : List<dynamic>.from(labels!.map((x) => x)),
        "slug": slug,
        "text": text,
        "title": title,
        "views": views,
        "xata": xata,
      };
}

class Author {
  Author({
    required this.id,
  });

  final String? id;

  factory Author.fromMap(Map<String, dynamic> json) => Author(
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
      };
}

class Xata {
  Xata({
    required this.version,
  });

  final int? version;

  factory Xata.fromMap(Map<String, dynamic> json) => Xata(
        version: json["version"],
      );

  Map<String, dynamic> toMap() => {
        "version": version,
      };
}
