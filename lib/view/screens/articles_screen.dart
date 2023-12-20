import 'package:dr_sohan_raj_tater/constants/app_color.dart';
import 'package:dr_sohan_raj_tater/constants/app_image.dart';
import 'package:dr_sohan_raj_tater/helpers/navigation_helper.dart';
import 'package:dr_sohan_raj_tater/view/provider/home_provider.dart';
import 'package:dr_sohan_raj_tater/view/widgets/headingText.dart';
import 'package:dr_sohan_raj_tater/view/widgets/pdf_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({super.key});

  @override
  State<ArticlesScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<ArticlesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final homePro = Provider.of<HomeProvider>(context, listen: false);
      homePro.onFetchArticles();
    });
  }

  @override
  Widget build(BuildContext context) {
    final homePro = Provider.of<HomeProvider>(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Row(
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
        body: ListView.separated(
            itemBuilder: (context, index) {
              final data = homePro.articles?.data[index];
              return InkWell(
                onTap: () {
                  print(data?.href);
                  push(context, PdfViewPage(path: data?.href ?? ""));
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
            separatorBuilder: (ctx, i) => Divider(),
            itemCount: homePro.profileModel?.data.length ?? 0));
  }
}
