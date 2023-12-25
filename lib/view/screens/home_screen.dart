import 'package:dr_sohan_raj_tater/constants/app_color.dart';
import 'package:dr_sohan_raj_tater/constants/app_image.dart';
import 'package:dr_sohan_raj_tater/view/provider/home_provider.dart';
import 'package:dr_sohan_raj_tater/view/widgets/headingText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final homePro = Provider.of<HomeProvider>(context, listen: false);
      // homePro.onFetchPlaylists();
      homePro.onFetchProfile();
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
            CircleAvatar(backgroundImage: AssetImage(logo),),
            SizedBox(width: 15,),
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
      body: homePro.tabs[homePro.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: homePro.currentIndex,
          onTap: (value) {
            homePro.onChangeBottomBar(value);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.video_collection_sharp),
                label: "E-KNOWLEDGE MUSEUM")
          ]),
    );
  }
}
