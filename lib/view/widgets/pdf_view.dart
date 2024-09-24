import 'dart:developer';

import 'package:advance_pdf_viewer_fork/advance_pdf_viewer_fork.dart';
import 'package:flutter/material.dart';

class PdfViewPage extends StatefulWidget {
  final String path;
  const PdfViewPage({super.key, required this.path});

  @override
  State<PdfViewPage> createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  PDFDocument? doc;

  onfetchPDF() async {
    doc = await PDFDocument.fromURL(widget.path);

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onfetchPDF();
  }

  @override
  Widget build(BuildContext context) {
    log(widget.path);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Pdf View"),
        ),
        body: doc == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : PDFViewer(document: doc!));
  }
}


// PDF(
//         enableSwipe: true,
//         swipeHorizontal: false,
//         autoSpacing: false,
//         pageFling: false,
//         onError: (error) {
//           print(error.toString());
//         },
//         onPageError: (page, error) {
//           print('$page: ${error.toString()}');
//         },
//         onPageChanged: (int? page, int? total) {
//           print('page change: $page/$total');
//         },
//       ).cachedFromUrl(widget.path),