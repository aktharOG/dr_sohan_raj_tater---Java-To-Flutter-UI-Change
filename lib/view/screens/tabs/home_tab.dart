import 'package:cached_network_image/cached_network_image.dart';
import 'package:dr_sohan_raj_tater/constants/app_image.dart';
import 'package:dr_sohan_raj_tater/core/shimmer_loader.dart';
import 'package:dr_sohan_raj_tater/helpers/navigation_helper.dart';
import 'package:dr_sohan_raj_tater/view/provider/home_provider.dart';
import 'package:dr_sohan_raj_tater/view/screens/home_details_screen.dart';
import 'package:dr_sohan_raj_tater/view/screens/playlist_screen.dart';
import 'package:dr_sohan_raj_tater/view/utils/headingText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Hometab extends StatelessWidget {
  const Hometab({super.key});

  @override
  Widget build(BuildContext context) {
    final homePro = Provider.of<HomeProvider>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              push(
                  context,
                  const PlayListScreen(
                    channelID: "UCML9aPPHwigTRBJrx-9b1Uw",
                  ));
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage(
                          channel1,
                        ),
                        fit: BoxFit.cover),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(1, 1),
                          blurRadius: 10)
                    ],
                    borderRadius: BorderRadius.circular(10)),
                height: 200,
              ),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              push(
                  context,
                  const PlayListScreen(
                    channelID: "UCrunGXs5JbTjybBrc-0NXog",
                  ));
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage(
                          channel2,
                        ),
                        fit: BoxFit.cover),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(1, 1),
                          blurRadius: 10)
                    ],
                    borderRadius: BorderRadius.circular(10)),
                height: 200,
              ),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              push(context,
                  const PlayListScreen(channelID: "UC8zRsDaO2jdYtbEiY-NUJ6g"));
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage(
                          channel3,
                        ),
                        fit: BoxFit.cover),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(1, 1),
                          blurRadius: 10)
                    ],
                    borderRadius: BorderRadius.circular(10)),
                height: 200,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
