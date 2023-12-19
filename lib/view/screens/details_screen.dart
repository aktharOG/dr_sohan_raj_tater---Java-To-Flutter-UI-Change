import 'package:dr_sohan_raj_tater/view/provider/home_provider.dart';
import 'package:dr_sohan_raj_tater/view/widgets/headingText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homePro = Provider.of<HomeProvider>(context);

    return Expanded(
        child: ListView.separated(
            itemBuilder: (context, index) {
              final data = homePro.profileModel?.data[index];
              return HeadingText(text: data?.title ?? '');
            },
            separatorBuilder: (ctx, i) => SizedBox(
                  height: 10,
                ),
            itemCount: homePro.profileModel?.data.length ?? 0));
  }
}
