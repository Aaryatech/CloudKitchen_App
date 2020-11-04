import 'package:cloud_kitchen/theme/themeutils.dart';
import 'package:cloud_kitchen/ui/home/HomeScreen.dart';
import 'package:cloud_kitchen/ui/SplashScreen.dart';
import 'package:cloud_kitchen/ui/dashboard.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
  FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: kLightTheme,

      routes: {
        "/home": (_) => new Dashboard(),
      },
      navigatorObservers: <NavigatorObserver>[observer],
      //  home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          child: SplashScreen(),
        ),
      ),


    );
  }
}




