import 'package:dr_sohan_raj_tater/constants/app_color.dart';
import 'package:dr_sohan_raj_tater/constants/app_image.dart';
import 'package:dr_sohan_raj_tater/view/provider/home_provider.dart';
import 'package:dr_sohan_raj_tater/view/widgets/headingText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final homePro = Provider.of<HomeProvider>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              const HeadingText(
                text:
                    "WELCOME TO PROF.(DR.) SOHAN RAJ TATER E-KNOWLEDGE MUSEUM",
                fontSize: 25,
                maxLines: 3,
                textAlign: TextAlign.start,
                color: primaryColor,
                fontWeight: FontWeight.bold,
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  homePro.openURL(
                      "http://drsohanrajtater.com/files/Revised_Life_Sketch_SRT_Hindi.pdf");
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadingText(
                        text: ">> Prof. Tater's Award Wining Images",
                        textAlign: TextAlign.start,
                        fontSize: 20,
                        color: primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  homePro.openURL(
                      "http://drsohanrajtater.com/images/thumb/gnp.jpeg");
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadingText(
                        text:
                            ">> Prof. Tater's Got World Record Entry in Golden Book of Records",
                        textAlign: TextAlign.start,
                        fontSize: 20,
                        color: primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  homePro.openURL(
                      "http://drsohanrajtater.com/images/thumb/gnpc.jpeg");
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadingText(
                        text:
                            ">> Prof. Tater's Golden Book of Records Certificate",
                        textAlign: TextAlign.start,
                        fontSize: 20,
                        color: primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  homePro.openURL(
                      "http://drsohanrajtater.com/files/Revised_Life_Sketch_SRT_Hindi.pdf");
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadingText(
                        text:
                            "To know about Life and Philosophy and 50 years Contribution to Society of Prof. (Dr.) Sohan Raj Tater please visit following:-",
                        textAlign: TextAlign.start,
                        fontSize: 20,
                        color: primaryColor,
                        maxLines: 5,
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  homePro.openURL(
                      "http://drsohanrajtater.com/files/Revised_Life_Sketch_SRT_Hindi.pdf");
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadingText(
                        text: ">> Prof. Tater's Revised Life Sketch",
                        textAlign: TextAlign.start,
                        fontSize: 20,
                        color: primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  homePro.openURL(
                      "http://drsohanrajtater.com/files/Revised_Life_Sketch_SRT_Hindi.pdf");
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadingText(
                        text: ">> Prof. Tater's Profile",
                        textAlign: TextAlign.start,
                        fontSize: 20,
                        color: primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  homePro.openURL(
                      "https://www.youtube.com/watch?v=h98JTJ4y6-o&feature=youtu.be",
                      isYT: true);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadingText(
                        text:
                            ">> DOCUMENTARY ON PROF.(DR.) SOHAN RAJ TATER (PART-1)",
                        textAlign: TextAlign.start,
                        fontSize: 20,
                        color: primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  homePro.openURL(
                      "https://www.youtube.com/watch?v=CCLYpssALNY&feature=youtu.be",
                      isYT: true);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadingText(
                        text:
                            ">> DOCUMENTARY ON PROF.(DR.) SOHAN RAJ TATER (PART-2)",
                        textAlign: TextAlign.start,
                        fontSize: 20,
                        color: primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  homePro.openURL(
                      "https://www.youtube.com/watch?v=5y7uAWS-AQc&feature=youtu.be",
                      isYT: true);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadingText(
                        text:
                            ">> DOCUMENTARY ON PROF.(DR.) SOHAN RAJ TATER (PART-3)",
                        textAlign: TextAlign.start,
                        fontSize: 20,
                        color: primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  homePro.openURL(
                      "https://www.youtube.com/watch?v=hl75A4cVf2Q&feature=youtu.be",
                      isYT: true);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadingText(
                        text:
                            ">> DOCUMENTARY ON PROF.(DR.) SOHAN RAJ TATER (PART-4)",
                        textAlign: TextAlign.start,
                        fontSize: 20,
                        color: primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  homePro.openURL(
                      "https://www.youtube.com/watch?v=6Skt7mErKtc&feature=youtu.be",
                      isYT: true);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadingText(
                        text:
                            ">> Public Felicitation of Prof.(Dr.) Sohan Raj Tater (Part-1)",
                        textAlign: TextAlign.start,
                        fontSize: 20,
                        color: primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  homePro.openURL(
                      "https://www.youtube.com/watch?v=3wTHYK4uNFU&feature=youtu.be",
                      isYT: true);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadingText(
                        text:
                            ">> Public Felicitation of Prof.(Dr.) Sohan Raj Tater (Part-2)",
                        textAlign: TextAlign.start,
                        fontSize: 20,
                        color: primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  homePro.openURL(
                      "https://www.youtube.com/watch?v=yMhh9Zi7ueU&feature=youtu.be",
                      isYT: true);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadingText(
                        text:
                            ">> Public Felicitation of Prof.(Dr.) Sohan Raj Tater (Part-3)",
                        textAlign: TextAlign.start,
                        fontSize: 20,
                        color: primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  homePro.openURL(
                      "https://www.youtube.com/watch?v=snvupwY_V0c&feature=youtu.be",
                      isYT: true);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadingText(
                        text:
                            ">> Public Felicitation of Prof.(Dr.) Sohan Raj Tater (Part-4)",
                        textAlign: TextAlign.start,
                        fontSize: 20,
                        color: primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: Image.asset(
                  logo,
                  height: 100,
                  width: 100,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              HeadingText(
                text:
                    """   Shri Sohan Raj Tater was born at Kanor, a small village in Barmer district on July 5,1947. He has always been an industrious, studious, simple, humble and soft-spoken. Since his childhood he has been living a detached life. He has always been a brilliant student and a topper. He stood first in class 9th, 10th, 11th and topped the list in the whole of Rajasthan in the higher secondary examination in the year 1964 and thus brought name and fame both to his family and to his Village also. In the year 1965 he was married to Mrs. Laxmidevi. Mrs. Laxmidevi proved the most perfect match to Shri Sohan Raj Tater. She too has been living a detached life since childhood. Both of them being disinterested in enjoying sexual pleasure, they observed celibacy for two years right from the first day of their
                              marriage from 1965 to 1967. They remained in close contact with Munishri Sampatmal Swami, who got shri Sohan Raj to
                              observe penitential retreat, 25 shlokas and to learn Jain siddhant deepika and Manonushasan, by heart. He also
                              motivated Shri Sohan Raj Tater and Mrs. Laxmidevi to get initiated as a fair. Both of them were extremely willing to
                              do so but this could not materialize because their destruction-cum-subsidence of the karmas had not yet been complete.
                              \n\n      Shri Tater is whole-heartedly devoted to the order of Terapanth and has great respect for both Acharyashri Tulsi and
            Acharyashri Mahapragya. He had been the secretary of the Terapanth council, Sardaarpura, Jodhpur from 1965 to 1970.""",
                maxLines: 1000,
                color: primaryColor,
                fontSize: 18,
              ),
              Divider(),
              HeadingText(
                text: "HONOURS RECEIVED",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              Divider(),
              HeadingText(
                text:
                    """ As Shri Tater was a very bright and intelligent student and as he had a great desire of learning, he sought admission
            in an Engineering college in 1964 and got the degree of B.E. (Mechanical), Honours in the year 1969. He maintained his
            glorious tradition of standing first and topped the list this time also and became a full-fledged Engineer. In the year
            1970, he was selected by Rajasthan Public Service Commission and was appointed as an Assistant Engineer in the Water
            Works department. He passed M.E. (Public Health Engineering), being in government service and it goes to his credit
            that this time also he got the first rank. As he was very prompt and authentic in service, he was honoured as many as
            four times by the Government of Rajasthan.
            \n\n        For Bringing water from Mathania to Jodhpur within 90 days in the year 1970.
              \n\n      For bringing the canal water to Bikaner in the year 1976.
                \n\n        For implementing Asias biggest regional water supply project for 300 villages in Churu district in the year 1984 and
                  \n\n      For working very promptly for the prevention of flood in Balotra in the year 1990.
                  \n\n      Shri Sohan Raj has always been associated with Terapanth and has worked incessantly and untiringly for its service and
                              development. Because of his great devotion to duty, the order and because of having full faith in and great respect for
                              all the monks and nuns, he was honoured and awarded many times, as is clear from the details given below :
                              \n\n      Nominated as member, Terapanth Amrit Sansad, Churu region (from 1982 to 1987).
                              \n\n      Awarded Yuvak Ratna in Delhi in the year 1987, by all India Yuvak Parishad in the holy presence of Acharya Shri Tulsi.
                              \n\n      Nominated Vice President, All India Yuvak Parishad (from 1988 to 1990).
                               \n\n     Nominated Member, Executive Council, Jain Vishva Bharati, Ladnun from 1985 to 1990.""",
                fontSize: 18,
                color: primaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
