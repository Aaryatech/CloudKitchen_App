import 'package:cloud_kitchen/network/model/response/OrderHistory.dart';
import 'package:cloud_kitchen/ui/user/AddressBook.dart';
import 'package:cloud_kitchen/viewmodel/con/internet.dart';
import 'package:cloud_kitchen/viewmodel/franchisi/frviewmodel.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderSummary extends StatefulWidget {
final  OrderHistoryItem orderHistoryItem;
final AllFrenchisiViewModel allFrenchisiViewModel;
  const OrderSummary(this.orderHistoryItem,this.allFrenchisiViewModel);

  @override
  _OrderSummaryState createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  void _showSnackbar(String msg, bool isPositive) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        msg,
        style: TextStyle(color: Colors.white),
      ),
      duration: Duration(seconds: 3),
      backgroundColor: isPositive ? Colors.green : Colors.redAccent,
    ));
  }

  List<Widget> getChildren(int orederId) {
    List<Widget> list = [];
    widget.allFrenchisiViewModel.grievanceTypeListMain.forEach((element) {
      list.add(Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                widget.allFrenchisiViewModel
                    .addGrievance(
                    orederId, element.grievanceId, element.grievenceTypeId)
                    .then((value) {
                  if (value.status == 200) {
                    _showSnackbar("Grievance Raise", true);
                  } else {
                    _showSnackbar("Something Went Wrong", false);
                  }
                });

                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(element.caption),
              )),
          Divider(
            color: Colors.grey[300],
            height: 1,
          )
        ],
      ));
    });

    return list;
  }

  void showGrievanceAlert(int orderId) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Grievance Reason',style: Theme.of(context).textTheme.headline6.copyWith(fontFamily: 'Metropolis Semi Bold'),),
          content: SingleChildScrollView(
            child: ListBody(
              children: getChildren(orderId),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel',style: Theme.of(context).textTheme.button.copyWith(color: Theme.of(context).primaryColor),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  bool isNetWorkAvailable=true;
  ReactionDisposer _disposer;
  ConnectivityStore connectivityStore=ConnectivityStore();
  @override
  void initState() {
    // TODO: implement initState

    _disposer = reaction(
            (_) => connectivityStore.connectivityStream.value,
            (result) {
          if(result == ConnectivityResult.none){
            setState((){

              isNetWorkAvailable=false;

            });
          }else{
            setState((){
              isNetWorkAvailable=true;
            });
          }
        });

    widget.allFrenchisiViewModel.getGetGrievanceTypes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Order Summary',style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),),
        actions: [
          TextButton(
            child: Text('Support', style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(color: Colors.white),),
            onPressed: (){
              showGrievanceAlert(widget.orderHistoryItem.orderId);

            },
          )
        ],

      ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(bottom: 38),
                child:Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                         ],),
                      SizedBox(width: 15,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: getChilderen(),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[

                  Text(
                      'Item Total',style:Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
                          Row(
                            children: [
                              Image.asset('images/rupees_icn.png',width: 16,height: 16,color:Colors.grey),
                              Text('${(widget.orderHistoryItem.exFloat2).ceil()}',style: Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),

                            ],
                          ),

                        ],),

                      SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[

                  Text(
                      'Delivery Charge',style:Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
                          Row(
                            children: [
                              Image.asset('images/rupees_icn.png',width: 16,height: 16,color:Colors.grey),
                              Text('${widget.orderHistoryItem.deliveryCharges}',style: Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),

                            ],
                          ),

                        ],),
                      SizedBox(height: 4,),
                      widget.orderHistoryItem.discAmt==0.0?Container():   Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[

                          Text(
                              'Discount',style:Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
                          Row(
                            children: [
                              Image.asset('images/rupees_icn.png',width: 16,height: 16,color:Colors.grey),
                              Text('- ${widget.orderHistoryItem.discAmt}',style: Theme.of(context).textTheme.caption.copyWith(color:Colors.grey),),

                            ],
                          ),

                        ],),



                      widget.orderHistoryItem.discAmt==0.0?Container():SizedBox(height: 4,),

                      Divider(
                        color: Colors.grey[300],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[

                  Text(
                      'Grand Total',style:Theme.of(context).textTheme.subtitle2.copyWith(fontWeight: FontWeight.bold)),
                          Row(
                            children: [
                              Image.asset('images/rupees_icn.png',width: 16,height: 16,),
                              Text('${widget.orderHistoryItem.totalAmt}',style: Theme.of(context).textTheme.subtitle2,),
                            ],
                          ),
                        ],),

                      Divider(
                        color: Colors.grey[300],
                      ),
                      widget.orderHistoryItem.discAmt==0.0?Container():   SizedBox(height: 10,),



                      widget.orderHistoryItem.discAmt==0.0?Container():    Container(
                        //height: 50.0,
                        child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      style: BorderStyle.solid,
                      width: 1.0,
                    ),
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                        Text(
                            'Your Total Saving ',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Theme.of(context).primaryColor)),
                        Row(
                          children: [
                            Image.asset('images/rupees_icn.png',width: 16,height: 16,color: Theme.of(context).primaryColor),
                            Text('${widget.orderHistoryItem.discAmt}',style: Theme.of(context).textTheme.subtitle2.copyWith(color: Theme.of(context).primaryColor),),

                          ],
                        ),  ],),
                  ),
                        ),
                      ),

                      SizedBox(height: 16,),

                  Text(
                      'Order Details',style:Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.black,fontFamily: 'Metropolis')),

                      Divider(
                        color: Colors.grey,
                      ),

                      SizedBox(height: 10,),

                      Text(
                  'Order Number'.toUpperCase(),style:Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey,fontFamily: 'Metropolis')),
                      SizedBox(height: 4,),

                      Text(
                          '${widget.orderHistoryItem.orderId}',style:Theme.of(context).textTheme.subtitle2.copyWith(color:Colors.black)),
                      SizedBox(height: 10,),

                      Text(
                  'Payment'.toUpperCase(),style:Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey,fontFamily: 'Metropolis')),
                      SizedBox(height: 4,),
                      Text(
                          '${widget.orderHistoryItem.paymentMethod==1?'COD':'Online'}',style:Theme.of(context).textTheme.subtitle2.copyWith(color:Colors.black)),
                      SizedBox(height: 10,),

                      Text(
                  'Date'.toUpperCase(),style:Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey,fontFamily: 'Metropolis')),
                      SizedBox(height: 4,),
                      Text(
  '${widget.orderHistoryItem.insertDateTime}',style:Theme.of(context).textTheme.subtitle2.copyWith(color:Colors.black)),
                      SizedBox(height: 10,),

                      Text(
                  'Phone Number'.toUpperCase(),style:Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey,fontFamily: 'Metropolis')),
                      SizedBox(height: 4,),
                      Text(
                          '${widget.orderHistoryItem.whatsappNo}',style:Theme.of(context).textTheme.subtitle2.copyWith(color:Colors.black)),
                      SizedBox(height: 10,),

                      Text(
                  'Delivered to'.toUpperCase(),style:Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.normal,fontFamily: 'Metropolis').copyWith(color:Colors.grey)),
                      SizedBox(height: 4,),
                      Text(
                          '${widget.orderHistoryItem.landmark}',style:Theme.of(context).textTheme.subtitle2.copyWith(color:Colors.black,height: 1.2)),
                      SizedBox(height: 16,),





                  ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 16,
                left: 16,
              right: 16,
              child: Container(
                width: MediaQuery.of(context).size.width*.9,
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
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        style: BorderStyle.solid,
                        width: 1.0,
                      ),
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(8.0),

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 28,width: 4,),
                        Expanded(
                          child: Text( "Repeat Order",textAlign: TextAlign.center,
                              style:Theme.of(context).textTheme.button.copyWith(fontWeight: FontWeight.normal,).copyWith(color:Colors.white)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

 List<Widget> getChilderen() {
    List<Widget> widgets=[];

    widget.orderHistoryItem.detailList.forEach((element) {
      widgets.add(
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        '${element.itemName} [${element.exFloat2} ${element.exVar1}] ',style:Theme.of(context).textTheme.bodyText1),
                    SizedBox(height: 6,),
                    Row(
                      children: <Widget>[

                        Container(
                          height: 25,
                          width: 25,
                          alignment: Alignment.center,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            border: Border.all(
                              color: Color(0xff0A6D00),
                              width: 1,
                            ),
                            color: Color(0xff0A6D00).withOpacity(0.2),
                          ),
                          child: Text(
                              '${element.exInt1}',style:Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.bold).copyWith(color:Color(0xff0A6D00))),
                        ),
                        SizedBox(width: 8,),
                        Text(
                            'X',style:Theme.of(context).textTheme.bodyText2.copyWith(fontWeight: FontWeight.bold).copyWith(color:Colors.black)),
                        SizedBox(width: 4,),

                        Row(

                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset('images/rupees_icn.png',width: 16,height: 18),
                            Text(
                                '${element.mrp}',style:Theme.of(context).textTheme.bodyText2),
                          ],
                        ),


                      ],),
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset('images/rupees_icn.png',width: 16,height: 16,),
                    Text('${element.qty*element.mrp}',style: Theme.of(context).textTheme.bodyText2,),

                  ],
                ),
              ],
            ),
            Divider(
              color: Colors.grey[300],
            )
          ],
        ),
      );


    });

    return widgets;
  }
}
