// To parse this JSON data, do
//
//     final playLists = playListsFromJson(jsonString);

import 'dart:convert';

PlayLists playListsFromJson(String str) => PlayLists.fromJson(json.decode(str));

String playListsToJson(PlayLists data) => json.encode(data.toJson());

class PlayLists {
  String kind;
  String etag;
  PageInfo pageInfo;
  List<Item> items;

  PlayLists({
    required this.kind,
    required this.etag,
    required this.pageInfo,
    required this.items,
  });

  factory PlayLists.fromJson(Map<String, dynamic> json) => PlayLists(
        kind: json["kind"],
        etag: json["etag"],
        pageInfo: PageInfo.fromJson(json["pageInfo"]),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "pageInfo": pageInfo.toJson(),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Kind kind;
  String etag;
  String id;
  Snippet snippet;

  Item({
    required this.kind,
    required this.etag,
    required this.id,
    required this.snippet,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        kind: kindValues.map[json["kind"]]!,
        etag: json["etag"],
        id: json["id"],
        snippet: Snippet.fromJson(json["snippet"]),
      );

  Map<String, dynamic> toJson() => {
        "kind": kindValues.reverse[kind],
        "etag": etag,
        "id": id,
        "snippet": snippet.toJson(),
      };
}

enum Kind { YOUTUBE_PLAYLIST }

final kindValues = EnumValues({"youtube#playlist": Kind.YOUTUBE_PLAYLIST});

class Snippet {
  DateTime publishedAt;
  ChannelId? channelId;
  String title;
  String description;
  Thumbnails thumbnails;
  ChannelTitle? channelTitle;
  Localized localized;

  Snippet({
    required this.publishedAt,
    required this.channelId,
    required this.title,
    required this.description,
    required this.thumbnails,
    required this.channelTitle,
    required this.localized,
  });

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
        publishedAt: DateTime.parse(json["publishedAt"]),
        channelId: channelIdValues.map[json["channelId"]],
        title: json["title"],
        description: json["description"],
        thumbnails: Thumbnails.fromJson(json["thumbnails"]),
        channelTitle: channelTitleValues.map[json["channelTitle"]],
        localized: Localized.fromJson(json["localized"]),
      );

  Map<String, dynamic> toJson() => {
        "publishedAt": publishedAt.toIso8601String(),
        "channelId": channelIdValues.reverse[channelId],
        "title": title,
        "description": description,
        "thumbnails": thumbnails.toJson(),
        "channelTitle": channelTitleValues.reverse[channelTitle],
        "localized": localized.toJson(),
      };
}

enum ChannelId { UCML9_A_PP_HWIG_TRB_JRX_9_B1_UW }

final channelIdValues = EnumValues(
    {"UCML9aPPHwigTRBJrx-9b1Uw": ChannelId.UCML9_A_PP_HWIG_TRB_JRX_9_B1_UW});

enum ChannelTitle { SOHAN_RAJ_TATER }

final channelTitleValues =
    EnumValues({"SohanRaj Tater": ChannelTitle.SOHAN_RAJ_TATER});

class Localized {
  String title;
  String description;

  Localized({
    required this.title,
    required this.description,
  });

  factory Localized.fromJson(Map<String, dynamic> json) => Localized(
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
      };
}

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
        standard: json["standard"] == null
            ? null
            : Default.fromJson(json["standard"]),
        maxres:
            json["maxres"] == null ? null : Default.fromJson(json["maxres"]),
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

class PageInfo {
  int totalResults;
  int resultsPerPage;

  PageInfo({
    required this.totalResults,
    required this.resultsPerPage,
  });

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
        totalResults: json["totalResults"],
        resultsPerPage: json["resultsPerPage"],
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
