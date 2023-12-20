import 'package:dr_sohan_raj_tater/constants/app_color.dart';
import 'package:dr_sohan_raj_tater/constants/app_image.dart';
import 'package:dr_sohan_raj_tater/view/provider/home_provider.dart';
import 'package:dr_sohan_raj_tater/view/widgets/headingText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AwardScreen extends StatefulWidget {
  const AwardScreen({super.key});

  @override
  State<AwardScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<AwardScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final homePro = Provider.of<HomeProvider>(context, listen: false);
      homePro.onFetchAwards();
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
        body: ListView.separated(
            itemBuilder: (context, index) {
              final data = homePro.awardModel?.data[index];
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
            itemCount: homePro.awardModel?.data.length ?? 0));
  }
}
