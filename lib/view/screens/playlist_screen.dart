import 'package:cached_network_image/cached_network_image.dart';
import 'package:dr_sohan_raj_tater/constants/app_image.dart';
import 'package:dr_sohan_raj_tater/core/shimmer_loader.dart';
import 'package:dr_sohan_raj_tater/helpers/navigation_helper.dart';
import 'package:dr_sohan_raj_tater/view/provider/home_provider.dart';
import 'package:dr_sohan_raj_tater/view/screens/home_details_screen.dart';
import 'package:dr_sohan_raj_tater/view/utils/headingText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayListScreen extends StatefulWidget {
  final String channelID;
  const PlayListScreen({super.key, required this.channelID});

  @override
  State<PlayListScreen> createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final homePro = Provider.of<HomeProvider>(context, listen: false);
      homePro.onFetchPlaylists(widget.channelID);
    });
  }

  @override
  Widget build(BuildContext context) {
    final homePro = Provider.of<HomeProvider>(context);
    return homePro.isLoading
        ? const Loader()
        : Scaffold(
          appBar: AppBar(),
            body: ListView.builder(
              itemCount: homePro.playLists?.items.length,
              itemBuilder: (context, index) {
                final item = homePro.playLists?.items[index];
                return InkWell(
                  onTap: () {
                    push(
                        context,
                        HomeDetailsScreen(
                          playlistID: item?.id ?? '',
                          channelID: widget.channelID,
                        ));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
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
                                  placeholder: (ctx, value) => const Center(
                                      child: CircularProgressIndicator()),
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width,
                                  height: 200,
                                  imageUrl: item?.snippet.thumbnails.high.url ??
                                      item?.snippet.thumbnails.medium.url ??
                                      "https://th.bing.com/th/id/OIP.UeSZpz3lZfh_FP55JjmV9QHaEK?rs=1&pid=ImgDetMain"),
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
            ),
          );
  }
}
