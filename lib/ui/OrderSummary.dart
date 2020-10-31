import 'package:cloud_kitchen/ui/AddressBook.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class OrderSummary extends StatefulWidget {
  @override
  _OrderSummaryState createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Summary'),
        actions: [
          FlatButton(
            textColor: Colors.white,
            onPressed: () {},
            child: Text("Support"),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],

      ),

      body: SingleChildScrollView(
        child: Container(
          child:Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                  Text(
                      'Your Order',style:Theme.of(context).textTheme.headline6.copyWith(color:Colors.black)),
                  SizedBox(height: 20,),

                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          border: Border.all(
                            color: Color(0xffD50000),
                            width: 1,
                          )),
                      child:   Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'MARKE AS FAVORITE',style:Theme.of(context).textTheme.bodyText1.copyWith(color:Theme.of(context).primaryColor)),
                      ),
                    ),
                ],),
                SizedBox(width: 8,),
                Divider(
                  color: Colors.grey,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[

                    Image.asset(
                      "images/veg_icn.png",
                      height: 30,
                      width: 25,
                    ),
                    SizedBox(width: 4,),
                    Text(
                        'Paneer Toofani',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.black)),
                ],),
                SizedBox(width: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                   Row(
                    children: <Widget>[

                      Container(
                        height: 25,
                        width: 25,
                        alignment: Alignment.center,

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            )),
                        child: Text(
                            '1',style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold).copyWith(color:Colors.black)),
                      ),
                      SizedBox(width: 8,),
                      Text(
                          'X',style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold).copyWith(color:Colors.black)),
                      SizedBox(width: 4,),
                      Text(
                          'Rs 105.00',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.black)),
                    ],),

                      Row(
                        children: <Widget>[

                          Text(
                              'Rs 105.00',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.black)),
                        ],),
            ],
                ),

                Divider(
                  color: Colors.grey,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    Text(
                        'Item Total',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.black)),
                    Text(
                        'Rs 105.00',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.black)),
                  ],),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    Text(
                        'Promo - (MADHVI)',style:Theme.of(context).textTheme.bodyText1.copyWith(color:Theme.of(context).primaryColor)),
                    Text(
                        'You save Rs 105.00',style:Theme.of(context).textTheme.bodyText1.copyWith(color:Theme.of(context).primaryColor)),
                  ],),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    Text(
                        'Delivery Change',style:Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
                    Text(
                        'Rs 30.00',style:Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
                  ],),
                SizedBox(height: 8,),
                Divider(
                  color: Colors.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    Text(
                        'Grand Total',style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold).copyWith(color:Colors.black)),
                    Text(
                        'Rs 105.00',style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold).copyWith(color:Colors.black)),
                  ],),

                Divider(
                  color: Colors.grey,
                ),
                SizedBox(height: 10,),



                Container(
                  //height: 50.0,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.pink[100],
                        style: BorderStyle.solid,
                        width: 1.0,
                      ),
                      color: Colors.pink[100],
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[

                              Text(
                                  'Your Total Saving ',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Theme.of(context).primaryColor)),
                              Text(
                                  'Rs 75.00',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Theme.of(context).primaryColor)),
                            ],),

                        ],
                      ),
                    ),
                  ),
                ),




                SizedBox(height: 20,),


                    Text(
                        'Order Details',style:Theme.of(context).textTheme.headline6.copyWith(color:Colors.black)),

                Divider(
                  color: Colors.grey,
                ),

                SizedBox(height: 10,),

                Text(
                    'Order Number',style:Theme.of(context).textTheme.bodyText1.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
                SizedBox(height: 4,),

                Text(
                    '1234567890',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.black)),
                SizedBox(height: 10,),

                Text(
                    'Payment',style:Theme.of(context).textTheme.bodyText1.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
                SizedBox(height: 4,),
                Text(
                    'Paid : Using UPI',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.black)),
                SizedBox(height: 10,),

                Text(
                    'Date',style:Theme.of(context).textTheme.bodyText1.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
                SizedBox(height: 4,),
                Text(
                    'October 15,2020 at 05:20 PM',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.black)),
                SizedBox(height: 10,),

                Text(
                    'Phone Number',style:Theme.of(context).textTheme.bodyText1.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
                SizedBox(height: 4,),
                Text(
                    '9011877XXX',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.black)),
                SizedBox(height: 10,),

                Text(
                    'Delivery to',style:Theme.of(context).textTheme.bodyText1.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
                SizedBox(height: 4,),
                Text(
                    'Pota poti apartment,4 floor,mahavir nagar,meldinagar,vejalpur',style:Theme.of(context).textTheme.bodyText2.copyWith(color:Colors.black)),
                SizedBox(height: 10,),

                Divider(
                  color: Colors.grey,
                ),


                Container(
                 // height: 50.0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> AddressBook()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                         color:Theme.of(context).primaryColor,
                          style: BorderStyle.solid,
                          width: 1.0,
                        ),
                        color:Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                               Text(
                                  "Repeat Order",
                                  style:Theme.of(context).textTheme.button.copyWith(color:Colors.white)),
                                SizedBox(height: 4,),

                                Text(
                                    "VIEW CARD ON NEXT STEP",
                                    style:Theme.of(context).textTheme.caption.copyWith(color:Colors.white)),
                         ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )

              ],),
          ),
        ),
      ),
    );
  }
}
