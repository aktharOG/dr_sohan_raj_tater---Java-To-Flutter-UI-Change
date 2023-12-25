import 'package:cached_network_image/cached_network_image.dart';
import 'package:dr_sohan_raj_tater/constants/app_color.dart';
import 'package:dr_sohan_raj_tater/constants/app_image.dart';
import 'package:dr_sohan_raj_tater/helpers/navigation_helper.dart';
import 'package:dr_sohan_raj_tater/view/provider/home_provider.dart';
import 'package:dr_sohan_raj_tater/view/screens/articles_screen.dart';
import 'package:dr_sohan_raj_tater/view/screens/kowledge_screens/achievements_screen.dart';
import 'package:dr_sohan_raj_tater/view/screens/kowledge_screens/award_screen.dart';
import 'package:dr_sohan_raj_tater/view/screens/kowledge_screens/books_screen.dart';
import 'package:dr_sohan_raj_tater/view/screens/kowledge_screens/contact_screen.dart';
import 'package:dr_sohan_raj_tater/view/screens/kowledge_screens/image_screens.dart';
import 'package:dr_sohan_raj_tater/view/screens/kowledge_screens/museum_screen.dart';
import 'package:dr_sohan_raj_tater/view/screens/kowledge_screens/profile_screen.dart';
import 'package:dr_sohan_raj_tater/view/screens/kowledge_screens/public_opinio_screen.dart';
import 'package:dr_sohan_raj_tater/view/screens/kowledge_screens/reasearch_screen.dart';
import 'package:dr_sohan_raj_tater/view/screens/kowledge_screens/speaches_screen.dart';
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
    final homePro = Provider.of<HomeProvider>(context);

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
                  InkWell(
                    onTap: () {
                      homePro.onChangeBottomBar(0);
                    },
                    child: const ListTile(
                      dense: true,
                      leading: HeadingText(
                        text: "Home",
                        fontSize: 25,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  const Divider(),
                  InkWell(
                    onTap: () {
                      push(context, const ArticlesScreen());
                    },
                    child: const ListTile(
                      dense: true,
                      leading: HeadingText(
                        text: "Articles",
                        fontSize: 25,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  const Divider(),
                  InkWell(
                    onTap: () {
                      push(context, const BooksScreen());
                    },
                    child: const ListTile(
                      dense: true,
                      leading: HeadingText(
                        text: "Books",
                        fontSize: 25,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  const Divider(),
                  InkWell(
                    onTap: () {
                      push(context, const ImageScreen());
                    },
                    child: const ListTile(
                      dense: true,
                      leading: HeadingText(
                        text: "Gallery",
                        fontSize: 25,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  const Divider(),
                  InkWell(
                    onTap: () {
                      push(context, const AwardScreen());
                    },
                    child: const ListTile(
                      dense: true,
                      leading: HeadingText(
                        text: "Award",
                        fontSize: 25,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  const Divider(),
                  InkWell(
                    onTap: () {
                      push(context, const ProfileScreen());
                    },
                    child: const ListTile(
                      dense: true,
                      leading: HeadingText(
                        text: "Profile",
                        fontSize: 25,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    onTap: () {
                      push(context, const AchievementsScreen());
                    },
                    dense: true,
                    leading: const HeadingText(
                      text: "Achievements",
                      fontSize: 25,
                      color: primaryColor,
                    ),
                  ),
                  const Divider(),
                  InkWell(
                    onTap: () {
                      push(context, const ResearchScreen());
                    },
                    child: const ListTile(
                      dense: true,
                      leading: HeadingText(
                        text: "Research Cell",
                        fontSize: 25,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  const Divider(),
                  InkWell(
                    onTap: () {
                      push(context, const PublicOpinionScreen());
                    },
                    child: const ListTile(
                      dense: true,
                      leading: HeadingText(
                        text: "Public Opinion",
                        fontSize: 25,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  const Divider(),
                  InkWell(
                    onTap: () {
                      push(context, const SpeachesScreen());
                    },
                    child: const ListTile(
                      dense: true,
                      leading: HeadingText(
                        text: "Tater's Speeches",
                        fontSize: 25,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    onTap: () {
                      push(context, const MuseamScreen());
                    },
                    dense: true,
                    leading: const HeadingText(
                      text: "Museum",
                      fontSize: 25,
                      color: primaryColor,
                    ),
                  ),
                  const Divider(),
                  InkWell(
                    onTap: () {
                      push(context, const ContactScreen());
                    },
                    child: const ListTile(
                      dense: true,
                      leading: HeadingText(
                        text: "Contact",
                        fontSize: 25,
                        color: primaryColor,
                      ),
                    ),
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
