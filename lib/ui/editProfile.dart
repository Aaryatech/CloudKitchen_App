import 'package:cloud_kitchen/ui/deliveryInstruction.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
int id = 1;
String radioButtonItem = 'ONE';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          title: Text('Edit Profile'),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.fromLTRB(20.0,0.0,20.0,20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     SizedBox( height: 10,),
                    CircleAvatar(
                radius: 45,
                backgroundImage: AssetImage('images/profilee.jpg'),

              ),

               Text('User Name Here', style:Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.bold).copyWith(color:Colors.black)),
               Text('usermailidenterhere@gmail.com', style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),

            SizedBox( height: 10,),
Expanded(
                child: Divider(
                   color: Colors.grey,
                )
            ),

              SizedBox( height: 10,),

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
      ),
    ),



 Expanded(
    child: Row(

                mainAxisAlignment: MainAxisAlignment.start,

                children: <Widget>[

                   Text('Gender: ', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal, fontSize: 16,),),

    SizedBox( width: 8, ),

                  Radio(

                    value: 1,

                    groupValue: id,

                    onChanged: (val) {

            setState(() {

              radioButtonItem = 'Male';

              id = 1;

            });

                    },

                  ),

                  Text(

                    'Male',

                    style: new TextStyle(fontSize: 14.0,color: Colors.grey),

                  ),

      SizedBox( width: 4, ),


                  Radio(

                    value: 2,

                    groupValue: id,

                    onChanged: (val) {

            setState(() {

              radioButtonItem = 'Female';

              id = 2;

            });

                    },

                  ),

                  Text(

                    'Female',

                    style: new TextStyle(

            fontSize: 14.0,color: Colors.grey

                    ),

                  ),

    SizedBox( width: 4, ),

     Radio(

                    value: 3,

                    groupValue: id,

                    onChanged: (val) {

            setState(() {

              radioButtonItem = 'Other';

              id = 3;

            });

                    },

                  ),

                  Text(

                    'Other',

                    style: new TextStyle(

            fontSize: 14.0,color: Colors.grey

                    ),

                  ),

    ],

              ),
 ),


  SizedBox( height: 10,),
 TextField(
      textAlign: TextAlign.start,
      keyboardType: TextInputType.emailAddress,
      maxLines: 4,
      decoration: new InputDecoration(
              hintText: 'Address',
              //prefixIcon: Icon(Icons.message),
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
      ),
    ),



SizedBox(height: 20),

              Container(
    //height: 50.0,
    child: GestureDetector(
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> DeliveryInstruction()));
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
                           "SAVE",
                           style:Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.white)),
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