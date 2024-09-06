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
  AwardModel? researchModel;
  AwardModel? publicOpinion;
  AwardModel? speachesModel;
  AwardModel? acieveModel;
  AwardModel? museumModel;

  List<ItemModel> itemModel = [];
  bool isLoading = false;

  bool isLoadingItem = false;

  int currentIndex = 0;

  List<Widget> tabs = const [Hometab(), KnowledgeTab()];

  int page = 0;

  onChangeBottomBar(value) {
    currentIndex = value;
    notifyListeners();
  }

  onFetchPlaylists(channelID) async {
    log("onFetchPlaylists");

    isLoading = true;
    notifyListeners();
    Response? res = await ApiService.apiMethodSetup(
        method: apiMethod.get,
        url:
            "https://www.googleapis.com/youtube/v3/playlists?part=id%2Csnippet&channelId=$channelID&maxResults=40&key=AIzaSyDQaXoj4trJO91ufuEiB6Oh3IBp00aVpFA&maxResults=100");

    if (res != null) {
      print(res.data);

      playLists = playListsFromJson(jsonEncode(res.data));
      isLoading = false;
      notifyListeners();
    }
  }

  bool isProfileLoading = false;

  onFetchProfile() async {
    isProfileLoading = true;
    // log("profile");
    // isLoading = true;
    notifyListeners();
    Response? res = await ApiService.apiMethodSetup(
        method: apiMethod.get,
        url: "http://drsohanrajtater.com/api/profile.php?page=$page");

    if (res != null) {
      log("ferching profile ..");
      print(res.data);

      profileModel = profileModelFromJson(jsonEncode(jsonDecode(res.data)));
      // profileModel = profileModelFromJson(jsonEncode(res.data));
      isProfileLoading = false;
      notifyListeners();
    }
  }

  onFetchPlaylistItem(playlistID, channelID) async {
    log("onPlaylist item : ");
    log("playlist ID : $playlistID");
    isLoadingItem = true;
    notifyListeners();
    Response? res = await ApiService.apiMethodSetup(
      method: apiMethod.get,
      url:
          "https://www.googleapis.com/youtube/v3/playlistItems?key=AIzaSyDQaXoj4trJO91ufuEiB6Oh3IBp00aVpFA&part=snippet%2CcontentDetails&playlistId=$playlistID&maxResults=100&channelId=$channelID",
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

  bool fetchArticles = false;
  bool isArticlesLoading = false;

  onFetchArticles() async {
    // log("profile");
    // isLoading = true;
    isArticlesLoading = true;
    notifyListeners();
    Response? res = await ApiService.apiMethodSetup(
        method: apiMethod.get,
        url: "http://drsohanrajtater.com/api/articles.php?page=$page");

    if (res != null) {
      log("ferching articles ..");
      print(res.data);

      articles = articlesFromJson(jsonEncode(jsonDecode(res.data)));
      // profileModel = profileModelFromJson(jsonEncode(res.data));
      isArticlesLoading = false;
      notifyListeners();
    }
  }

  // onFetchMore() async {
  //   // log("profile");
  //   // isLoading = true;
  //   notifyListeners();
  //   Response? res = await ApiService.apiMethodSetup(
  //       method: apiMethod.get,
  //       url: "http://drsohanrajtater.com/api/articles.php?page=$page");

  //   if (res != null) {
  //     log("ferching articles ..");
  //     print(res.data);

  //     articles = articlesFromJson(jsonEncode(jsonDecode(res.data)));
  //     // profileModel = profileModelFromJson(jsonEncode(res.data));
  //     isLoading = false;
  //     notifyListeners();
  //   }
  // }

  bool isBooksLoading = false;

  onFetchBooks() async {
    // log("profile");
    isBooksLoading = true;
    notifyListeners();
    Response? res = await ApiService.apiMethodSetup(
        method: apiMethod.get, url: "http://drsohanrajtater.com/api/books.php");

    if (res != null) {
      log("ferching articles ..");
      print(res.data);

      booksModel = booksModelFromJson(jsonEncode(jsonDecode(res.data)));
      // profileModel = profileModelFromJson(jsonEncode(res.data));
      isBooksLoading = false;
      notifyListeners();
    }
  }

  bool isImagesLoading = false;

  onEndLoading(){
    isImagesLoading = false;
    
    notifyListeners();
  }
  onfetchImages() async {
    // log("profile");
    isImagesLoading = true;
    notifyListeners();
    try{
      Response? res = await ApiService.apiMethodSetup(
        method: apiMethod.get,
        url: "http://drsohanrajtater.com/api/imagegallery.php?page=$page");

    if (res != null) {
      log("ferching Images ..");
      print(res.data);

      imageModel = imageModelFromJson(jsonEncode(jsonDecode(res.data)));
      isImagesLoading = false;
      notifyListeners();
      // profileModel = profileModelFromJson(jsonEncode(res.data));
    
    }
    }catch(e){
  isImagesLoading = false;
      notifyListeners();
    }
  }

  bool isAwardsLoading = false;

  onFetchAwards() async {
    // log("profile");
    isAwardsLoading = true;
    notifyListeners();
    Response? res = await ApiService.apiMethodSetup(
        method: apiMethod.get, url: "http://drsohanrajtater.com/api/award.php?page=$page");

    if (res != null) {
      log("ferching Images ..");
      print(res.data);

      awardModel = awardModelFromJson(jsonEncode(jsonDecode(res.data)));
      // profileModel = profileModelFromJson(jsonEncode(res.data));
      isAwardsLoading = false;
      notifyListeners();
    }
  }

  bool isResearchLoading = false;

  onFetchResearch() async {
    // log("profile");
    isAwardsLoading = true;
    notifyListeners();
    Response? res = await ApiService.apiMethodSetup(
        method: apiMethod.get,
        url: "http://drsohanrajtater.com/api/research.php?page=$page");

    if (res != null) {
      log("ferching Images ..");
      print(res.data);

      researchModel = awardModelFromJson(jsonEncode(jsonDecode(res.data)));
      // profileModel = profileModelFromJson(jsonEncode(res.data));
      isAwardsLoading = false;
      notifyListeners();
    }
  }

  onFetchPublicOpinion() async {
    // log("profile");
    isAwardsLoading = true;
    notifyListeners();
    Response? res = await ApiService.apiMethodSetup(
        method: apiMethod.get,
        url: "http://drsohanrajtater.com/api/public_opinion.php?page=$page");

    if (res != null) {
      log("ferching Images ..");
      print(res.data);

      publicOpinion = awardModelFromJson(jsonEncode(jsonDecode(res.data)));
      // profileModel = profileModelFromJson(jsonEncode(res.data));
      isAwardsLoading = false;
      notifyListeners();
    }
  }

  onFetchSpeaches() async {
    // log("profile");
    isAwardsLoading = true;
    notifyListeners();
    Response? res = await ApiService.apiMethodSetup(
        method: apiMethod.get,
        url: "http://drsohanrajtater.com/api/speeches.php?page=$page");

    if (res != null) {
      log("ferching Images ..");
      print(res.data);

      speachesModel = awardModelFromJson(jsonEncode(jsonDecode(res.data)));
      // profileModel = profileModelFromJson(jsonEncode(res.data));
      isAwardsLoading = false;
      notifyListeners();
    }
  }

  onFetchAchievements() async {
    // log("profile");
    isAwardsLoading = true;
    notifyListeners();
    Response? res = await ApiService.apiMethodSetup(
        method: apiMethod.get,
        url: "http://drsohanrajtater.com/api/achiv.php?page=$page");

    if (res != null) {
      log("ferching Images ..");
      print(res.data);

      acieveModel = awardModelFromJson(jsonEncode(jsonDecode(res.data)));
      // profileModel = profileModelFromJson(jsonEncode(res.data));
      isAwardsLoading = false;
      notifyListeners();
    }
  }

  onFetchMuseum() async {
    // log("profile");
    isAwardsLoading = true;
    notifyListeners();
    Response? res = await ApiService.apiMethodSetup(
        method: apiMethod.get,
        url: "http://drsohanrajtater.com/api/museum.php?page=$page");

    if (res != null) {
      log("ferching Images ..");
      print(res.data);

      museumModel = awardModelFromJson(jsonEncode(jsonDecode(res.data)));
      // profileModel = profileModelFromJson(jsonEncode(res.data));
      isAwardsLoading = false;
      notifyListeners();
    }
  }

  Future<void> openURL(url, {isYT = false}) async {
    print(url);
    if (!await launchUrl(
        Uri.parse(
          url,
        ),
        mode: isYT
            ? LaunchMode.inAppWebView
            : LaunchMode.externalNonBrowserApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}
