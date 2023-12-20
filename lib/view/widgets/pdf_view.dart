import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfViewPage extends StatefulWidget {
 final String path;
  const PdfViewPage({super.key,required this.path});

  @override
  State<PdfViewPage> createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
 
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: PDF(
        
          enableSwipe: true,
          swipeHorizontal: false
          ,
          autoSpacing: false,
          pageFling: false,
          onError: (error) {
            print(error.toString());
          },
          onPageError: (page, error) {
            print('$page: ${error.toString()}');
          },
          onPageChanged: (int? page, int? total) {
            print('page change: $page/$total');
          },
        ).cachedFromUrl(widget.path),
    );

  }
}