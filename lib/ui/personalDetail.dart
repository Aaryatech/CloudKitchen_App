import 'package:cloud_kitchen/network/model/request/SaveCustomer.dart';
import 'package:cloud_kitchen/ui/OTPVerification.dart';
import 'package:cloud_kitchen/ui/locationScreen.dart';
import 'package:cloud_kitchen/viewmodel/personaldetailsviewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


PersonalDetailsViewModel personalDetailsViewModel=PersonalDetailsViewModel();

class PersonalDetail extends StatefulWidget {
  PersonalDetail(this.userMobile);

final  String userMobile;
  @override
  _PersonalDetailState createState() => _PersonalDetailState();
}

class _PersonalDetailState extends State<PersonalDetail> {



  @override
  void initState() {
    // TODO: implement initState
    initializeFirebase();
    super.initState();
  }

  void initializeFirebase() async{
    await Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Text("Personal Details",style:Theme.of(context).textTheme.headline6),
              iconTheme: IconThemeData(
                color: Colors.black, //change your color here
              ),
            ),
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.all(20.0),
                      child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

            children: [

              personalDetailsViewModel.isLoading?LinearProgressIndicator():Container(),
              otpViewModel.isLoading?LinearProgressIndicator():Container(),

                 SizedBox(height: 16,),

                 Image.asset(
              "images/personal_detail.jpg",
                   height: MediaQuery.of(context).size.height*0.25,

                   // height: 400,
           //   width: 300,
              ),


                       SizedBox(height: 24,),

                       Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Text( 'Tell us a bit more about yourself', style:Theme.of(context).textTheme.subtitle2.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),

              ],
              ),

                      SizedBox(
               height: 30,
            ),


                    Container(
                      padding: EdgeInsets.only(left: 8,right: 8),
                      child: Column(
                        children: [


                          TextField(
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.text,
                            decoration: new InputDecoration(
                              hintText: 'Enter Your Name',
                              prefixIcon: Icon(Icons.person),
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

                          SizedBox( height: 16,),

                          TextField(
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.emailAddress,
                            decoration: new InputDecoration(
                              hintText: 'Enter Your Email Address',
                              prefixIcon: Icon(Icons.email),
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


                          SizedBox(height: 16),

                          Container(
                            // height: 50.0,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LocationScreen()));
                                // SaveCustomer saveCustomer=SaveCustomer();
                                // saveCustomer.phoneNumber=widget.userMobile;
                                // saveCustomer.custName='';
                                // saveCustomer.emailId='';
                                // saveCustomer.cityId=0;
                                //
                                // personalDetailsViewModel.saveUserDetails(saveCustomer);

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
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Center(
                                        child: Text(
                                            "CONTINUE",
                                            style:Theme.of(context).textTheme.button.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.white)),

                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),

        SizedBox(height: 24),

Row(
      children: <Widget>[
          Expanded(
              child: Divider(
                color: Colors.grey,
              )
          ),

          Text( 'OR SIGNUP USING', style:Theme.of(context).textTheme.caption),

          Expanded(
              child: Divider(
                 color: Colors.grey,
              )
          ),
      ]
),



 SizedBox(height: 16),
           Row(
              mainAxisAlignment: MainAxisAlignment.center,
                  children: [
            InkWell(
              onTap: (){
                personalDetailsViewModel.signInWithFacebook();
              },
              child: Image.asset(
                "images/facebook.png",
                height: 45,
               width: 50,
                ),
            ),

                      SizedBox(
            width: 8,
                      ),

            InkWell(
              onTap: (){
                personalDetailsViewModel.signInWithGoogle();
              },
              child: Image.asset(
                "images/google_icon.png",
                height: 45,
                width: 50,
                ),
            ),
                  ],
                ),

            ],

            ),
          ),
        ),
      ),
    );
  }




}