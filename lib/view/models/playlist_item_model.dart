// To parse this JSON data, do
//
//     final playlistItemModel = playlistItemModelFromJson(jsonString);

import 'dart:convert';

PlaylistItemModel playlistItemModelFromJson(String str) =>
    PlaylistItemModel.fromJson(json.decode(str));

String playlistItemModelToJson(PlaylistItemModel data) =>
    json.encode(data.toJson());

class PlaylistItemModel {
  String kind;
  String etag;
  String nextPageToken;
  List<Item> items;
  PageInfo pageInfo;

  PlaylistItemModel({
    required this.kind,
    required this.etag,
    required this.nextPageToken,
    required this.items,
    required this.pageInfo,
  });

  factory PlaylistItemModel.fromJson(Map<String, dynamic> json) =>
      PlaylistItemModel(
        kind: json["kind"],
        etag: json["etag"],
        nextPageToken: json["nextPageToken"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        pageInfo: PageInfo.fromJson(json["pageInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "nextPageToken": nextPageToken,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "pageInfo": pageInfo.toJson(),
      };
}

class Item {
  String kind;
  String etag;
  String id;
  Snippet snippet;
 // ContentDetails contentDetails;

  Item({
    required this.kind,
    required this.etag,
    required this.id,
    required this.snippet,
  //  required this.contentDetails,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        kind: json["kind"] ?? '',
        etag: json["etag"],
        id: json["id"],
        snippet: Snippet.fromJson(json["snippet"]),
   //     contentDetails: ContentDetails.fromJson(json["contentDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "id": id,
        "snippet": snippet.toJson(),
      //  "contentDetails": contentDetails.toJson(),
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

enum ItemKind { YOUTUBE_PLAYLIST_ITEM }

// final itemKindValues = EnumValues({
//     "youtube#playlistItem": ItemKind.YOUTUBE_PLAYLIST_ITEM
// });

class Snippet {
  // DateTime publishedAt;
  // String channelId;
  String title;
  String description;
  Thumbnails thumbnails;
  // String channelTitle;
  // String playlistId;
  // int position;
  ResourceId resourceId;
  // String videoOwnerChannelTitle;
  // String videoOwnerChannelId;

  Snippet({
    // required this.publishedAt,
    // required this.channelId,
    required this.title,
    required this.description,
    required this.thumbnails,
    // required this.channelTitle,
    // required this.playlistId,
    // required this.position,
    required this.resourceId,
    // required this.videoOwnerChannelTitle,
    // required this.videoOwnerChannelId,
  });

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
        // publishedAt: DateTime.parse(json["publishedAt"]),
        // channelId: json["channelId"]??"",
        title: json["title"],
        description: json["description"],
        thumbnails: Thumbnails.fromJson(json["thumbnails"]),
        // channelTitle: json["channelTitle"]??'',
        // playlistId:json["playlistId"]??'',
        // position: json["position"],
        resourceId: ResourceId.fromJson(json["resourceId"]),
        // videoOwnerChannelTitle:
        //    json["videoOwnerChannelTitle"]??'',
        // videoOwnerChannelId: json["videoOwnerChannelId"]??'',
      );

  Map<String, dynamic> toJson() => {
        // "publishedAt": publishedAt.toIso8601String(),
        // "channelId": channelId,
        "title": title,
        "description": description,
        "thumbnails": thumbnails.toJson(),
        // "channelTitle": channelTitle,
        // "playlistId":playlistId,
        // "position": position,
        // "resourceId": resourceId.toJson(),
        // "videoOwnerChannelTitle":
        //     videoOwnerChannelTitle,
        // "videoOwnerChannelId": videoOwnerChannelId,
      };
}

// enum ChannelId { UCML9_A_PP_HWIG_TRB_JRX_9_B1_UW }

// final channelIdValues = EnumValues(
//     {"UCML9aPPHwigTRBJrx-9b1Uw": ChannelId.UCML9_A_PP_HWIG_TRB_JRX_9_B1_UW});

// enum ChannelTitle { SOHAN_RAJ_TATER }

// final channelTitleValues =
//     EnumValues({"SohanRaj Tater": ChannelTitle.SOHAN_RAJ_TATER});

// enum PlaylistId { PLT24_UX_HW_KU3_ENM_F_PLZ_P_UCJQ_QD_ND_ZZ4_K_JD }

// final playlistIdValues = EnumValues({
//   "PLT24UxHwKu3EnmFPlzPUcjqQdNdZZ4kJD":
//       PlaylistId.PLT24_UX_HW_KU3_ENM_F_PLZ_P_UCJQ_QD_ND_ZZ4_K_JD
// });

class ResourceId {
  String kind;
  String videoId;

  ResourceId({
    required this.kind,
    required this.videoId,
  });

  factory ResourceId.fromJson(Map<String, dynamic> json) => ResourceId(
        kind: json["kind"] ?? "",
        videoId: json["videoId"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "videoId": videoId,
      };
}

// final resourceIdKindValues = EnumValues({
//     "youtube#video": ResourceIdKind.YOUTUBE_VIDEO
// });

class Thumbnails {
  Default thumbnailsDefault;
  Default medium;
  Default high;
  Default standard;
  Default maxres;

  Thumbnails({
    required this.thumbnailsDefault,
    required this.medium,
    required this.high,
    required this.standard,
    required this.maxres,
  });

  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
        thumbnailsDefault: Default.fromJson(json["default"]),
        medium: Default.fromJson(json["medium"]),
        high: Default.fromJson(json["high"]),
        standard: Default.fromJson(json["standard"]),
        maxres: Default.fromJson(json["maxres"]),
      );

  Map<String, dynamic> toJson() => {
        "default": thumbnailsDefault.toJson(),
        "medium": medium.toJson(),
        "high": high.toJson(),
        "standard": standard.toJson(),
        "maxres": maxres.toJson(),
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
        url: json["url"] ?? "",
        width: json["width"] ?? '',
        height: json["height"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
      };
}

class PageInfo {
  int totalResults;
  int resultsPerPage;

  PageInfo({
    required this.totalResults,
    required this.resultsPerPage,
  });

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
        totalResults: json["totalResults"] ?? "",
        resultsPerPage: json["resultsPerPage"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "totalResults": totalResults,
        "resultsPerPage": resultsPerPage,
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
