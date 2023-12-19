import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dr_sohan_raj_tater/services/dio_services.dart';
import 'package:dr_sohan_raj_tater/view/models/play_list_model.dart';
import 'package:dr_sohan_raj_tater/view/screens/tabs/home_tab.dart';
import 'package:dr_sohan_raj_tater/view/screens/tabs/knowledge_tab.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  PlayLists? playLists;
  bool isLoading = false;


 int currentIndex = 0;


  List<Widget> tabs = const[
    Hometab(),
    KnowledgeTab()
  ];


  onChangeBottomBar(value){
     currentIndex = value;
     notifyListeners();
  }

  onFetchPlaylists() async {
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
    isLoading = true;
    notifyListeners();
    Response? res = await ApiService.apiMethodSetup(
        method: apiMethod.get,
        url: "http://drsohanrajtater.com/api/profile.php");

    if (res != null) {
      print(res.data);

      playLists = playListsFromJson(jsonEncode(res.data));
      isLoading = false;
      notifyListeners();
    }
  }
}
