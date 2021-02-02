import 'package:cloud_kitchen/local/prefs.dart';
import 'package:cloud_kitchen/ui/otp/OTPScreen.dart';
import 'package:cloud_kitchen/ui/user/personalDetail.dart';
import 'package:cloud_kitchen/viewmodel/con/internet.dart';
import 'package:cloud_kitchen/viewmodel/otp/otpviewmodel.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:sms_autofill/sms_autofill.dart';

final otpViewModel = OtpViewModel();

class OTPVerification extends StatefulWidget {
  OTPVerification(this.otp, this.mobileNumber);

  final String otp;
  final String mobileNumber;

  @override
  _OTPVerificationState createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  String enterdOtp;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextEditingController _pinPutController = TextEditingController();

  MyLocalPrefes myLocalPrefes;

  bool isNetWorkAvailable = true;
  ReactionDisposer _disposer;
  ConnectivityStore connectivityStore = ConnectivityStore();
  @override
  void initState() {
    // TODO: implement initState

    _disposer =
        reaction((_) => connectivityStore.connectivityStream.value, (result) {
      if (result == ConnectivityResult.none) {
        setState(() {
          isNetWorkAvailable = false;
        });
      } else {
        setState(() {
          isNetWorkAvailable = true;
        });
      }
    });

    myLocalPrefes = MyLocalPrefes();
    listenForCode();
    super.initState();
  }

  listenForCode() async {
    await SmsAutoFill().listenForCode;

    SmsAutoFill().getAppSignature.then((value) => {
          print('############${value}#######'),
        });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    SmsAutoFill().unregisterListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text("OTP Verification",
              style: Theme.of(context).textTheme.subtitle1),
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
        body: Container(
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "images/otp2.jpg",
                      height: MediaQuery.of(context).size.height * 0.30,
                    ),

                    SizedBox(
                      height: 35,
                    ),

                    Text('OTP Verification',
                        style: Theme.of(context).textTheme.headline5.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Colors.black.withOpacity(0.8))),
                    SizedBox(
                      height: 10,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Enter the OTP send to ',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                .copyWith(fontWeight: FontWeight.normal)
                                .copyWith(color: Colors.grey)),
                        Text(
                            widget.mobileNumber.length == 10
                                ? '+91${widget.mobileNumber}'
                                : '${widget.mobileNumber}',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                .copyWith(fontWeight: FontWeight.w500)
                                .copyWith(color: Colors.black)),
                      ],
                    ),

                    SizedBox(
                      height: 20,
                    ),



                    PinFieldAutoFill(
                        // UnderlineDecoration, BoxLooseDecoration or BoxTightDecoration see https://github.com/TinoGuo/pin_input_text_field for more info,
                        currentCode: '', // prefill with a code
                        controller: _pinPutController,
                        //code submitted callback
                        onCodeChanged: (str) async {
                          if (str.length == 6) {
                            if (str == widget.otp) {

                              await myLocalPrefes.setCustLogin(true);
                                  Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PersonalDetail(widget.mobileNumber)));


                            } else {
                              _showSnackbar(
                                  'Please enter valid OTP or click resend',
                                  false);
                            }
                          }
                        }, //code changed callback

                        codeLength: 6 //code length, default 6
                        ),

                    SizedBox(height: 16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Didnt receive the code?',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                .copyWith(fontWeight: FontWeight.normal)
                                .copyWith(color: Colors.grey)),
                        // Padding(
                        //    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        //   child: Text( 'Resend now', style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold,),),
                        //  // child: Text( 'RESEND NOW', style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey).copyWith((decoration: TextDecoration.underline)),
                        // )

                        SizedBox(
                          width: 4,
                        ),
                        InkWell(
                            onTap: () {
                              if (isNetWorkAvailable) {
                                otpViewModel
                                    .mobileVerification(
                                        widget.mobileNumber, widget.otp)
                                    .then((value) => {
                                          if (value)
                                            {
                                              _showSnackbar(
                                                  'Otp is Send to ${widget.mobileNumber}',
                                                  true)
                                            }
                                          else
                                            {
                                              _showSnackbar(
                                                  'Something went wrong,Please try again.',
                                                  true)
                                            }
                                        })
                                    .catchError((onError) {
                                  _showSnackbar(
                                      'Something went wrong,Please try again.',
                                      true);
                                });
                              } else {
                                _showSnackbar(
                                    'Please check internet connection', false);
                              }
                            },
                            child: Text('Resend Now',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.red,
                                        decoration: TextDecoration.underline))),
                      ],
                    ),

                    SizedBox(height: 20),

                    Container(
                      //  height: 50.0,
                      child: GestureDetector(
                        onTap: () {
                          if (isNetWorkAvailable) {
                            myLocalPrefes.setCustLogin(true);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PersonalDetail(widget.mobileNumber)));
                          } else {
                            _showSnackbar(
                                'Please check internet connection', false);
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
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Center(
                                  child: Text("Verify & Proceed",
                                      style: Theme.of(context)
                                          .textTheme
                                          .button
                                          .copyWith(
                                              fontWeight: FontWeight.normal)
                                          .copyWith(color: Colors.white)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showSnackbar(String msg, bool isPositive) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        msg,
        style: TextStyle(color: Colors.white),
      ),
      duration: Duration(seconds: 3),
      backgroundColor: isPositive ? Colors.green : Colors.redAccent,
    ));
  }
}
