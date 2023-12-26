// To parse this JSON data, do
//
//     final awardModel = awardModelFromJson(jsonString);

import 'dart:convert';

AwardModel awardModelFromJson(String str) => AwardModel.fromJson(json.decode(str));

String awardModelToJson(AwardModel data) => json.encode(data.toJson());

class AwardModel {
    List<Datum> data;

    AwardModel({
        required this.data,
    });

    factory AwardModel.fromJson(Map<String, dynamic> json) => AwardModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String title;
    String href;

    Datum({
        required this.title,
        required this.href,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        title: json["title"]??'',
        href: json["href"]??'',
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "href": href,
    };
}
