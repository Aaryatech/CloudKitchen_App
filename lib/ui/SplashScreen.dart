import 'dart:async';
import 'package:cloud_kitchen/local/prefs.dart';
import 'package:cloud_kitchen/ui/home/dashboard.dart';
import 'package:cloud_kitchen/ui/user/locationScreen.dart';
import 'package:cloud_kitchen/ui/locationpicker/locationpickerui.dart';
import 'package:cloud_kitchen/ui/user/personalDetail.dart';
import 'package:cloud_kitchen/ui/slider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  MyLocalPrefes myLocalPrefes=MyLocalPrefes();
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
                    Text('Madhvi',style: Theme.of(context).textTheme.headline3.copyWith(color: Colors.white,fontWeight: FontWeight.bold),),
                    Text(' Dairy and Restaurant food delivery app',style: Theme.of(context).textTheme.caption.copyWith(color: Colors.white,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ),
          ),
        )
    );

  }
  startTime() async {
    var _duration = new Duration(seconds:3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    if (!myLocalPrefes.getCustLogin()) {
      print('login status false');
      Navigator.pushReplacement(context,
          new MaterialPageRoute(
              builder: (BuildContext context) => SliderView()));
    }else if(myLocalPrefes.getCustLogin()){
      print('cust login status true');

       if(myLocalPrefes.getCustDeatils()){

       if(!myLocalPrefes.getCustLocationCapture())
       {

         print('cust location status true');

         Navigator.pushReplacement(context,
             new MaterialPageRoute(
                 builder: (BuildContext context) => LocationScreen()));
       }else {
         print('cust location status false');

         Navigator.pushReplacement(context,
             new MaterialPageRoute(
                 builder: (BuildContext context) => Dashboard()));
       }
       }else{
         print('cust details status false');

         Navigator.pushReplacement(context,
             new MaterialPageRoute(
                 builder: (BuildContext context) => PersonalDetail(myLocalPrefes.getCustPhone().toString())));

       }
    }
  }
  }

