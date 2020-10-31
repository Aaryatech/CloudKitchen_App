import 'package:cloud_kitchen/ui/MadhviCreadits.dart';
import 'package:cloud_kitchen/ui/contactUs.dart';
import 'package:cloud_kitchen/ui/editProfile.dart';
import 'package:cloud_kitchen/ui/orderHistory.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        body: Container(
          margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
          child:Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  new Container(

                    height: 100,
                    color: Colors.amber,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[

                        Expanded(
                          flex: 1,

                          child:  Container(
                            color: Colors.white,
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Container(
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage('images/profilee.jpg'),
                                  ),
                                ),
                                // new Text("John Doe",
                                //     textScaleFactor: 1.5)
                              ],
                            ),
                          ),

                          //  );

                        ),
                        Expanded(
                            flex: 3,

                            child: Container(
                              color: Colors.white,

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Sumit Mashalkar',
                                   style:Theme.of(context).textTheme.headline6.copyWith(color:Colors.black)),
                                  SizedBox(height: 4,),
                                  Text(
                                      'sumitmashalkar@gmail.com',style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
                                  SizedBox(height: 4,),
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> EditProfile()));

                                    },
                                    child: Row(children: [
                                      Text(
                                        'EDIT PROFILE',style:Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.bold).copyWith(color:Theme.of(context).primaryColor)),
                                      Icon(Icons.edit,color: Theme.of(context).primaryColor,)
                                    ],),
                                  ),

                                ],
                              ),

                            )

                        ),



                      ],
                    ),
                  ),
                SizedBox(height: 8,),

                Divider(color: Colors.grey,),

                  SizedBox(height: 8,),

                Row(
                  children:[
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: (){
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=> OrderHistory()));

                        setState(() {
                          index=1;
                        });

                      },
                      child: Column(
                children:[
                      Icon(Icons.description,color: index==1?Theme.of(context).primaryColor:Colors.black,),
                          Text(
                            'Food Order',style:Theme.of(context).textTheme.subtitle2.copyWith(color:index==1?Theme.of(context).primaryColor:Colors.black)),


                      ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: (){
                        index=0;
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> MadhviCredits()));

                      },
                      child: Column(
                          children:[
                            Icon(Icons.wallpaper,color: Colors.black,),
                            Text(
                              'Wallet',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.black)),

                          ]
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          index=0;
                        });
                      },

                                          child: Column(
                          children:[
                            Icon(Icons.settings,color:index==0?Theme.of(context).primaryColor:Colors.black,),
                            Text(
                              'App Info',style:Theme.of(context).textTheme.subtitle1.copyWith(color:index==0?Theme.of(context).primaryColor:Colors.black)),

                          ]
                      ),
                    ),
                  ),

                  ]
                ),

                  SizedBox(height: 8,),

                  Divider(color: Colors.grey,),

                  SizedBox(height: 8,),

                index==0? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        'APP INFORMATION',style:Theme.of(context).textTheme.subtitle2.copyWith(color:Colors.grey,letterSpacing: 4)),
                      SizedBox(height: 20,),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: [
                          Icon(Icons.restaurant,color: Colors.grey,),
                          SizedBox(width: 8,),
                          Text(
                            'Our restaurents/Outlets',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.black)),

                        ],),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: [
                          Icon(Icons.star,color: Colors.grey,),
                          SizedBox(width: 8,),
                          Text(
                            'Rate Us on Store',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.black)),

                        ],),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: [
                          Icon(Icons.account_box,color: Colors.grey,),
                          SizedBox(width: 8,),
                          Text(
                            'About Us',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.black)),

                        ],),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: [
                          Icon(Icons.notifications,color: Colors.grey,),
                          SizedBox(width: 8,),
                          Text(
                            'Tearms & Conditions',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.black)),

                        ],),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ContactUs()));

                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(children: [
                            Icon(Icons.phone,color: Colors.grey,),
                            SizedBox(width: 8,),
                            Text(
                              'Contact Us',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.black)),

                          ],),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: [
                          Icon(Icons.help,color: Colors.grey,),
                          SizedBox(width: 8,),
                          Text(
                            'Help',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.black)),

                        ],),
                      ),
                    ],
                  ):Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                        'FOOD ORDER',style:Theme.of(context).textTheme.subtitle2.copyWith(color:Colors.grey,letterSpacing: 4)),
                    SizedBox(height: 20,),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> OrderHistory()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: [
                          Icon(Icons.food_bank_rounded,color: Colors.grey,),
                          SizedBox(width: 8,),
                          Text(
                              'Order history',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.black)),
                        ],
                        ),
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: [
                        Icon(Icons.workspaces_outline,color: Colors.grey,),
                        SizedBox(width: 8,),
                        Text(
                            'Grivience',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.black)),
                      ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: [
                        Icon(Icons.account_tree_outlined,color: Colors.grey,),
                        SizedBox(width: 8,),
                        Text(
                            'Current order',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.black)),
                      ],
                      ),
                    ),
                   ],
                  ),
                ],
              ),
            ],
          ),


        ),
      ),
    );
  }
}
