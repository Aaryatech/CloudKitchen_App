import 'package:cloud_kitchen/ui/OTPScreen.dart';
import 'package:cloud_kitchen/ui/personalDetail.dart';
import 'package:flutter/material.dart';


class OTPVerification extends StatefulWidget {
  @override
  _OTPVerificationState createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Text("OTP Verification",style:Theme.of(context).textTheme.subtitle1),
              iconTheme: IconThemeData(
                color: Colors.black, //change your color here
              ),
            ),
            body: Center(
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

                Text( 'OTP Verification', style:Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.bold,color:Colors.black)),
                SizedBox(
                 height: 10,
              ),

                         Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Text( 'Enter the OTP send to ', style:Theme.of(context).textTheme.subtitle2.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
                 Text( '+91- 1234567890', style:Theme.of(context).textTheme.subtitle2.copyWith(fontWeight: FontWeight.w500).copyWith(color:Colors.black)),
                ],
                ),

                        SizedBox(
                 height: 20,
              ),



      //               TextField(
      //   textAlign: TextAlign.start,
      //   keyboardType: TextInputType.number,
      //   decoration: new InputDecoration(
      //     hintText: 'Enter Mobile Number',
      //     prefixIcon: Icon(Icons.mobile_screen_share),
      //     border: new OutlineInputBorder(
      //       borderRadius: const BorderRadius.all(
      //         const Radius.circular(2.0),
      //       ),
      //       borderSide: new BorderSide(
      //         color: Colors.black,
      //         width: 1.0,
      //       ),
      //     ),
      //   ),
      // ),


       Row(
         mainAxisAlignment: MainAxisAlignment.center,
               children: [
          Container(
              alignment: Alignment.center,
              height: 50,
              width: 50,
              child: TextField(
       style: TextStyle(
           fontWeight: FontWeight.bold, fontSize: 23, color: Colors.grey),
       keyboardType: TextInputType.number,
       maxLength: 1,
       decoration: InputDecoration(border: InputBorder.none, counterText: ''),
       textAlign: TextAlign.center,
              ),
              decoration:
         BoxDecoration(border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(2.0),
         ),
      ),

 SizedBox( width: 4, ),

          Container(
              alignment: Alignment.center,
              height: 50,
              width: 50,
              child: TextField(
       style: TextStyle(
           fontWeight: FontWeight.bold, fontSize: 23, color: Colors.grey),
       keyboardType: TextInputType.number,
       maxLength: 1,
       decoration: InputDecoration(border: InputBorder.none, counterText: ''),
       textAlign: TextAlign.center,
              ),
              decoration:
         BoxDecoration(border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(2.0),
         ),
      ),

SizedBox( width: 4, ),

          Container(
              alignment: Alignment.center,
              height: 50,
              width: 50,
              child: TextField(
       style: TextStyle(
           fontWeight: FontWeight.bold, fontSize: 23, color: Colors.grey),
       keyboardType: TextInputType.number,
       maxLength: 1,
       decoration: InputDecoration(border: InputBorder.none, counterText: ''),
       textAlign: TextAlign.center,
              ),
              decoration:
         BoxDecoration(border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(2.0),
         ),
      ),

SizedBox( width: 4, ),

          Container(
              alignment: Alignment.center,
              height: 50,
              width: 50,
              child: TextField(
       style: TextStyle(
           fontWeight: FontWeight.bold, fontSize: 23, color: Colors.grey),
       keyboardType: TextInputType.number,
       maxLength: 1,
       decoration: InputDecoration(border: InputBorder.none, counterText: ''),
       textAlign: TextAlign.center,
              ),
              decoration:
         BoxDecoration(border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(2.0),
         ),
      ),

      SizedBox( width: 4, ),

          Container(
              alignment: Alignment.center,
              height: 50,
              width: 50,
              child: TextField(
       style: TextStyle(
           fontWeight: FontWeight.bold, fontSize: 23, color: Colors.grey),
       keyboardType: TextInputType.number,
       maxLength: 1,
       decoration: InputDecoration(border: InputBorder.none, counterText: ''),
       textAlign: TextAlign.center,
              ),
              decoration:
         BoxDecoration(border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(2.0),
         ),
      ),

      SizedBox( width: 4, ),

          Container(
              alignment: Alignment.center,
              height: 50,
              width: 50,
              child: TextField(
       style: TextStyle(
           fontWeight: FontWeight.bold, fontSize: 23, color: Colors.grey),
       keyboardType: TextInputType.number,
       maxLength: 1,
       decoration: InputDecoration(border: InputBorder.none, counterText: ''),
       textAlign: TextAlign.center,
              ),
              decoration:
         BoxDecoration(border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(2.0),
         ),
      ),
               ],
         ),



                       SizedBox(height: 30),

                         Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Text( 'Didnt receive the code? ', style:Theme.of(context).textTheme.subtitle2.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
                 Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                   child: Text( 'Resend now', style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold,),),
                  // child: Text( 'RESEND NOW', style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey).copyWith((decoration: TextDecoration.underline)),
                 )
                ],
                ),

                 SizedBox(height: 20),

          Container(
    //  height: 50.0,
      child: GestureDetector(
          onTap: () {
               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> PersonalDetail()));
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
                       "VERIFY & PROCEED",
                        style:Theme.of(context).textTheme.button.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.white)),
                ),
              )
                      ],
                  ),
          ),
      ),
)




              ],

              ),
          ),
        ),
            ),
      ),
    );
  }
}