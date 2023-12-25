import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dr_sohan_raj_tater/constants/app_image.dart';
import 'package:dr_sohan_raj_tater/core/shimmer_loader.dart';
import 'package:dr_sohan_raj_tater/view/provider/home_provider.dart';
import 'package:dr_sohan_raj_tater/view/widgets/headingText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeDetailsScreen extends StatefulWidget {
  final String playlistID;
  final String channelID;
  const HomeDetailsScreen(
      {super.key, required this.playlistID, required this.channelID});

  @override
  State<HomeDetailsScreen> createState() => _HomeDetailsScreenState();
}

class _HomeDetailsScreenState extends State<HomeDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final homePro = Provider.of<HomeProvider>(context, listen: false);
      homePro.onFetchPlaylistItem(widget.playlistID, widget.channelID);
    });
  }

  @override
  Widget build(BuildContext context) {
    final homePro = Provider.of<HomeProvider>(context);

    return Scaffold(
        appBar: AppBar(),
        body: homePro.isLoadingItem
            ? const Loader()
            : ListView.builder(
                itemCount: homePro.itemModel.length,
                itemBuilder: (context, index) {
                  final item = homePro.itemModel[index];
                  return InkWell(
                    onTap: () {
                      //    push(context, HomeDetailsScreen(playlistID: item?.id ?? ''));
                      homePro.openURL(
                          "https://www.youtube.com/embed/${item.snippet.resourceId.videoId}",
                          isYT: true);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.width,
                                    height: 200,
                                    imageUrl: item
                                            ?.snippet.thumbnails.high.url ??
                                        item?.snippet.thumbnails.medium.url ??
                                        'ss'),
                              ),
                              ListTile(
                                leading: const CircleAvatar(
                                  radius: 20,
                                  backgroundImage: AssetImage(logo),
                                ),
                                dense: true,
                                visualDensity: VisualDensity.compact,
                                title: HeadingText(
                                  textAlign: TextAlign.start,
                                  text: item?.snippet.title ?? 'name',
                                  fontSize: 15,
                                ),
                                subtitle: const HeadingText(
                                  text: "SohanRaj Tater",
                                  textAlign: TextAlign.start,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ));
  }
}
