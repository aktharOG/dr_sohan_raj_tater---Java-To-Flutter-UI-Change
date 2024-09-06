import 'package:dr_sohan_raj_tater/constants/app_color.dart';
import 'package:dr_sohan_raj_tater/constants/app_image.dart';
import 'package:dr_sohan_raj_tater/view/utils/headingText.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
            ),
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage(logo),
                radius: 100,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            HeadingText(
              text: "Prof.(Dr.) Sohan Raj Tater",
              textAlign: TextAlign.start,
              fontSize: 20,
              color: primaryColor,
            ),
            Divider(),
             HeadingText(
              text: "G-8 Multan Kunj, Bhagat ki kothi Extension",
              textAlign: TextAlign.start,
              fontSize: 20,
              color: primaryColor,
            ),
            Divider(),
             HeadingText(
              text: "JODHPUR-342003 (Rajastan) INDIA",
              textAlign: TextAlign.start,
              fontSize: 20,
              color: primaryColor,
            ),
            Divider(),
             HeadingText(
              text: "Email: sonah.tater@gmail.com",
              textAlign: TextAlign.start,
              fontSize: 20,
              color: primaryColor,
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
