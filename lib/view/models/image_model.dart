// To parse this JSON data, do
//
//     final imageModel = imageModelFromJson(jsonString);

import 'dart:convert';

ImageModel imageModelFromJson(String str) => ImageModel.fromJson(json.decode(str));

String imageModelToJson(ImageModel data) => json.encode(data.toJson());

class ImageModel {
    List<Item> data;

    ImageModel({
        required this.data,
    });

    factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        data: List<Item>.from(json["data"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Item {
    String uri;

    Item({
        required this.uri,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        uri: json["uri"],
    );

    Map<String, dynamic> toJson() => {
        "uri": uri,
    };
}
