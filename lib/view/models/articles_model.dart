// To parse this JSON data, do
//
//     final articles = articlesFromJson(jsonString);

import 'dart:convert';

Articles articlesFromJson(String str) => Articles.fromJson(json.decode(str));

String articlesToJson(Articles data) => json.encode(data.toJson());

class Articles {
    List<artItem> data;

    Articles({
        required this.data,
    });

    factory Articles.fromJson(Map<String, dynamic> json) => Articles(
        data: List<artItem>.from(json["data"].map((x) => artItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class artItem {
    String title;
    String disp;
    String href;

    artItem({
        required this.title,
        required this.disp,
        required this.href,
    });

    factory artItem.fromJson(Map<String, dynamic> json) => artItem(
        title: json["title"],
        disp: json["disp"],
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "disp": disp,
        "href": href,
    };
}
