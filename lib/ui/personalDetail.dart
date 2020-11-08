import 'package:cloud_kitchen/network/model/request/SaveCustomer.dart';
import 'package:cloud_kitchen/ui/OTPVerification.dart';
import 'package:cloud_kitchen/ui/locationScreen.dart';
import 'package:cloud_kitchen/viewmodel/personaldetailsviewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_sign_in/google_sign_in.dart';


PersonalDetailsViewModel personalDetailsViewModel=PersonalDetailsViewModel();

class PersonalDetail extends StatefulWidget {
  PersonalDetail(this.userMobile);

final  String userMobile;
  @override
  _PersonalDetailState createState() => _PersonalDetailState();
}

class _PersonalDetailState extends State<PersonalDetail> {


  final usernameController = TextEditingController();
  final emailController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    initializeFirebase();
    personalDetailsViewModel.getUserDetailsIfExist(widget.userMobile);
    personalDetailsViewModel.setupValidations();
    super.initState();
  }

  void initializeFirebase() async{
    await Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            key: _scaffoldKey,
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
          child: Observer(
            builder: (_) {
              usernameController.text= personalDetailsViewModel.username;
              emailController.text=personalDetailsViewModel.email;

              return Container(
                margin: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    personalDetailsViewModel.isLoading
                        ? LinearProgressIndicator()
                        : Container(),
                    otpViewModel.isLoading
                        ? LinearProgressIndicator()
                        : Container(),

                    SizedBox(height: 16,),

                    Image.asset(
                      "images/personal_detail.jpg",
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.25,

                      // height: 400,
                      //   width: 300,
                    ),


                    SizedBox(height: 24,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Tell us a bit more about yourself', style: Theme
                            .of(context)
                            .textTheme
                            .subtitle2
                            .copyWith(fontWeight: FontWeight.normal)
                            .copyWith(color: Colors.grey)),

                      ],
                    ),

                    SizedBox(
                      height: 30,
                    ),


                    Container(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Column(
                        children: [
                          TextField(
                            controller: usernameController,
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.text,
                            onChanged: (str){
                            personalDetailsViewModel.username=str;
                            },
                            decoration: new InputDecoration(
                              hintText: 'Enter Your Name',
                              errorText: personalDetailsViewModel
                                  .personalDetailsErrorState.username,
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

                          SizedBox(height: 16,),

                          TextField(
                            controller: emailController,
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (str) {
                              personalDetailsViewModel.email=str;
                              },
                            decoration: new InputDecoration(
                              hintText: 'Enter Your Email Address',
                              errorText: personalDetailsViewModel
                                  .personalDetailsErrorState.email,

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

              if(!personalDetailsViewModel.personalDetailsErrorState.hasErrors)
              { SaveCustomer saveCustomer = SaveCustomer();
              saveCustomer.phoneNumber = widget.userMobile;
              saveCustomer.custName = personalDetailsViewModel.username;
              saveCustomer.emailId = personalDetailsViewModel.email;
              saveCustomer.custId = personalDetailsViewModel.myLocalPrefes.getCustId();
              saveCustomer.whatsappNo="";
              saveCustomer.profilePic="";
              saveCustomer.gender=1;
              saveCustomer.custDob="2020-10-10";
              saveCustomer.ageGroup="";
              saveCustomer.langId=1;
              saveCustomer.compId=1;
              saveCustomer.cityId=1;
              saveCustomer.frId=0;
              saveCustomer.isBuissHead=0;
              saveCustomer.companyName="";
              saveCustomer.gstNo="";
              saveCustomer.address="";
              saveCustomer.isActive=0;
              saveCustomer.delStatus=0;
              saveCustomer.custAddPlatform=2;
              saveCustomer.custAddDatetime="2020-10-23 10:30:50";
              saveCustomer.addedFromType="2";
              saveCustomer.userId=0;
              saveCustomer.isPremiumCust=0;
              saveCustomer.exInt1=0;
              saveCustomer.exInt2=0;
              saveCustomer.exInt3=0;
              saveCustomer.exInt4=0;
              saveCustomer.exInt5=0;
              saveCustomer.exVar1="";
              saveCustomer.exVar2="";
              saveCustomer.exVar3="";
              saveCustomer.exVar4="";
              saveCustomer.exVar5="";
              saveCustomer.exFloat1=0;
              saveCustomer.exFloat2=0;
              saveCustomer.exFloat3=0;
              saveCustomer.exFloat4=0;
              saveCustomer.exFloat5=0;


              personalDetailsViewModel.saveUserDetails(
              saveCustomer).then((value) => {
              if(value){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LocationScreen())),

              }else{
              _showSnackbar(personalDetailsViewModel.errorMessage, false),

              }
              });
              }else{
              _showSnackbar("Please enter valid details", false);

              };
              }, child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Theme
                                        .of(context)
                                        .primaryColor,
                                    style: BorderStyle.solid,
                                    width: 1.0,
                                  ),
                                  color: Theme
                                      .of(context)
                                      .primaryColor,
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
                                            style: Theme
                                                .of(context)
                                                .textTheme
                                                .button
                                                .copyWith(
                                                fontWeight: FontWeight.normal)
                                                .copyWith(color: Colors.white)),

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

                          Text('OR SIGNUP USING', style: Theme
                              .of(context)
                              .textTheme
                              .caption),

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
                          onTap: () {
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
                          onTap: () {
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
              );
            }
          ),
        ),
      ),
    );
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void  _showSnackbar(String msg,bool isPositive) {
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(msg,style: TextStyle(color: Colors.white),),
          duration: Duration(seconds: 3),
          backgroundColor: isPositive?Colors.green:Colors.redAccent,
        ));
  }
}