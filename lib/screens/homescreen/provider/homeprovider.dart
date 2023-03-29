import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class homeprovider extends ChangeNotifier
{
  InAppWebViewController? webViewController;
  double progressbar = 0;
  InAppWebViewController? inAppWebViewController;

  void changpogressbar(double progress)
  {
    progressbar = progress;
    notifyListeners();
  }

  List urilist = [
    "https://www.google.com/",
    "https://www.amazon.in/",
    "https://www.flipkart.com/",
    "https://www.olx.in/"
    "https://www.myntra.com/",
    "https://blinkit.com/",
    "https://clubfactory.website/",
    "https://www.shopify.com/in",
  ];

  List imagelist = [
    "assets/images/photo2.png",
    "assets/images/photo3.png",
    "assets/images/photo1.png",
    "assets/images/photo4.jpg",
    "assets/images/photo5.png",
    "assets/images/photo6.png",
    "assets/images/photo7.png",
    "assets/images/photo8.png",
  ];

}