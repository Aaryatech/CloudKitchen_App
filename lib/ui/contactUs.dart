import 'package:cloud_kitchen/ui/editProfile.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          title: Text('Contact Us'),
        ),
        body: SingleChildScrollView(
                  child: Container(
            margin: EdgeInsets.fromLTRB(20.0,0.0,20.0,20.0),
                    child: Column(

                children: [
                          Image.asset(
                "images/contact-us.jpg",
                 height: MediaQuery.of(context).size.height*0.30,

                            // height: 400,
               // width: 300,
                ),

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
          isDense: true

      ),
    ),

      SizedBox( height: 10,),

       TextField(
      textAlign: TextAlign.start,
      keyboardType: TextInputType.number,
      decoration: new InputDecoration(
            hintText: 'Enter Your Phone Number',
            prefixIcon: Icon(Icons.mobile_screen_share),
            border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(2.0),
              ),
              borderSide: new BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
      isDense: true
      ),
    ),

      SizedBox( height: 10,),

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
          isDense: true

      ),

       ),

  SizedBox( height: 10,),
 TextField(
      textAlign: TextAlign.start,
      keyboardType: TextInputType.emailAddress,
      maxLines: 4,
      decoration: new InputDecoration(
            hintText: 'Enter Your Message',
            //prefixIcon: Icon(Icons.message),
          // icon: Icon(Icons.question_answer),
            prefixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(start: 0.0),
            child: Icon(Icons.question_answer), // Change this icon as per your requirement
          ),
            border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(2.0),
              ),
              borderSide: new BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
          isDense: true

      ),
    ),


SizedBox(height: 20),

            Container(
    //height: 50.0,
    child: GestureDetector(
            onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=> EditProfile()));
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
                                   "SEND MESSAGE",
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
    );
  }
}