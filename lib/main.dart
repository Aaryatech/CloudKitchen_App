import 'dart:async';

import 'package:cloud_kitchen/theme/themeutils.dart';
import 'package:cloud_kitchen/ui/home/HomeScreen.dart';
import 'package:cloud_kitchen/ui/SplashScreen.dart';
import 'package:cloud_kitchen/ui/home/dashboard.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // runApp(MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runZonedGuarded(() {
    runApp(MyApp());
  }, (error, stackTrace) {
    print('runZonedGuarded: Caught error in my root zone.');
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });


}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
  FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Madhvi',
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




