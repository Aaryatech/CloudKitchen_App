import 'package:cloud_kitchen/ui/OTPVerification.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        backgroundColor: Colors.white,
            body: Center(
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
        keyboardType: TextInputType.number,
        decoration: new InputDecoration(
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
          onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> OTPVerification()));
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