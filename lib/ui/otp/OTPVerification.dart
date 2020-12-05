import 'package:cloud_kitchen/local/prefs.dart';
import 'package:cloud_kitchen/ui/otp/OTPScreen.dart';
import 'package:cloud_kitchen/ui/user/personalDetail.dart';
import 'package:cloud_kitchen/viewmodel/otp/otpviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pin_put/pin_put.dart';


final otpViewModel=OtpViewModel();
class OTPVerification extends StatefulWidget {
  OTPVerification(this.otp,this.mobileNumber);

  final String otp;
  final String mobileNumber;

  @override
  _OTPVerificationState createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {


  String enterdOtp;
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  MyLocalPrefes myLocalPrefes;
  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

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
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Text("OTP Verification",style:Theme.of(context).textTheme.subtitle1),
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
                  height: MediaQuery.of(context).size.height*0.30,
                  ),

                  SizedBox(
                    height: 35,
                  ),

                  Text( 'OTP Verification', style:Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.w700,color:Colors.black.withOpacity(0.8))),
                  SizedBox(
                   height: 10,
                ),

                           Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Text( 'Enter the OTP send to ', style:Theme.of(context).textTheme.subtitle2.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
                   Text(widget.mobileNumber.length==10?'+91${widget.mobileNumber}':'${widget.mobileNumber}', style:Theme.of(context).textTheme.subtitle2.copyWith(fontWeight: FontWeight.w500).copyWith(color:Colors.black)),
                  ],
                  ),

                          SizedBox(
                   height: 20,
                ),


              PinPut(
                fieldsCount: 6,
                onSubmit: ((String pin)  {
                  if(pin==widget.otp){
                    _showSnackbar('Success', true);
                    myLocalPrefes.setCustLogin(true);

                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> PersonalDetail(widget.mobileNumber)));

                  }else{
          _showSnackbar('OTP does not match,Please try agian', false);

          }

                }),
                focusNode: _pinPutFocusNode,
                controller: _pinPutController,
                submittedFieldDecoration: _pinPutDecoration.copyWith(
                  borderRadius: BorderRadius.circular(20.0),
                ),

                selectedFieldDecoration: _pinPutDecoration,
                followingFieldDecoration: _pinPutDecoration.copyWith(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Theme.of(context).primaryColor.withOpacity(.5),
                  ),
                ),
              ),


                         SizedBox(height: 16),

                           Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Text( 'Didnt receive the code?', style:Theme.of(context).textTheme.subtitle2.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
                   // Padding(
                   //    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                   //   child: Text( 'Resend now', style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold,),),
                   //  // child: Text( 'RESEND NOW', style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey).copyWith((decoration: TextDecoration.underline)),
                   // )

                    SizedBox(width: 4,),
                    InkWell(onTap: (){
                      otpViewModel.mobileVerification(widget.mobileNumber, widget.otp).then((value) => {

                         if(value){
                           _showSnackbar('Otp is Send to ${widget.mobileNumber}', true)
                         }else{
                      _showSnackbar('Something went wrong,Please try again.', true)

                      }

                      }).catchError((onError){
                        _showSnackbar('Something went wrong,Please try again.', true);

                      });


                    }, child:Text('Resend Now',style:Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.normal,color:Colors.red,decoration: TextDecoration.underline))),
                  ],
                  ),

                   SizedBox(height: 20),

          Container(
    //  height: 50.0,
      child: GestureDetector(
          onTap: () {

              myLocalPrefes.setCustLogin(true);
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> PersonalDetail(widget.mobileNumber)));
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
                      child: Text(
                         "Verify & Proceed",
                          style:Theme.of(context).textTheme.button.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.white)),
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


 void  _showSnackbar(String msg,bool isPositive) {
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(msg,style: TextStyle(color: Colors.white),),
          duration: Duration(seconds: 3),
          backgroundColor: isPositive?Colors.green:Colors.redAccent,
        ));
  }
}