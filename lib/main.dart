import 'dart:async';

import 'package:cloud_kitchen/local/prefs.dart';
import 'package:cloud_kitchen/theme/themeutils.dart';

import 'package:cloud_kitchen/ui/SplashScreen.dart';
import 'package:cloud_kitchen/ui/home/dashboard.dart';
import 'package:cloud_kitchen/ui/order/orderHistoryUI.dart';
import 'package:cloud_kitchen/viewmodel/franchisi/frviewmodel.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;

/// Streams are created so that app can respond to notification-related events
/// since the plugin is initialised in the `main` function

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future onSelectNotification(String payload) async {
  print('######${payload}');
  print('on note selected');
  // navigatorKey.currentState.pushNamed('/history');
}

const MethodChannel platform =
    MethodChannel('dexterx.dev/flutter_local_notifications_example');

class ReceivedNotification {
  ReceivedNotification({
    @required this.id,
    @required this.title,
    @required this.body,
    @required this.payload,
  });

  final int id;
  final String title;
  final String body;
  final String payload;
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print("Handling a background message ${message}");
  var initializationSettingsAndroid =
      new AndroidInitializationSettings('@mipmap/ic_launcher');
  var initializationSettingsIOS = new IOSInitializationSettings();
  var initializationSettings = new InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: onSelectNotification);

  flutterLocalNotificationsPlugin.show(
      1,
      message.data['title'],
      message.data['body'],
      NotificationDetails(
        android: AndroidNotificationDetails(
          '1',
          'general',
          'This channel is used for important notifications.',
          icon:  message.data['imageUrl'],
          styleInformation: BigTextStyleInformation(''),
          importance: Importance.high,
          enableVibration: true,
          playSound: true,

        ),
      ));
}

/// Create a [AndroidNotificationChannel] for heads up notifications

void main() async {
  WidgetsFlutterBinding();
  // WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,

  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  // const MethodChannel('plugins.flutter.io/shared_preferences')
  //     .setMockMethodCallHandler((MethodCall methodCall) async {
  //   if (methodCall.method == 'getAll') {
  //     return <String, dynamic>{}; // set initial values here if desired
  //   }
  //   return null;
  // });



  runApp(MyApp());
}

// Future<void> _configureLocalTimeZone() async {
//   tz.initializeTimeZones();
//   final String timeZoneName = await platform.invokeMethod('getTimeZoneName');
//   tz.setLocalLocation(tz.getLocation(timeZoneName));
// }

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  void initState() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      await Firebase.initializeApp();
      print('Got a message whilst in the foreground!');
      // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
      // If you have skipped STEP 3 then change app_icon to @mipmap/ic_launcher
      var initializationSettingsAndroid =
          new AndroidInitializationSettings('@mipmap/ic_launcher');
      var initializationSettingsIOS = new IOSInitializationSettings();
      var initializationSettings = new InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS);
      flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
      flutterLocalNotificationsPlugin.initialize(initializationSettings,
          onSelectNotification: onSelectNotification);

      flutterLocalNotificationsPlugin.show(
          1,
          message.data['title'],
          message.data['body'],
          NotificationDetails(
            android: AndroidNotificationDetails(
              '1',
              'general',
              'This channel is used for important notifications.',
              styleInformation: BigTextStyleInformation(''),
              importance: Importance.high,
              enableVibration: true,
              playSound: true,

            ),
          ));
    });
    super.initState();
  }
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  Future onSelectNotification(String payload) async {
    print('on note selected $payload');
    // navigatorKey.currentState.pushNamed('/history');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Madhvi',
      debugShowCheckedModeBanner: false,
      theme: kLightTheme,
      navigatorKey: navigatorKey,
      routes: {
        "/home": (_) => new Dashboard(),
        "/history":(_)=> new OrderHistory(AllFrenchisiViewModel()),
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
