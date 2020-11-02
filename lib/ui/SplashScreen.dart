import 'dart:async';
import 'package:cloud_kitchen/ui/slider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    startTime();
    // TODO: implement initState
    initializeFirebase();
    super.initState();
  }


  void initializeFirebase() async{
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
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: SingleChildScrollView(
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/splash_logo.png'),
                  ],
                ),
              ),
            ),
          ),
        )
    );

  }
  startTime() async {
    var _duration = new Duration(seconds:5);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(context,
        new MaterialPageRoute(builder: (BuildContext context) => SliderView()));
  }
}

