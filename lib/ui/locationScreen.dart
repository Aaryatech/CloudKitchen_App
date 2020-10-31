import 'package:cloud_kitchen/ui/contactUs.dart';
import 'package:cloud_kitchen/ui/dashboard.dart';
import 'package:cloud_kitchen/ui/tackaway.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final scaffoldState = GlobalKey<ScaffoldState>();


  void showImagePickerBottomSheet(BuildContext context){
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        enableDrag: true,
        builder: (BuildContext bc){
          return StatefulBuilder(
          builder: (context, setState) {

            return SafeArea(
              child: Container(
                color: Colors.white.withOpacity(0.5),
                width: MediaQuery
                    .of(context)
                    .size
                    .width,

                padding: EdgeInsets.only(left: 16,right: 16,bottom: 16,top: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Search Location",style: Theme.of(context).textTheme.headline6,),

                        IconButton(icon: Icon(Icons.close,), onPressed:(){
                          Navigator.pop(context);
                        })
                      ],
                    ),

                    SizedBox(
                      height: 4,
                    ),
                   TextFormField(
                     enabled: true,
                     decoration: InputDecoration(
                       border: OutlineInputBorder(),
                       prefixIcon: Icon(Icons.search),
                       suffix: Icon(Icons.close),
                       hintText: 'Search Your Place',
                       filled: true,
                       fillColor: Colors.white,
                       isDense: true,
                     ),
                   ),

                    SizedBox(height:
                      8,),

                    SingleChildScrollView(
                      child: Container(
                        height: MediaQuery.of(context).size.height*.30,
                        child: InkWell(
                          onTap: (){
                            Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
                          },
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            children: [
                              ListTile(
                                leading: Icon(Icons.location_on_outlined),
                                title: Text('Canada Corner'),
                                subtitle: Text('College Road, Nashik, Maharastra, India '),
                              ),

                              ListTile(
                                leading: Icon(Icons.location_on_outlined),
                                title: Text('Canada Corner'),
                                subtitle: Text('College Road, Nashik, Maharastra, India '),
                              ),

                              ListTile(
                                leading: Icon(Icons.location_on_outlined),
                                title: Text('Canada Corner'),
                                subtitle: Text('College Road, Nashik, Maharastra, India '),
                              ),


                              ListTile(
                                leading: Icon(Icons.location_on_outlined),
                                title: Text('Canada Corner'),
                                subtitle: Text('College Road, Nashik, Maharastra, India '),
                              ),


                              ListTile(
                                leading: Icon(Icons.location_on_outlined),
                                title: Text('Canada Corner'),
                                subtitle: Text('College Road, Nashik, Maharastra, India '),
                              ),


                              ListTile(
                                leading: Icon(Icons.location_on_outlined),
                                title: Text('Canada Corner'),
                                subtitle: Text('College Road, Nashik, Maharastra, India '),
                              ),

                              ListTile(
                                leading: Icon(Icons.location_on_outlined),
                                title: Text('Canada Corner'),
                                subtitle: Text('College Road, Nashik, Maharastra, India '),
                              ),


                            ],
                          ),
                        ),
                      ),
                    ),







                  ],
                ),
              ),
            );
          }
      );
    }

    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
          body: Center(
                      child: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.all(20.0),
                    child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                      Image.asset(
            "images/location.png",
           height: MediaQuery.of(context).size.height*0.30,
           // height: 400,
           // width: 300,
            ),

                        SizedBox(height: 20),


                        Text( 'Hi, nice to meet you!', style:Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.w700,color:Colors.black)),
                      SizedBox(
             height: 10,
                      ),
                      Text( 'Set your location to start exploring', style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
                      Text( 'restaurants around you', style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),

                    SizedBox(
             height: 20,
                      ),


                   SizedBox(height: 20),

        Container(
   // height: 50.0,
    child: GestureDetector(
        onTap: () {
          Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
        },
        child: Container(
          padding: EdgeInsets.all(8),
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
                      Icon(Icons.gps_fixed_outlined, color: Colors.white,),
                                             SizedBox(width: 8,),
                                             Text( "USE CURRENT LOCATION",
                           style:Theme.of(context).textTheme.button.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.white))
                  ],
              ),
        ),
    ),
),
SizedBox(height: 20),

 InkWell(
     onTap:(){ showImagePickerBottomSheet(context);},
     child: Text( 'SET YOUR LOCATION MANUALLY', style:Theme.of(context).textTheme.button.copyWith(fontWeight: FontWeight.bold).copyWith(color:Theme.of(context).primaryColor))),

 SizedBox(height: 40),
  Text( 'We only access your location while you are using the app to improve your experience',style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
  // Text( '', style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
                      ],

                      ),
        ),
      ),
          ),
    );
  }
}