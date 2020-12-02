import 'dart:math';

import 'package:cloud_kitchen/local/prefs.dart';
import 'package:cloud_kitchen/ui/otp/OTPVerification.dart';
import 'package:cloud_kitchen/ui/terms/terms.dart';
import 'package:cloud_kitchen/viewmodel/otp/otpviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:regexpattern/regexpattern.dart';

final otpViewModel=OtpViewModel();
class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {


  String errortext=null;
  String mobileno='';
  int maxLength=13;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  MyLocalPrefes myLocalPrefes;



  @override
  void initState() {
    // TODO: implement initState
myLocalPrefes=MyLocalPrefes();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            key: _scaffoldKey,
        backgroundColor: Colors.white,
            body: Observer(
              builder:(_)=> Stack(
                children: [


                  Center(
                    child: SingleChildScrollView(
          child: Container(
                      margin: EdgeInsets.all(20.0),
                              child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,

                    children: [


                    Image.asset(
                      "images/otp.jpg",
                      height: MediaQuery.of(context).size.height*0.30,

                      // height: 400,
                     // width: 300,
                      ),

                               // Text( 'OTP Verification', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30,),),
                     Text( 'OTP Verification', style:Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.w700,color:Colors.black)),
                    SizedBox(
                       height: 10,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      // Text( 'We will send you an ', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal, fontSize: 15,),),
                       Text( 'We will send you an ', style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
                       Text( 'One Time Password',  style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold).copyWith(color:Colors.grey)),
                      ],
                      ),
                    Text( 'on this mobile number',  style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),

                              SizedBox(
                       height: 20,
                    ),



                            TextField(
                              enableSuggestions: true,
        textAlign: TextAlign.start,
        keyboardType: TextInputType.phone,
        autofillHints: [AutofillHints.telephoneNumber],
        maxLength: maxLength,
        onChanged: (str){



                                if(!str.characters.startsWith(Characters('+'))){
                                  setState(() {
                                    maxLength=10;
                                  });
                                }
                                mobileno=str;
                    if(str.length==10){
                      setState(() {
                        errortext=null;
                      });
                    }else{
                      setState(() {
                        errortext="Please enter valid mobile number";
                      });
                    }
        },

                              autofocus: true,

        decoration: new InputDecoration(
          errorText: errortext,
          hintText: 'Enter Mobile Number',
          prefixIcon: Icon(Icons.phone_android),
          border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(2.0),
                    ),
                    borderSide: new BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
          ),
        ),

      ),

                             SizedBox(height: 20),

                        Container(
      //height: 50.0,
      child: GestureDetector(
          onTap: ()  {
                  if(!otpViewModel.isLoading)
          {


                  if(mobileno.trim().length==maxLength) {
                    int otp=new Random().nextInt(888888) + 111111;
                    otpViewModel.mobileVerification(mobileno, '$otp').then((
                        value) async =>
                    {
                      if(value) {
                       await myLocalPrefes.setCustPhone(mobileno),
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>
                                OTPVerification('$otp', mobileno)))
                      } else
                        {
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text("Something went wrong,Please try again."),
                          ))
                        }
                    }).catchError((onError) {});
                  }else{
                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                      content: Text("Enter a valid mobile number"),
                    ));
                  }
                  }
          },
          child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                     color: Theme.of(context).primaryColor,
                    style: BorderStyle.solid,
                    width: 1.0,
                            ),
                           color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(2.0),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                          child: Text(
                             "GET OTP",
                              style:Theme.of(context).textTheme.button.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.white)),

                      ),
                    )
                            ],
                        ),
                    ),
           ),
         ),


                      SizedBox(height: 16,),
                      Text('By continuing you agree to our ',style: Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.grey),),
                      SizedBox(height: 4,),
                      InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> Terms(data: true,)));
                          },

                          child: Text('Terms of Service & Privacy Policy',style: Theme.of(context).textTheme.subtitle2.copyWith(decoration: TextDecoration.underline,color: Colors.grey,fontWeight: FontWeight.w800),)),
                    ],

                    ),
          ),
        ),
                  ),
                  otpViewModel.isLoading?Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black.withOpacity(.3),
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor:AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor) ,
                      ),
                    ),
                  ):Container(),



                ],
              ),
            ),
      ),
    );
  }

  void  _showSnackbar(String msg,bool isPositive) {
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(msg,style: TextStyle(color: Colors.white),),
          duration: Duration(seconds: 3),
          backgroundColor: isPositive?Colors.green:Colors.redAccent,
        ));
  }
}