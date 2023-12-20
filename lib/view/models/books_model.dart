// To parse this JSON data, do
//
//     final booksModel = booksModelFromJson(jsonString);

import 'dart:convert';

BooksModel booksModelFromJson(String str) => BooksModel.fromJson(json.decode(str));

String booksModelToJson(BooksModel data) => json.encode(data.toJson());

class BooksModel {
    List<Item> data;

    BooksModel({
        required this.data,
    });

    factory BooksModel.fromJson(Map<String, dynamic> json) => BooksModel(
        data: List<Item>.from(json["data"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Item {
    String href;
    String title;
    String frontCover;

    Item({
        required this.href,
        required this.title,
        required this.frontCover,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        href: json["href"],
        title: json["title"],
        frontCover: json["frontCover"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
        "title": title,
        "frontCover": frontCover,
    };
}
