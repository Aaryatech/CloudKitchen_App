import 'dart:io';

import 'package:cloud_kitchen/ui/cantact/contactUs_2.dart';
import 'package:cloud_kitchen/ui/grivience/grievance_1.dart';
import 'package:cloud_kitchen/ui/terms/terms.dart';
import 'package:cloud_kitchen/ui/wallet/MadhviCreadits.dart';
import 'package:cloud_kitchen/ui/user/editProfile.dart';
import 'package:cloud_kitchen/ui/order/orderHistory.dart';
import 'package:cloud_kitchen/viewmodel/franchisi/frviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  AllFrenchisiViewModel allFrenchisiViewModel;
  ProfileScreen(this.allFrenchisiViewModel);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  int index = 0;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Observer(
        builder:(_) =>Scaffold(
          backgroundColor: Colors.white,

          body: SingleChildScrollView(
            child: Container(
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

                            // Expanded(
                            //   flex: 1,
                            //
                            //   child:  Container(
                            //     color: Colors.white,
                            //     child: new Column(
                            //       crossAxisAlignment: CrossAxisAlignment.center,
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       children: <Widget>[
                            //         new Container(
                            //           child: CircleAvatar(
                            //             radius: 30,
                            //             backgroundImage: AssetImage('images/lo.jpg'),
                            //           ),
                            //         ),
                            //         // new Text("John Doe",
                            //         //     textScaleFactor: 1.5)
                            //       ],
                            //     ),
                            //   ),
                            //
                            //   //  );
                            //
                            // ),
                            Expanded(
                                flex: 3,

                                child: Container(
                                  color: Colors.white,
                                  padding: EdgeInsets.all(16),

                                  child: Observer(
                                    builder:(_)=> Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          widget.allFrenchisiViewModel.custName??"",
                                         style:Theme.of(context).textTheme.headline6.copyWith(color:Colors.black)),
                                        SizedBox(height: 4,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                widget.allFrenchisiViewModel.getCustMobile(),style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
                                            SizedBox(width: 8,),

                                            InkWell(
                                              onTap: (){
                                                Navigator.push(context, MaterialPageRoute(builder: (context)=> EditProfile(widget.allFrenchisiViewModel)));

                                              },
                                              child: Text(
                                                  'EDIT PROFILE',style:Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.bold).copyWith(color:Theme.of(context).primaryColor)),
                                            ),
                                          ],
                                        ),



                                      ],
                                    ),
                                  ),

                                )

                            ),



                          ],
                        ),
                      ),

                    Divider(color: Colors.grey,),

                      SizedBox(height: 4,),

                    Row(
                      children:[
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: (){
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=> OrderHistory()));

                            setState(() {
                              index=0;
                            });

                          },
                          child: Column(
                    children:[
                          Icon(Icons.description,color: index==0?Theme.of(context).primaryColor:Colors.black,),
                              Text(
                                'Food Order',style:Theme.of(context).textTheme.subtitle2.copyWith(color:index==0?Theme.of(context).primaryColor:Colors.black)),


                          ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: (){
                            index=1;
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> MadhviCredits()));

                          },
                          child: Column(
                              children:[
                                Icon(Icons.account_balance_wallet_rounded,color:index==1?Theme.of(context).primaryColor:Colors.black,),
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
                              index=01;
                            });
                          },

                                              child: Column(
                              children:[
                                Icon(Icons.settings,color:index==1?Theme.of(context).primaryColor:Colors.black,),
                                Text(
                                  'App Info',style:Theme.of(context).textTheme.subtitle1.copyWith(color:index==1?Theme.of(context).primaryColor:Colors.black)),

                              ]
                          ),
                        ),
                      ),

                      ]
                    ),

                      SizedBox(height: 8,),

                      Divider(color: Colors.grey,),

                      SizedBox(height: 8,),

                    index==1? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            'APP INFORMATION',style:Theme.of(context).textTheme.subtitle2.copyWith(color:Colors.grey,letterSpacing: 4)),
                          SizedBox(height: 20,),

                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: Row(children: [
                          //     Icon(Icons.restaurant,color: Colors.grey,),
                          //     SizedBox(width: 8,),
                          //     Text(
                          //       'Our restaurents/Outlets',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.black)),
                          //
                          //   ],),
                          // ),

                          InkWell(
                            onTap: (){

//Launch the Review Flow.
                              launch('https://play.google.com/store/apps/details?id=com.madhvi.cloudkitchen');
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(children: [
                                Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey.withOpacity(0.2)
                                    ),
                                    padding: EdgeInsets.all(6),
                                    child: Icon(Icons.star,color: Colors.grey,size: 18,)),
                                SizedBox(width: 8,),
                                Text(
                                  'Rate Us on Store',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.black)),

                              ],),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> Terms(data: false,)));
                            },

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(children: [
                                Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey.withOpacity(0.2)
                                    ),
                                    padding: EdgeInsets.all(6),
                                    child: Image.asset('images/about_icon.png',color: Colors.grey,width: 16,height: 16,)),
                                SizedBox(width: 8,),
                                Text(
                                  'About Us',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.black)),

                              ],),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> Terms(data: true,)));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(children: [
                                Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey.withOpacity(0.2)
                                    ),
                                    padding: EdgeInsets.all(6),
                                    child: Icon(Icons.notifications,color: Colors.grey,size: 18,)),
                                SizedBox(width: 8,),
                                Text(
                                  'Tearms & Conditions',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.black)),

                              ],),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> ContactUs()));

                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(children: [
                                Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey.withOpacity(0.2)
                                    ),
                                    padding: EdgeInsets.all(6),
                                    child: Icon(Icons.phone,color: Colors.grey,size: 18,)),
                                SizedBox(width: 8,),
                                Text(
                                  'Contact Us',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.black)),

                              ],),
                            ),
                          ),

                          InkWell(
                            onTap: (){

                                launch('tel:8260060046');


                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(children: [
                                Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey.withOpacity(0.2)
                                    ),
                                    padding: EdgeInsets.all(6),
                                    child: Icon(Icons.info_outline,color: Colors.grey,)),
                                SizedBox(width: 8,),
                                Text(
                                  'Help',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.black)),

                              ],),
                            ),
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
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> OrderHistory(widget.allFrenchisiViewModel)));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(children: [
                              Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey.withOpacity(0.2)
                                  ),
                                  padding: EdgeInsets.all(6),
                                  child: Image.asset('images/order_history.png',color: Colors.grey,width: 16,height: 16,)),

                              SizedBox(width: 8,),
                              Text(
                                  'Order history',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.black)),
                            ],
                            ),
                          ),
                        ),


                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> Greivance()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(children: [
                              Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey.withOpacity(0.2)
                                  ),
                                  padding: EdgeInsets.all(6),
                                  child: Image.asset('images/greviances.png',color: Colors.grey,width: 16,height: 16,)),

                              SizedBox(width: 8,),
                              Text(
                                  'Grivience',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.black)),
                            ],
                            ),
                          ),
                        ),

                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Row(children: [
                        //     Icon(Icons.account_tree_outlined,color: Colors.grey,),
                        //     SizedBox(width: 8,),
                        //     Text(
                        //         'Current order',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.black)),
                        //   ],
                        //   ),
                        // ),
                       ],
                      ),
                    ],
                  ),
                ],
              ),


            ),
          ),
        ),
      ),
    );
  }
}
