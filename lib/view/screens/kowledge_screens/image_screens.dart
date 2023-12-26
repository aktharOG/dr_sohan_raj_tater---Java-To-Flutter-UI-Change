import 'package:cached_network_image/cached_network_image.dart';
import 'package:dr_sohan_raj_tater/constants/app_color.dart';
import 'package:dr_sohan_raj_tater/constants/app_image.dart';
import 'package:dr_sohan_raj_tater/core/shimmer_loader.dart';
import 'package:dr_sohan_raj_tater/helpers/navigation_helper.dart';
import 'package:dr_sohan_raj_tater/view/provider/home_provider.dart';
import 'package:dr_sohan_raj_tater/view/widgets/headingText.dart';
import 'package:dr_sohan_raj_tater/view/widgets/pdf_view.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<ImageScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final homePro = Provider.of<HomeProvider>(context, listen: false);
      setState(() {
        homePro.page = 0;
        homePro.onfetchImages();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final homePro = Provider.of<HomeProvider>(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(logo),
              ),
              SizedBox(
                width: 15,
              ),
              Flexible(
                child: HeadingText(
                  text: "PROF.(DR.) SOHAN RAJ TATER E-ENOWLEDGE",
                  fontSize: 16,
                  color: Colors.white,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
        body: homePro.isImagesLoading
            ? const Loader()
            : Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      itemCount: homePro.imageModel?.data.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (ctx, i) {
                        final data = homePro.imageModel?.data[i];
                        return InkWell(
                          onTap: () {
                            final imageProvider = Image.network(
                              data.uri,
                              fit: BoxFit.contain,
                            ).image;

                            showImageViewer(context, imageProvider,
                                onViewerDismissed: () {
                              print("dismissed");
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: CachedNetworkImage(
                                  imageUrl: data!.uri,
                                  fit: BoxFit.cover,
                                  placeholder: (ctx,i)=>const Center(child:  CircularProgressIndicator.adaptive()),
                                )),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                     padding:  EdgeInsets.only(bottom: 40.h),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.pinkAccent),
                              onPressed: () {
                                if (homePro.page > 0) {
                                  homePro.page--;
                                  homePro.onfetchImages();
                                }
                              },
                              child: const HeadingText(
                                text: "Previous Page",
                                color: Colors.white,
                              )),
                          const SizedBox(width: 10),
                          HeadingText(text: homePro.page.toString()),
                          const SizedBox(width: 10),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.pinkAccent),
                              onPressed: () {
                                setState(() {
                                  homePro.page++;
                                  homePro.onfetchImages();
                                });
                              },
                              child: const HeadingText(
                                text: "Next Page",
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                  )
                ],
              ));
  }
}
