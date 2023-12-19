// To parse this JSON data, do
//
//     final itemModel = itemModelFromJson(jsonString);

import 'dart:convert';

List<ItemModel> itemModelFromJson(String str) => List<ItemModel>.from(json.decode(str).map((x) => ItemModel.fromJson(x)));

String itemModelToJson(List<ItemModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemModel {
    ItemModelKind kind;
    String etag;
    String id;
    Snippet snippet;
    ContentDetails contentDetails;

    ItemModel({
        required this.kind,
        required this.etag,
        required this.id,
        required this.snippet,
        required this.contentDetails,
    });

    factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        kind: itemModelKindValues.map[json["kind"]]!,
        etag: json["etag"],
        id: json["id"],
        snippet: Snippet.fromJson(json["snippet"]),
        contentDetails: ContentDetails.fromJson(json["contentDetails"]),
    );

    Map<String, dynamic> toJson() => {
        "kind": itemModelKindValues.reverse[kind],
        "etag": etag,
        "id": id,
        "snippet": snippet.toJson(),
        "contentDetails": contentDetails.toJson(),
    };
}

class ContentDetails {
    String videoId;
    DateTime videoPublishedAt;

    ContentDetails({
        required this.videoId,
        required this.videoPublishedAt,
    });

    factory ContentDetails.fromJson(Map<String, dynamic> json) => ContentDetails(
        videoId: json["videoId"],
        videoPublishedAt: DateTime.parse(json["videoPublishedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "videoId": videoId,
        "videoPublishedAt": videoPublishedAt.toIso8601String(),
    };
}

enum ItemModelKind {
    YOUTUBE_PLAYLIST_ITEM
}

final itemModelKindValues = EnumValues({
    "youtube#playlistItem": ItemModelKind.YOUTUBE_PLAYLIST_ITEM
});

class Snippet {
    DateTime publishedAt;
    String channelId;
    String title;
    String description;
    Thumbnails thumbnails;
    String channelTitle;
    String playlistId;
    int position;
    ResourceId resourceId;
    String videoOwnerChannelTitle;
    String videoOwnerChannelId;

    Snippet({
        required this.publishedAt,
        required this.channelId,
        required this.title,
        required this.description,
        required this.thumbnails,
        required this.channelTitle,
        required this.playlistId,
        required this.position,
        required this.resourceId,
        required this.videoOwnerChannelTitle,
        required this.videoOwnerChannelId,
    });

    factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
        publishedAt: DateTime.parse(json["publishedAt"]),
        channelId: json["channelId"],
        title: json["title"],
        description: json["description"],
        thumbnails: Thumbnails.fromJson(json["thumbnails"]),
        channelTitle: json["channelTitle"],
        playlistId: json["playlistId"],
        position: json["position"],
        resourceId: ResourceId.fromJson(json["resourceId"]),
        videoOwnerChannelTitle:json["videoOwnerChannelTitle"],
        videoOwnerChannelId: json["videoOwnerChannelId"],
    );

    Map<String, dynamic> toJson() => {
        "publishedAt": publishedAt.toIso8601String(),
        "channelId": channelId,
        "title": title,
        "description": description,
        "thumbnails": thumbnails.toJson(),
        "channelTitle": channelTitle,
        "playlistId": playlistId,
        "position": position,
        "resourceId": resourceId.toJson(),
        "videoOwnerChannelTitle": videoOwnerChannelTitle,
        "videoOwnerChannelId": videoOwnerChannelId,
    };
}

// enum ChannelId {
//     UCML9_A_PP_HWIG_TRB_JRX_9_B1_UW
// }

// final channelIdValues = EnumValues({
//     "UCML9aPPHwigTRBJrx-9b1Uw": ChannelId.UCML9_A_PP_HWIG_TRB_JRX_9_B1_UW
// });

// enum ChannelTitle {
//     SOHAN_RAJ_TATER
// }

// final channelTitleValues = EnumValues({
//     "SohanRaj Tater": ChannelTitle.SOHAN_RAJ_TATER
// });

// enum PlaylistId {
//     PLT24_UX_HW_KU3_G9_F_CQ2_OQ3_NT7_V_KZZ_YZ6_CB
// }

// final playlistIdValues = EnumValues({
//     "PLT24UxHwKu3G9f-Cq2OQ3nt7vKzzYZ6Cb": PlaylistId.PLT24_UX_HW_KU3_G9_F_CQ2_OQ3_NT7_V_KZZ_YZ6_CB
// });

class ResourceId {
    String kind;
    String videoId;

    ResourceId({
        required this.kind,
        required this.videoId,
    });

    factory ResourceId.fromJson(Map<String, dynamic> json) => ResourceId(
        kind: json["kind"]??'',
        videoId: json["videoId"]??'',
    );

    Map<String, dynamic> toJson() => {
        "kind": kind,
        "videoId": videoId,
    };
}

// enum ResourceIdKind {
//     YOUTUBE_VIDEO
// }

// final resourceIdKindValues = EnumValues({
//     "youtube#video": ResourceIdKind.YOUTUBE_VIDEO
// });

class Thumbnails {
    Default thumbnailsDefault;
    Default medium;
    Default high;
    Default? standard;
    Default? maxres;

    Thumbnails({
        required this.thumbnailsDefault,
        required this.medium,
        required this.high,
        this.standard,
        this.maxres,
    });

    factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
        thumbnailsDefault: Default.fromJson(json["default"]),
        medium: Default.fromJson(json["medium"]),
        high: Default.fromJson(json["high"]),
        standard: json["standard"] == null ? null : Default.fromJson(json["standard"]),
        maxres: json["maxres"] == null ? null : Default.fromJson(json["maxres"]),
    );

    Map<String, dynamic> toJson() => {
        "default": thumbnailsDefault.toJson(),
        "medium": medium.toJson(),
        "high": high.toJson(),
        "standard": standard?.toJson(),
        "maxres": maxres?.toJson(),
    };
}

class Default {
    String url;
    int width;
    int height;

    Default({
        required this.url,
        required this.width,
        required this.height,
    });

    factory Default.fromJson(Map<String, dynamic> json) => Default(
        url: json["url"],
        width: json["width"],
        height: json["height"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
