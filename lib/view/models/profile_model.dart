// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
    List<ProfileItem> data;

    ProfileModel({
        required this.data,
    });

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        data: List<ProfileItem>.from(json["data"].map((x) => ProfileItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class ProfileItem {
    String number;
    String title;
    String href;

    ProfileItem({
        required this.number,
        required this.title,
        required this.href,
    });

    factory ProfileItem.fromJson(Map<String, dynamic> json) => ProfileItem(
        number: json["number"]??'',
        title: json["title"]??'',
        href: json["href"]??'',
    );

    Map<String, dynamic> toJson() => {
        "number": number,
        "title": title,
        "href": href,
    };
}
