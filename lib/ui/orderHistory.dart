import 'package:cloud_kitchen/ui/MadhviCreadits.dart';
import 'package:cloud_kitchen/ui/OrderSummary.dart';
import 'package:flutter/material.dart';

class OrderHistory extends StatefulWidget {
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
          title: Text('Your Order History'),
        ),
      body:ListView.builder(
    itemCount: 100,
    itemBuilder: (context, index) {
      return Container(
          margin:const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          child: Column(
          children: <Widget>[
            InkWell(
              onTap: (){
                Navigator.pushReplacement(context,
                    new MaterialPageRoute(builder: (BuildContext context) => OrderSummary()));
              },
              child: Card(

                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                     Row(
                     // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[

                        Expanded(
                          flex: 1,

                          child:  Container(
                            color: Colors.white,
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                new Container(
                                  //child: CircleAvatar(
                                  //  radius: 30,
                                  //  backgroundImage: AssetImage('images/profilee.jpg'),
                            child: Image.asset('images/profilee.jpg',width: 80,height: 80,),
                                 // ),
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                      'Order number: 123456',
                                      style:Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.bold).copyWith(color:Theme.of(context).primaryColor)),
                                  SizedBox(height: 4,),
                                  Text(
                                      'satelite,Ahmedabad',style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),


                                ],
                              ),

                            )

                        ),


                      ],
                    ),

                      SizedBox(
                        height: 4,
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 4,
                      ),

                      Text(
                          'ITEM',
                          style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
                      SizedBox(height: 4,),
                      Text(
                          '1X Paneer Tufani',style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold).copyWith(color:Colors.black)),

                      SizedBox(
                        height: 10,
                      ),

                      Text(
                          'ORDERED ON',
                          style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
                      SizedBox(height: 4,),
                      Text(
                          '15 Oct 2020 at 4:00 PM',style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold).copyWith(color:Colors.black)),


                      SizedBox(
                        height: 10,
                      ),

                      Text(
                          'TOTAL AMOUNT',
                          style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
                      SizedBox(height: 4,),
                      Text(
                          'RS 105.00',style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold).copyWith(color:Colors.black)),

                      SizedBox(
                        height: 4,
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 4,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                        Text(
                            'Delivered',
                            style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold).copyWith(color:Colors.grey)),


                        Row(
                          children: <Widget>[

                            Icon(Icons.replay,color: Theme.of(context).primaryColor,),
                            SizedBox(
                              width: 4,
                            ),

                            Text(
                              'Repeat Order',style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold).copyWith(color:Theme.of(context).primaryColor)),
                           ],
                        ),


                      ],),
                    ],
                  ),
                ),
              ),
            ),

        ],
        ),
        );
    },
      ),
    //  ),
    );
  }
}