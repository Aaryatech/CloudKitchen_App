import 'dart:io';

import 'package:cloud_kitchen/local/staticUrls.dart';
import 'package:cloud_kitchen/ui/cantact/contactUs_2.dart';
import 'package:cloud_kitchen/ui/grivience/grievance_1.dart';
import 'package:cloud_kitchen/ui/otp/OTPScreen.dart';
import 'package:cloud_kitchen/ui/outlettypes/outlettypes.dart';
import 'package:cloud_kitchen/ui/terms/terms.dart';
import 'package:cloud_kitchen/ui/wallet/MadhviCreadits.dart';
import 'package:cloud_kitchen/ui/user/editProfile.dart';
import 'package:cloud_kitchen/ui/order/orderHistoryUI.dart';
import 'package:cloud_kitchen/viewmodel/franchisi/frviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:share/share.dart';
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
                        child: Container(
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(16),
                          child: Observer(
                            builder:(_)=> Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [

                                CircleAvatar(
                                  maxRadius: 50,
                                  backgroundImage:widget.allFrenchisiViewModel.getProUrl()==""? AssetImage('images/man.png'):NetworkImage('$profileImageUrl${widget.allFrenchisiViewModel.getProUrl()}')//:FileImage(_image) ,
                                ),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        widget.allFrenchisiViewModel.custName??"",
                                       style:Theme.of(context).textTheme.headline6.copyWith(color:Colors.black,fontFamily: 'Metropolis Semi Bold'),overflow: TextOverflow.ellipsis,),
                                       width: MediaQuery.of(context).size.width*.5,
                                    ),
                                    SizedBox(height: 4,),

                                        Text(
                                            widget.allFrenchisiViewModel.getCustMobile(),style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey,fontFamily: 'Metropolis')),
                                        SizedBox(height: 4,),

                                        InkWell(
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=> EditProfile(widget.allFrenchisiViewModel)));

                                          },
                                          child: Text(
                                              'Edit Profile',style:Theme.of(context).textTheme.bodyText1.copyWith(color:Theme.of(context).primaryColor)),
                                        ),

                                  ],
                                ),
                              ],
                            ),
                          ),

                        ),
                      ),

                      Divider(
                        color: Colors.grey[300],

                      ),

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
                                'Food Order',style:Theme.of(context).textTheme.subtitle2.copyWith(color:index==0?Theme.of(context).primaryColor:Colors.black,fontFamily:'Metropolis')),
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
                                  'Wallet',style:Theme.of(context).textTheme.subtitle2.copyWith(color:Colors.black,fontFamily: 'Metropolis')),

                              ]
                          ),
                        ),
                      ),

                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: (){
                            setState(() {
                              index=2;
                            });
                          },

                                              child: Column(
                              children:[
                                Icon(Icons.settings,color:index==2?Theme.of(context).primaryColor:Colors.black,),
                                Text(
                                  'App Info',style:Theme.of(context).textTheme.subtitle2.copyWith(color:index==2?Theme.of(context).primaryColor:Colors.black,fontFamily:'Metropolis')),

                              ]
                          ),
                        ),
                      ),

                      ]
                    ),

                      SizedBox(height: 8,),

                      Divider(
                        color: Colors.grey[300],

                      ),

                      SizedBox(height: 8,),

                    index==2? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            'APP INFORMATION',style:Theme.of(context).textTheme.subtitle2.copyWith(color:Colors.grey,letterSpacing: 4)),
                          SizedBox(height: 20,),

                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> OutletTypes(widget.allFrenchisiViewModel)));

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
                                    child: Icon(Icons.restaurant,color: Colors.grey,size: 18,)),

                                SizedBox(width: 8,),
                                Text(
                                  'Our Restaurants/Outlets',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.black)),

                              ],),
                            ),
                          ),

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
                                  'Terms & Conditions',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.black)),

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

                              Share.share('Hey buddy! I just downloaded this madhvi food delivery mobile application. I recommend you to try this');

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
                                    child: Icon(Icons.share,color: Colors.grey,size: 18,)),
                                SizedBox(width: 8,),
                                Text(
                                    'Share App',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.black)),

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

                          InkWell(
                            onTap: (){

                              widget.allFrenchisiViewModel.logOut();
                              Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          OTPScreen()),(r) => false);

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
                                    child: Icon(Icons.logout,color: Colors.grey,)),
                                SizedBox(width: 8,),
                                Text(
                                    'Logout',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.black)),

                              ],),
                            ),
                          ),
                        ],
                      ):Container(),



                  index==0?  Column(
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
                                  'Grievance',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.black)),
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
                      ):Container(),
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
