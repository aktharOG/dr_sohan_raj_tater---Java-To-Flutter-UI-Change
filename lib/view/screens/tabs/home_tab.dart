import 'package:cached_network_image/cached_network_image.dart';
import 'package:dr_sohan_raj_tater/view/provider/home_provider.dart';
import 'package:dr_sohan_raj_tater/view/widgets/headingText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class Hometab extends StatelessWidget {
  const Hometab({super.key});

  @override
  Widget build(BuildContext context) {
        final homePro = Provider.of<HomeProvider>(context);

    return homePro.isLoading
            ? Center(
                child: SizedBox(
                width: 200.0,
                height: 100.0,
                child: Shimmer.fromColors(
                  baseColor: Colors.red,
                  highlightColor: Colors.yellow,
                  child: const Text(
                    'Shimmer',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ))
            : ListView.builder(
                itemCount: homePro.playLists?.items.length,
                itemBuilder: (context, index) {
                  final item = homePro.playLists?.items[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                                  imageUrl: item?.snippet.thumbnails.high.url ??
                                      item?.snippet.thumbnails.medium.url ??
                                      'ss'),
                            ),
                            ListTile(
                              leading: const CircleAvatar(
                                radius: 20,
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
                  );
                });
              
  }
}