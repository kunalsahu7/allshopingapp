import 'package:allshopingapp/screens/homescreen/provider/homeprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

class output extends StatefulWidget {
  const output({Key? key}) : super(key: key);

  @override
  State<output> createState() => _outputState();
}

class _outputState extends State<output> {
  TextEditingController txtserch = TextEditingController();
  homeprovider? Homeprovidertrue;
  homeprovider? Homeproviderfalse;

  @override
  Widget build(BuildContext context) {
    Homeproviderfalse = Provider.of<homeprovider>(context, listen: false);
    Homeprovidertrue = Provider.of<homeprovider>(context, listen: true);
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                IconButton(onPressed: () {
                  Homeprovidertrue!.inAppWebViewController!.goBack();
                }, icon: Icon(Icons.arrow_back)),
                IconButton(onPressed: () {
                  Homeprovidertrue!.inAppWebViewController!.reload();
                }, icon: Icon(Icons.restart_alt_outlined)),
                IconButton(onPressed: () {
                  Homeprovidertrue!.inAppWebViewController!.goForward();
                }, icon: Icon(Icons.arrow_forward)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                    ),
                  ]
                ),
                child: Expanded(
                  child: TextField(
                    controller: txtserch,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: IconButton(
                        onPressed: () {
                          var newlink = txtserch.text;
                          Homeprovidertrue!.inAppWebViewController!.loadUrl(urlRequest: URLRequest(url:Uri.parse("https://www.google.com/search?q=$newlink")));
                        },
                        icon: Icon(
                          Icons.search_rounded
                        ),
                      ),
                      label: Text("Serch data"),
                    ),
                  ),
                ),
              ),
            ),
            LinearProgressIndicator(value:Homeprovidertrue!.progressbar),
            Expanded(
              child: InAppWebView(
                initialUrlRequest: URLRequest(
                  url: Uri.parse(
                    Homeproviderfalse!.urilist[index],
                  ),
                ),
                onWebViewCreated: (controller) {
                  Homeprovidertrue!.inAppWebViewController=controller;
                },
                onLoadError: (controller, url, code, message) {
                  Homeprovidertrue!.inAppWebViewController=controller;
                },
                onLoadStart: (controller, url) {
                  Homeprovidertrue!.inAppWebViewController=controller;
                },
                onLoadStop: (controller, url) {
                  Homeprovidertrue!.inAppWebViewController=controller;
                },
                onProgressChanged: (controller, progress) {
                  Homeproviderfalse!.changpogressbar(progress/100);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
