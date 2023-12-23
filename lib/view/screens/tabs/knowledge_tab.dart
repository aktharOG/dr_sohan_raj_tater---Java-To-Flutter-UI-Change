import 'package:cached_network_image/cached_network_image.dart';
import 'package:dr_sohan_raj_tater/constants/app_color.dart';
import 'package:dr_sohan_raj_tater/constants/app_image.dart';
import 'package:dr_sohan_raj_tater/helpers/navigation_helper.dart';
import 'package:dr_sohan_raj_tater/view/provider/home_provider.dart';
import 'package:dr_sohan_raj_tater/view/screens/articles_screen.dart';
import 'package:dr_sohan_raj_tater/view/screens/kowledge_screens/award_screen.dart';
import 'package:dr_sohan_raj_tater/view/screens/kowledge_screens/books_screen.dart';
import 'package:dr_sohan_raj_tater/view/screens/kowledge_screens/image_screens.dart';
import 'package:dr_sohan_raj_tater/view/screens/kowledge_screens/profile_screen.dart';
import 'package:dr_sohan_raj_tater/view/widgets/headingText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class KnowledgeTab extends StatefulWidget {
  const KnowledgeTab({super.key});

  @override
  State<KnowledgeTab> createState() => _KnowledgeTabState();
}

class _KnowledgeTabState extends State<KnowledgeTab> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final homePro = Provider.of<HomeProvider>(context, listen: false);
      homePro.onFetchProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Center(
              child: CircleAvatar(
                backgroundImage: AssetImage(logo),
                radius: 50,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeadingText(
                    text: "Home",
                    fontSize: 25,
                    color: primaryColor,
                  ),
                  const Divider(),
                  InkWell(
                    onTap: () {
                      push(context, const ArticlesScreen());
                    },
                    child: const HeadingText(
                      text: "Articles",
                      fontSize: 25,
                      color: primaryColor,
                    ),
                  ),
                  const Divider(),
                  InkWell(
                    onTap: () {
                      push(context, const BooksScreen());
                    },
                    child: const HeadingText(
                      text: "Books",
                      fontSize: 25,
                      color: primaryColor,
                    ),
                  ),
                  const Divider(),
                  InkWell(
                    onTap: () {
                      push(context, const ImageScreen());
                    },
                    child: const HeadingText(
                      text: "Gallery",
                      fontSize: 25,
                      color: primaryColor,
                    ),
                  ),
                  const Divider(),
                  InkWell(
                    onTap: () {
                      push(context, const AwardScreen());
                    },
                    child: const HeadingText(
                      text: "Award",
                      fontSize: 25,
                      color: primaryColor,
                    ),
                  ),
                  const Divider(),
                  InkWell(
                    onTap: () {
                      push(context, const ProfileScreen());
                    },
                    child: const HeadingText(
                      text: "Profile",
                      fontSize: 25,
                      color: primaryColor,
                    ),
                  ),
                  const Divider(),
                  const HeadingText(
                    text: "Achievements",
                    fontSize: 25,
                    color: primaryColor,
                  ),
                  const Divider(),
                  const HeadingText(
                    text: "Research Cell",
                    fontSize: 25,
                    color: primaryColor,
                  ),
                  const Divider(),
                  const HeadingText(
                    text: "Public Opinion",
                    fontSize: 25,
                    color: primaryColor,
                  ),
                  const Divider(),
                  const HeadingText(
                    text: "Tater's Speeches",
                    fontSize: 25,
                    color: primaryColor,
                  ),
                  const Divider(),
                  const HeadingText(
                    text: "Museum",
                    fontSize: 25,
                    color: primaryColor,
                  ),
                  const Divider(),
                  const HeadingText(
                    text: "Contact",
                    fontSize: 25,
                    color: primaryColor,
                  ),
                  const Divider(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
