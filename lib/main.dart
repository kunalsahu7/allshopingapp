import 'package:allshopingapp/screens/homescreen/provider/homeprovider.dart';
import 'package:allshopingapp/screens/homescreen/view/homescreen_ui.dart';
import 'package:allshopingapp/screens/outputscreen/view/finalscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main()
{
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => homeprovider(),)
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/':(context) => homescreen(),
            'output screen':(context) => output(),
          },
        ),
      ),
  );
}