import 'package:dr_sohan_raj_tater/constants/app_color.dart';
import 'package:dr_sohan_raj_tater/constants/app_image.dart';
import 'package:dr_sohan_raj_tater/core/shimmer_loader.dart';
import 'package:dr_sohan_raj_tater/view/provider/home_provider.dart';
import 'package:dr_sohan_raj_tater/view/utils/headingText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ResearchScreen extends StatefulWidget {
  const ResearchScreen({super.key});

  @override
  State<ResearchScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<ResearchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final homePro = Provider.of<HomeProvider>(context, listen: false);
      setState(() {
        homePro.page=0;
        homePro.onFetchResearch();
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
        body: homePro.isAwardsLoading
            ? const Loader()
            : Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        final data = homePro.researchModel?.data[index];
                        return InkWell(
                          onTap: () {
                            homePro.openURL(data?.href);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HeadingText(
                                  text: data?.title ?? '',
                                  textAlign: TextAlign.start,
                                  fontSize: 20,
                                  color: primaryColor,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (ctx, i) => const Divider(),
                      itemCount: homePro.researchModel?.data.length ?? 0),
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
                            homePro.onFetchResearch();
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
                            homePro.onFetchResearch();
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
