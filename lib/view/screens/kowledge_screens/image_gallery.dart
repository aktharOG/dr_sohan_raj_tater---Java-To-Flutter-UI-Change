import 'package:dr_sohan_raj_tater/constants/app_color.dart';
import 'package:dr_sohan_raj_tater/helpers/navigation_helper.dart';
import 'package:dr_sohan_raj_tater/view/provider/home_provider.dart';
import 'package:dr_sohan_raj_tater/view/screens/kowledge_screens/image_screens.dart';
import 'package:dr_sohan_raj_tater/view/widgets/headingText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ImageGallery extends StatelessWidget {
  const ImageGallery({super.key});

  @override
  Widget build(BuildContext context) {
        final homePro = Provider.of<HomeProvider>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
           SizedBox(height: 20.h,),

           HeadingText(text: "IMAGE GALLEY of PROF.(DR) SOHAN RAJ TATEE",fontSize: 20,color: primaryColor,fontWeight: FontWeight.bold,),
               SizedBox(height: 30.h,),
             const Divider(),
              InkWell(
                onTap: () {
                  homePro.openURL(
                      "http://drsohanrajtater.com/gallery",
                      isYT: false);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadingText(
                        text:
                            ">> Click for view old images",
                        textAlign: TextAlign.start,
                        fontSize: 18,
                        color: primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
            
              const Divider(),
                            InkWell(
                onTap: () {
                  push(context,const ImageScreen());
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadingText(
                        text:
                            ">> Image gallery",
                        textAlign: TextAlign.start,
                        fontSize: 18,
                        color: primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
      ],),
    );
  }
}