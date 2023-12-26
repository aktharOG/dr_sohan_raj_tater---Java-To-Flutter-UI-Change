import 'package:dr_sohan_raj_tater/constants/app_color.dart';
import 'package:dr_sohan_raj_tater/constants/app_image.dart';
import 'package:dr_sohan_raj_tater/core/shimmer_loader.dart';
import 'package:dr_sohan_raj_tater/helpers/navigation_helper.dart';
import 'package:dr_sohan_raj_tater/view/provider/home_provider.dart';
import 'package:dr_sohan_raj_tater/view/widgets/headingText.dart';
import 'package:dr_sohan_raj_tater/view/widgets/pdf_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MuseamScreen extends StatefulWidget {
  const MuseamScreen({super.key});

  @override
  State<MuseamScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<MuseamScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final homePro = Provider.of<HomeProvider>(context, listen: false);
      setState(() {
        
        homePro.page=0;
        homePro.onFetchMuseum();
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
        body: homePro.isBooksLoading?const Loader(): Column(
          children: [
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    final data = homePro.museumModel?.data[index];
                    return InkWell(
                      onTap: () {
                        print(data?.href);
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
                  itemCount: homePro.museumModel?.data.length ?? 0),
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
                            homePro.onFetchMuseum();
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
                            homePro.onFetchMuseum();
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
