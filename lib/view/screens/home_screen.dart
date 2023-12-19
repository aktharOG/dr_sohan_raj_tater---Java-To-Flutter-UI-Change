import 'package:dr_sohan_raj_tater/constants/app_color.dart';
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
      homePro.onFetchPlaylists();
      homePro.onFetchProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    final homePro = Provider.of<HomeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: HeadingText(
          text: "PROF.(DR.) SOHAN RAJ TATER E-ENOWLEDGE",
          fontSize: 16,
          color: Colors.white,
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
                icon: Icon(Icons.library_music_outlined),
                label: "Knoledge Method")
          ]),
    );
  }
}
