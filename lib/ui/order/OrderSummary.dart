import 'package:cloud_kitchen/network/model/response/OrderHistory.dart';
import 'package:cloud_kitchen/ui/user/AddressBook.dart';
import 'package:cloud_kitchen/viewmodel/franchisi/frviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderSummary extends StatefulWidget {
final  OrderHistoryItem orderHistoryItem;
final AllFrenchisiViewModel allFrenchisiViewModel;
  const OrderSummary(this.orderHistoryItem,this.allFrenchisiViewModel);

  @override
  _OrderSummaryState createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Summary'),

        // actions: [
        //   FlatButton(
        //     textColor: Colors.white,
        //     onPressed: () {
        //
        //     },
        //     child: Text("Add Grievance"),
        //     shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
        //   ),
        // ],

      ),

      body: SingleChildScrollView(
        child: Container(
          child:Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                'Your Order',style:Theme.of(context).textTheme.headline6.copyWith(color:Colors.black)),

            Divider(
                  color: Colors.grey,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[

            // Image.asset(
            //   "images/veg_icn.png",
            //   height: 30,
            //   width: 25,
            // ),
            // SizedBox(width: 4,),
            // Text(
            //     'Paneer Toofani',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.black)),
                ],),
                SizedBox(width: 15,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: getChilderen(),
                ),

                Divider(
                  color: Colors.grey,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

            Text(
                'Item Total',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.black)),
                    Row(
                      children: [
                        Image.asset('images/rupees_icn.png',width: 16,height: 16,),
                        Text('${(widget.orderHistoryItem.exFloat2).ceil()}',style: Theme.of(context).textTheme.subtitle2,),

                      ],
                    ),

                  ],),
                SizedBox(height: 8,),

                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

            Text(
                'Delivery Change',style:Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
                    Row(
                      children: [
                        Image.asset('images/rupees_icn.png',width: 16,height: 16,),
                        Text('${widget.orderHistoryItem.deliveryCharges}',style: Theme.of(context).textTheme.subtitle2,),

                      ],
                    ),

                  ],),
                SizedBox(height: 4,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    Text(
                        'Discount',style:Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
                    Row(
                      children: [
                        Image.asset('images/rupees_icn.png',width: 16,height: 16,),
                        Text('- ${widget.orderHistoryItem.discAmt}',style: Theme.of(context).textTheme.subtitle2,),

                      ],
                    ),

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
                    Row(
                      children: [
                        Image.asset('images/rupees_icn.png',width: 16,height: 16,),
                        Text('${widget.orderHistoryItem.totalAmt}',style: Theme.of(context).textTheme.subtitle2,),

                      ],
                    ),

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
                      Row(
                        children: [
                          Image.asset('images/rupees_icn.png',width: 16,height: 16,),
                          Text('${widget.orderHistoryItem.discAmt}',style: Theme.of(context).textTheme.subtitle2,),

                        ],
                      ),  ],),

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
                    '${widget.orderHistoryItem.orderId}',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.black)),
                SizedBox(height: 10,),

                Text(
            'Payment',style:Theme.of(context).textTheme.bodyText1.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
                SizedBox(height: 4,),
                Text(
                    '${widget.orderHistoryItem.paymentMethod==1?'COD':'Online'}',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.black)),
                SizedBox(height: 10,),

                Text(
            'Date',style:Theme.of(context).textTheme.bodyText1.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
                SizedBox(height: 4,),
                Text(
  '${widget.orderHistoryItem.orderDate}',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.black)),
                SizedBox(height: 10,),

                Text(
            'Phone Number',style:Theme.of(context).textTheme.bodyText1.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
                SizedBox(height: 4,),
                Text(
                    '${widget.orderHistoryItem.whatsappNo}',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.black)),
                SizedBox(height: 10,),

                Text(
            'Delivery to',style:Theme.of(context).textTheme.bodyText1.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
                SizedBox(height: 4,),
                Text(
                    '${widget.orderHistoryItem.landmark}',style:Theme.of(context).textTheme.bodyText2.copyWith(color:Colors.black)),
                SizedBox(height: 10,),

                Divider(
                  color: Colors.grey,
                ),


                Container(
                 // height: 50.0,
                  child: GestureDetector(
            onTap: (){


              if(widget.allFrenchisiViewModel.items.isEmpty) {
                widget.allFrenchisiViewModel.addAllItemsInCart(
                    widget.orderHistoryItem);
                widget.allFrenchisiViewModel.setPage(1);
                Navigator.pop(context);
                Navigator.pop(context);
              }else{
             showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: Text("If you select this order, The cart will be replaced with this order,Do you want to proceed?"),

                       actions: [
                         FlatButton(onPressed: (){
                           widget.allFrenchisiViewModel.addAllItemsInCart(
                               widget.orderHistoryItem);
                           widget.allFrenchisiViewModel.setPage(1);
                           Navigator.pop(context);
                           Navigator.pop(context);
                           Navigator.pop(context);
                         }, child: Text('Yes',style: Theme.of(context).textTheme.subtitle2.copyWith(color: Theme.of(context).primaryColor),)),
                         FlatButton(onPressed: (){
                           Navigator.pop(context);
                         }, child: Text('No',style: Theme.of(context).textTheme.subtitle2.copyWith(color: Theme.of(context).primaryColor),))
                       ],
                      );
                    }
                );
              }

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
                            "VIEW CART ON NEXT STEP",
                            style:Theme.of(context).textTheme.caption.copyWith(color:Colors.white)),
                 ],
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
      ),
    );
  }

 List<Widget> getChilderen() {
    List<Widget> widgets=[];

    widget.orderHistoryItem.detailList.forEach((element) {
      widgets.add(
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
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
                      ),
                      color: Theme.of(context).primaryColor.withOpacity(.3),
                    ),
                    child: Text(
                        '${element.exInt1}',style:Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.bold).copyWith(color:Colors.black)),
                  ),
                  SizedBox(width: 8,),
                  Text(
                      'X',style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold).copyWith(color:Colors.black)),
                  SizedBox(width: 4,),
                  Text(
                      '${element.itemName} [${element.exFloat2} ${element.exVar1}] ',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.black)),
                ],),

              Row(
                children: [
                  Image.asset('images/rupees_icn.png',width: 16,height: 16,),
                  Text('${element.qty*element.mrp}',style: Theme.of(context).textTheme.subtitle2,),

                ],
              ),
            ],
          ),
        ),
      );


    });

    return widgets;
  }
}
