import 'package:dr_sohan_raj_tater/view/widgets/headingText.dart';
import 'package:flutter/material.dart';

class KnowledgeTab extends StatelessWidget {
  const KnowledgeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: HeadingText(text: "knowledge"),),
    );
  }
}