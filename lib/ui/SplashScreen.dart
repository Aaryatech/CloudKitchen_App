import 'dart:async';
import 'package:cloud_kitchen/local/prefs.dart';
import 'package:cloud_kitchen/ui/home/dashboard.dart';
import 'package:cloud_kitchen/ui/user/locationScreen.dart';
import 'package:cloud_kitchen/ui/user/personalDetail.dart';
import 'package:cloud_kitchen/ui/slider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen();
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  MyLocalPrefes myLocalPrefes;
  @override
  void initState() {

    startTime();

    initializeFirebase();
    super.initState();
  }

  void initializeFirebase() async {
    await Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // decoration: BoxDecoration(
      // image:DecorationImage(image: AssetImage('images/logo.jpeg'))
      // ),

      body: Container(
        color: Theme.of(context).primaryColor,
        child: Center(
          child: Image.asset(
            'images/splash.png',
            height: 250,
            width: 250,
          ),
        ),
      ),
    );
  }

  startTime() {
    myLocalPrefes = MyLocalPrefes();
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    if (!myLocalPrefes.getCustLogin()) {
      print('login status false');
      Navigator.pushReplacement(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => SliderView()));
    } else if (myLocalPrefes.getCustLogin()) {
      print('cust login status true');

      if (await myLocalPrefes.getCustDeatils()) {
        if (!await myLocalPrefes.getCustLocationCapture()) {
          print('cust location status true');

          Navigator.pushReplacement(
              context,
              new MaterialPageRoute(
                  builder: (BuildContext context) => LocationScreen()));
        } else {
          print('cust location status false');

          Navigator.pushReplacement(
              context,
              new MaterialPageRoute(
                  builder: (BuildContext context) => Dashboard()));
        }
      } else {
        print('cust details status false');

        Navigator.pushReplacement(
            context,
            new MaterialPageRoute(
                builder: (BuildContext context) =>
                    PersonalDetail(myLocalPrefes.getCustPhone().toString())));
      }
    }
  }
}
