import 'package:country_news_json/screens/home/provider/homeProvider.dart';
import 'package:country_news_json/screens/home/view/home_screen.dart';
import 'package:country_news_json/screens/tab/view/tabbar_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => homeProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => tabbar_screen(),
          'home':(context) => home_screen(),
        },
      ),
    ),
  );
}