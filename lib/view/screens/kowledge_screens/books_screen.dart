import 'package:dr_sohan_raj_tater/constants/app_color.dart';
import 'package:dr_sohan_raj_tater/constants/app_image.dart';
import 'package:dr_sohan_raj_tater/core/shimmer_loader.dart';
import 'package:dr_sohan_raj_tater/helpers/navigation_helper.dart';
import 'package:dr_sohan_raj_tater/view/provider/home_provider.dart';
import 'package:dr_sohan_raj_tater/view/utils/headingText.dart';
import 'package:dr_sohan_raj_tater/view/utils/pdf_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<BooksScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final homePro = Provider.of<HomeProvider>(context, listen: false);
      homePro.onFetchBooks();
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
        body: homePro.isBooksLoading
            ? const Loader()
            : ListView.separated(
                itemBuilder: (context, index) {
                  final data = homePro.booksModel?.data[index];
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
                separatorBuilder: (ctx, i) => const Divider(),
                itemCount: homePro.booksModel?.data.length ?? 0));
  }
}
