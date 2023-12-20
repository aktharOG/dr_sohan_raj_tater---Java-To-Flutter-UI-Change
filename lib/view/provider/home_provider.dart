import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dr_sohan_raj_tater/services/dio_services.dart';
import 'package:dr_sohan_raj_tater/view/models/articles_model.dart';
import 'package:dr_sohan_raj_tater/view/models/award_model.dart';
import 'package:dr_sohan_raj_tater/view/models/books_model.dart';
import 'package:dr_sohan_raj_tater/view/models/image_model.dart';
import 'package:dr_sohan_raj_tater/view/models/item_model.dart';
import 'package:dr_sohan_raj_tater/view/models/play_list_model.dart';
import 'package:dr_sohan_raj_tater/view/models/playlist_item_model.dart';
import 'package:dr_sohan_raj_tater/view/models/profile_model.dart';
import 'package:dr_sohan_raj_tater/view/screens/tabs/home_tab.dart';
import 'package:dr_sohan_raj_tater/view/screens/tabs/knowledge_tab.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeProvider extends ChangeNotifier {
  PlayLists? playLists;
  ProfileModel? profileModel;
  PlaylistItemModel? playlistItemModel;
  Articles? articles;
  BooksModel? booksModel;
  ImageModel? imageModel;
  AwardModel? awardModel;

  List<ItemModel> itemModel = [];
  bool isLoading = false;
  bool isLoadingItem = false;

  int currentIndex = 0;

  List<Widget> tabs = const [Hometab(), KnowledgeTab()];

  onChangeBottomBar(value) {
    currentIndex = value;
    notifyListeners();
  }

  onFetchPlaylists() async {
    log("onFetchPlaylists");

    isLoading = true;
    notifyListeners();
    Response? res = await ApiService.apiMethodSetup(
        method: apiMethod.get,
        url:
            "https://www.googleapis.com/youtube/v3/playlists?part=id%2Csnippet&channelId=UCML9aPPHwigTRBJrx-9b1Uw&maxResults=20&key=AIzaSyDQaXoj4trJO91ufuEiB6Oh3IBp00aVpFA&maxResults=100");

    if (res != null) {
      print(res.data);

      playLists = playListsFromJson(jsonEncode(res.data));
      isLoading = false;
      notifyListeners();
    }
  }

  onFetchProfile() async {
    // log("profile");
    // isLoading = true;
    notifyListeners();
    Response? res = await ApiService.apiMethodSetup(
        method: apiMethod.get,
        url: "http://drsohanrajtater.com/api/profile.php");

    if (res != null) {
      log("ferching profile ..");
      print(res.data);

      profileModel = profileModelFromJson(jsonEncode(jsonDecode(res.data)));
      // profileModel = profileModelFromJson(jsonEncode(res.data));
      isLoading = false;
      notifyListeners();
    }
  }

  onFetchPlaylistItem(playlistID) async {
    log("onPlaylist item : ");
    log("playlist ID : $playlistID");
    isLoadingItem = true;
    notifyListeners();
    Response? res = await ApiService.apiMethodSetup(
      method: apiMethod.get,
      url:
          "https://www.googleapis.com/youtube/v3/playlistItems?key=AIzaSyDQaXoj4trJO91ufuEiB6Oh3IBp00aVpFA&part=snippet%2CcontentDetails&playlistId=$playlistID&maxResults=10",
    );

    if (res != null) {
      //print(res.data);
      //   log(res.data.toString());
      print("Playlist items ; ${res.data["items"].length}");
      itemModel = itemModelFromJson(jsonEncode(res.data["items"]));
      //   playlistItemModel = playlistItemModelFromJson(jsonEncode(res.data));
      // print("total items ; ${playlistItemModel!.items.length}");
      isLoadingItem = false;
      notifyListeners();
    }
  }

  onFetchArticles() async {
    // log("profile");
    // isLoading = true;
    notifyListeners();
    Response? res = await ApiService.apiMethodSetup(
        method: apiMethod.get,
        url: "http://drsohanrajtater.com/api/articles.php?page=0");

    if (res != null) {
      log("ferching articles ..");
      print(res.data);

      articles = articlesFromJson(jsonEncode(jsonDecode(res.data)));
      // profileModel = profileModelFromJson(jsonEncode(res.data));
      isLoading = false;
      notifyListeners();
    }
  }

    onFetchBooks() async {
    // log("profile");
    // isLoading = true;
    notifyListeners();
    Response? res = await ApiService.apiMethodSetup(
        method: apiMethod.get,
        url: "http://drsohanrajtater.com/api/books.php");

    if (res != null) {
      log("ferching articles ..");
      print(res.data);

      booksModel = booksModelFromJson(jsonEncode(jsonDecode(res.data)));
      // profileModel = profileModelFromJson(jsonEncode(res.data));
      isLoading = false;
      notifyListeners();
    }
  }

    onfetchImages() async {
    // log("profile");
    // isLoading = true;
    notifyListeners();
    Response? res = await ApiService.apiMethodSetup(
        method: apiMethod.get,
        url: "http://drsohanrajtater.com/api/imagegallery.php?page=0");

    if (res != null) {
      log("ferching Images ..");
      print(res.data);

      imageModel = imageModelFromJson(jsonEncode(jsonDecode(res.data)));
      // profileModel = profileModelFromJson(jsonEncode(res.data));
      isLoading = false;
      notifyListeners();
    }
  }

   onFetchAwards() async {
    // log("profile");
    // isLoading = true;
    notifyListeners();
    Response? res = await ApiService.apiMethodSetup(
        method: apiMethod.get,
        url: "http://drsohanrajtater.com/api/award.php");

    if (res != null) {
      log("ferching Images ..");
      print(res.data);

      awardModel = awardModelFromJson(jsonEncode(jsonDecode(res.data)));
      // profileModel = profileModelFromJson(jsonEncode(res.data));
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> openURL(url) async {
    print(url);
    if (!await launchUrl(
        Uri.parse(
          url,
        ),
        mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch $url');
    }
  }
}
