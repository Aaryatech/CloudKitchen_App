import 'package:cloud_kitchen/ui/AddressBook.dart';
import 'package:cloud_kitchen/ui/deliveryInstruction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [

                Container(
                  color: Colors.greenAccent.withOpacity(0.17),
                  padding: EdgeInsets.all(16),
                  child: Row(

                    mainAxisAlignment:MainAxisAlignment.spaceBetween  ,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [


                      Row(
                     crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.check_circle,color: Theme.of(context).primaryColor,size: 32,),

                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Delivery at',style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold),),
                              Text('Summati Colony',style: Theme.of(context).textTheme.bodyText2),
                              Text('Delivery in 47 mins with live tracking',style: Theme.of(context).textTheme.caption),
                            ],
                          )
                        ],
                      ),

                      InkWell(

                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> AddressBook()));

                        },

                          child: Text('Add Address',style: Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,decoration: TextDecoration.underline,) ,))

                    ],
                  ),
                ),


                Container(
                  padding: EdgeInsets.all(16),
                  child:
                  ListView.separated(
                    scrollDirection: Axis.vertical,
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.black45,
                    ),
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset('images/veg_icn.png',width: 16,height: 16,),

                                SizedBox(width: 24,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Family Combo [Serves 6]",style: Theme.of(context).textTheme.subtitle1,)
                                    ,Text("R 450",style: Theme.of(context).textTheme.caption,)
                                  ],
                                ),


                              ],


                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1,color: Colors.grey)
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.add),
                                  SizedBox(width: 2,),
                                  Text("  1  ",style: TextStyle(backgroundColor: Theme.of(context).primaryColor.withOpacity(0.3)),),
                                  SizedBox(width: 2,),
                                  Icon(Icons.linear_scale)
                                ],
                              ),
                            )

                          ],
                        ),
                      );
                    },
                  ),
                ),

                Text('Add Cooking Instructions [Optional]',style: Theme.of(context).textTheme.caption.copyWith(decoration: TextDecoration.underline),),

                SizedBox(height: 16,),
                Container(
                  color: Colors.blue.withOpacity(0.1),
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [ Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Offers',style: Theme.of(context).textTheme.headline6,),
                        Row(
                          children: [
                            Icon(Icons.local_offer_outlined),
                            SizedBox(width: 12,),
                            Text('Select Promo Code',style: Theme.of(context).textTheme.caption,),
                          ],
                        ),

                      ],
                    ),

                    Text("View Offers",style: Theme.of(context).textTheme.subtitle2.copyWith(color: Theme.of(context).primaryColor),)
                    ],
                  ),
                ),



                Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Item Total',style: Theme.of(context).textTheme.caption,),
                        Text('R2118.00',style: Theme.of(context).textTheme.caption,)
                      ],
                    ),

                    SizedBox(height: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Delivery Charge',style: Theme.of(context).textTheme.caption,),
                        Text('R22.00',style: Theme.of(context).textTheme.caption,)
                      ],
                    ),
                      SizedBox(height: 12,),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text('Donate R1 to feeding india Foundation',style: Theme.of(context).textTheme.caption.copyWith(decoration: TextDecoration.underline,decorationStyle: TextDecorationStyle.dashed,decorationThickness: 2,),),
                            SizedBox(width: 8,),
                            Text('REMOVE',style: Theme.of(context).textTheme.caption.copyWith(color: Theme.of(context).primaryColor),),

                          ],
                        ),
                        Text('R1',style: Theme.of(context).textTheme.caption,)
                      ],
                    )

                    ],
                  ),
                ),


                Container(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Grand Total',style: Theme.of(context).textTheme.subtitle2,),
                      Text('R2,141.00',style: Theme.of(context).textTheme.subtitle2,),


                    ],
                  ),
                ),


                // Container(
                //   color: Colors.grey[100],
                //   padding: EdgeInsets.all(16),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text('Add Personal Details',style: Theme.of(context).textTheme.caption.copyWith(letterSpacing: 2),),
                //       Text('Add',style: Theme.of(context).textTheme.button.copyWith(color: Theme.of(context).primaryColor),),
                //
                //
                //     ],
                //   ),
                // ),

                Container(
                  color: Colors.grey[100],
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Payment Modes",style: Theme.of(context).textTheme.subtitle2,),
                      RadioListTile(
                        title: Text("Cash on Delivery"),
                        dense: true,

                        toggleable: true,
                        selected: false,
                      ),

                      RadioListTile(
                        title: Text("Pay Online"),
                        dense: true,
                        toggleable: true,
                        selected: true,
                      ),

                    ],
                  ),
                ),

                Container(
                  color: Colors.grey[100],
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Delivery Instructions',style: Theme.of(context).textTheme.caption.copyWith(letterSpacing: 2),),

                          InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> DeliveryInstruction()));

                              },
                              child: Text('CHANGE',style: Theme.of(context).textTheme.button.copyWith(color: Theme.of(context).primaryColor),)),


                        ],
                      ),

                      Row(
                        children: [

                          Icon(Icons.check_circle,color: Theme.of(context).primaryColor,size: 16,),
                        SizedBox(width: 8,)
                        ,  Text('Hand me the order',style: Theme.of(context).textTheme.caption.copyWith(color: Colors.black),),

                        ],
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                  //height: 50.0,
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileScreen()));
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(

                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(),
                            Center(
                              child: Text(
                                  "Checkout",
                                  style:Theme.of(context).textTheme.button.copyWith(color:Colors.white)),



                            ),
                            Align(

                                alignment: Alignment.centerRight,
                                child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,))


                          ],
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),

    );
  }
}
