import 'package:cloud_kitchen/network/model/response/DetailList.dart';
import 'package:cloud_kitchen/network/model/response/OrderHistory.dart';
import 'package:cloud_kitchen/ui/order/OrderSummary.dart';
import 'package:cloud_kitchen/viewmodel/con/internet.dart';
import 'package:cloud_kitchen/viewmodel/franchisi/frviewmodel.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderHistory extends StatefulWidget {
  AllFrenchisiViewModel allFrenchisiViewModel;

  OrderHistory(this.allFrenchisiViewModel);

  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  List<Widget> getItems(List<DetailList> list) {
    List<Widget> widgets = [];

    list.forEach((element) {
      widgets.add(Padding(
        padding: const EdgeInsets.only(top: 2, bottom: 2),
        child: Text(
          '${element.exInt1} X ${element.itemName} [${element.exFloat2} ${element.exVar1}]',
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(fontFamily: 'Metropolis'),
        ),
      ));
    });

    return widgets;
  }

  void initiateHelpCall() {
    launch('tel:8260060046');
  }

  bool isNetWorkAvailable=true;
  ReactionDisposer _disposer;
  ConnectivityStore connectivityStore=ConnectivityStore();
  @override
  void initState() {
    // TODO: implement initState

    callWebService();
    super.initState();
  }


  callWebService()async{
    await widget.allFrenchisiViewModel.getOrderHistory();
    // await  widget.allFrenchisiViewModel.getGetGrievanceTypes();
  }


  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(

        title: Text(
          'Your Order History',
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: Colors.white),
        ),
        actions: [
          FlatButton(
            textColor: Colors.white,
            onPressed: () {
              initiateHelpCall();
            },
            child: Text(
              "Support",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(color: Colors.white),
            ),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      ),
      body: Observer(
        builder: (_) => widget.allFrenchisiViewModel.isLoadingForHistory
            ? LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor),
              )
            : widget.allFrenchisiViewModel.orderHistory.orderList.isEmpty
                ? Center(
                    child: Text(
                      'No Data Available',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  )
                :

        ListView.builder(
                    itemCount: (widget
                        .allFrenchisiViewModel.orderHistory as OrderHistoryModel).orderList.length,
                    itemBuilder: (context, index) {
                      OrderHistoryItem item = (widget
                          .allFrenchisiViewModel.orderHistory as OrderHistoryModel).orderList[index];
                      return
                        Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 1,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Flexible(
                                        flex: 1,
                                        child: Image.asset(
                                          'images/ic_launcher.png',
                                          width: 50,
                                          height: 50,
                                        )),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            new MaterialPageRoute(
                                                builder: (BuildContext
                                                        context) =>
                                                    OrderSummary(
                                                        widget
                                                            .allFrenchisiViewModel
                                                            .orderHistory
                                                            .orderList[index],
                                                        widget
                                                            .allFrenchisiViewModel)));
                                      },
                                      child: Flexible(
                                        flex: 4,
                                        child: Container(
                                          padding: EdgeInsets.only(left: 8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Row(
                                                children: [
                                                  Text(
                                                      'Order number: ${item.orderNo}',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .subtitle1
                                                          .copyWith(
                                                              fontFamily:
                                                                  'Metropolis Semi Bold')
                                                          .copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor)),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .70,
                                                child: Text('${item.landmark}',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .caption
                                                        .copyWith(
                                                        height: 1.2,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,fontFamily: 'Metropolis')),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    (item.orderStatus == 1 || item.orderStatus == 2 || item.orderStatus == 3 || item.orderStatus == 4)
                                        ? Flexible(
                                            flex: 1,
                                            child: InkWell(
                                              onTap: () {
                                                showDialog(context: context,
                                                  useSafeArea: true,
                                                  child: AlertDialog(
                                                    scrollable: true,
                                                    title: new Text("Order Status",style:Theme.of(context).textTheme.headline6.copyWith(fontFamily: 'Metropolis Semi Bold'),),
                                                    content: Column(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: getOrderLog(item)
                                                    ),
                                                    actions: [
                                                      FlatButton(onPressed: (){

                                                        Navigator.pop(context);
                                                      }, child: Text("Ok",style: Theme.of(context).textTheme.button.copyWith(color: Theme.of(context).primaryColor),)),

                                                    ],
                                                  ),
                                                );
                                              },
                                              child: Image.asset(
                                                "images/.png",
                                                height: 32.0,
                                                width: 32.0,
                                              ),
                                            ))
                                        : Container(),
                                  ],
                                ),

                                // SizedBox(
                                //   height: 4,
                                // ),
                                // Divider(
                                //   color: Colors.grey[300],
                                // ),
                                // SizedBox(
                                //   height: 4,
                                // ),
                                //
                                // Text('Items',
                                //     style: Theme.of(context)
                                //         .textTheme
                                //         .bodyText2
                                //         .copyWith(fontWeight: FontWeight.normal)
                                //         .copyWith(color: Colors.grey)),
                                // SizedBox(
                                //   height: 4,
                                // ),
                                // // Text(,style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold).copyWith(color:Colors.black)),
                                //
                                // Column(
                                //   crossAxisAlignment: CrossAxisAlignment.start,
                                //   children: getItems(item.detailList),
                                // ),
                                //
                                // SizedBox(
                                //   height: 10,
                                // ),
                                //
                                // Text('Ordered On',
                                //     style: Theme.of(context)
                                //         .textTheme
                                //         .bodyText2
                                //         .copyWith(color: Colors.grey)),
                                // SizedBox(
                                //   height: 4,
                                // ),
                                // Text('${item.insertDateTime}',
                                //     style: Theme.of(context)
                                //         .textTheme
                                //         .bodyText1
                                //         .copyWith(fontFamily: 'Metropolis')),
                                //
                                // SizedBox(
                                //   height: 10,
                                // ),
                                //
                                // Text('Total Amount',
                                //     style: Theme.of(context)
                                //         .textTheme
                                //         .bodyText2
                                //         .copyWith(color: Colors.grey)),
                                // SizedBox(
                                //   height: 4,
                                // ),
                                // Text('${item.totalAmt}',
                                //     style: Theme.of(context)
                                //         .textTheme
                                //         .bodyText1
                                //         .copyWith(fontFamily: 'Metropolis')),
                                //
                                // SizedBox(
                                //   height: 4,
                                // ),
                                // Divider(
                                //   color: Colors.grey[300],
                                // ),
                                // SizedBox(
                                //   height: 4,
                                // ),
                                //
                                // Row(
                                //   mainAxisAlignment:
                                //       MainAxisAlignment.spaceBetween,
                                //   children: <Widget>[
                                //     Text(getOrderStatus(item.orderStatus),
                                //         style: Theme.of(context)
                                //             .textTheme
                                //             .bodyText1),
                                //     item.orderStatus==1? InkWell(
                                //       onTap: () {
                                //         cancelOrder(item.orderId);
                                //       },
                                //       child: Text("Cancel Order",
                                //           style: Theme.of(context)
                                //               .textTheme
                                //               .button
                                //               .copyWith(color: Colors.red,fontFamily: 'Metropolis')),
                                //     ):Container(),
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
      ),
       );
  }

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();



  void cancelOrder(int id ){

    widget.allFrenchisiViewModel
        .cancelOrder('$id')
        .then((value) {
      if (value.status == 200) {

        _showSnackbar("Order Canceled", true);
        widget.allFrenchisiViewModel.getOrderHistory();
      } else {
        _showSnackbar("Something Went Wrong", false);
      }
    });




  }

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

  String getOrderStatus(int status) {
    if (status == 0) {
      return "";
    }

    if (status == 1) {
      return 'Shop Confirmation Pending';
    }
    if (status == 2) {
      return 'Order Accepted By Shop';
    }
    if (status == 3) {
      return 'Order Processing At Shop End';
    }
    if (status == 4) {
      return 'Order On The Way';
    }
    if (status == 5) {
      return 'Order Delivered';
    }
    if (status == 6) {
      return 'Rejected By Shop';
    }

    if (status == 7) {
      return 'Return Order';
    }

    if (status == 8) {
      return 'Canceled Order';
    }
  }


 List<Widget> getOrderLog(OrderHistoryItem item){
    List<Widget> list=[];

    item.trailList.forEach((element) {

      list.add(
          Column(
            children: [
              ListTile(

                title: Text(getOrderStatus(element.status),style: Theme.of(context).textTheme.subtitle1,),
                subtitle: Text('${element.exVar1} ${element.actionDateTime}',style: Theme.of(context).textTheme.caption),
                isThreeLine: true,
              ),
              Divider(
                color: Colors.grey[300],
                height: 1,
              )
            ],
          )

      );

    });
    return list;

 }
 }

//
// import 'package:cloud_kitchen/network/model/response/DetailList.dart';
// import 'package:cloud_kitchen/network/model/response/OrderHistory.dart';
// import 'package:cloud_kitchen/ui/order/OrderSummary.dart';
// import 'package:cloud_kitchen/viewmodel/franchisi/frviewmodel.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:url_launcher/url_launcher.dart';
//
//
// class OrderHistory extends StatefulWidget {
//
//   AllFrenchisiViewModel allFrenchisiViewModel;
//
//   OrderHistory(this.allFrenchisiViewModel);
//
//
//   @override
//   _OrderHistoryState createState() => _OrderHistoryState();
// }
//
// class _OrderHistoryState extends State<OrderHistory> {
//
//   final remarkController = TextEditingController();
//
//   List<Type> _type = [];
//   List<Widget>  getItems(List<DetailList> list){
//     List<Widget> widgets=[];
//
//     list.forEach((element) {
//       widgets.add(Text('${element.exInt1} X ${element.itemName} [${element.exFloat2} ${element.exVar1}]')
//       );
//     });
//
//     return widgets;
//   }
//
//   void initiateHelpCall(){
//     launch('tel:8260060046');
//
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     widget.allFrenchisiViewModel.getOrderHistory();
//     // typeViewModelStore.getType();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       appBar: AppBar(
//         title: Text('Your Order History'),
//         actions: [
//           FlatButton(
//             textColor: Colors.white,
//             onPressed: () {
//               initiateHelpCall();
//             },
//             child: Text("Support"),
//             shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
//           ),
//         ],
//       ),
//       body:Observer(
//         builder:(_)=>
//         widget.allFrenchisiViewModel.isLoadingForHistory?
//         LinearProgressIndicator(
//           valueColor:AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor) ,
//
//         ):
//
//
//         widget.allFrenchisiViewModel.orderHistory.orderList.isEmpty? Center(
//           child: Text('N0 Data Available',style: Theme.of(context).textTheme.headline6,),
//         ) : ListView.separated(
//           separatorBuilder: (context, index) => Divider(
//             color: Colors.black,
//           ),
//           itemCount:  widget.allFrenchisiViewModel.orderHistory.orderList.length,
//           itemBuilder: (context, index) {
//             OrderHistoryItem item= widget.allFrenchisiViewModel.orderHistory.orderList[index];
//             return Container(
//               margin:const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
//               padding: EdgeInsets.all(4),
//               width: MediaQuery.of(context).size.width,
//               child: InkWell(
//                 onTap: (){
//                   Navigator.push(context,
//                       new MaterialPageRoute(builder: (BuildContext context) => OrderSummary(widget.allFrenchisiViewModel.orderHistory.orderList[index],widget.allFrenchisiViewModel)));
//                 },
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//
//                     Row(
//                       // crossAxisAlignment: CrossAxisAlignment.stretch,
//                       mainAxisSize: MainAxisSize.max,
//                       children: <Widget>[
//                         Image.asset('images/ic_launcher.png',width: 80,height: 80,),
//
//                         SizedBox(width: 4,),
//                         Container(
//                           color: Colors.white,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: <Widget>[
//                               Row(
//                                 children: [
//                                   Text(
//                                       'Order number: ${item.orderId}',
//                                       style:Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.bold).copyWith(color:Theme.of(context).primaryColor)),
//
//                                 ],
//                               ),
//                               SizedBox(height: 4,),
//                               SizedBox(
//                                 width: MediaQuery.of(context).size.width*.70,
//                                 child: Text(
//                                     '${item.landmark}',style:Theme.of(context).textTheme.bodyText2.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
//                               ),
//
//
//                             ],
//                           ),
//
//                         ),
//
//
//                       ],
//                     ),
//
//                     SizedBox(
//                       height: 4,
//                     ),
//                     Divider(
//                       color: Colors.grey,
//                     ),
//                     SizedBox(
//                       height: 4,
//                     ),
//
//                     Text(
//                         'Items',
//                         style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
//                     SizedBox(height: 4,),
//                     // Text(,style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold).copyWith(color:Colors.black)),
//
//
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: getItems(item.detailList),
//                     ),
//
//                     SizedBox(
//                       height: 10,
//                     ),
//
//                     Text(
//                         'ORDERED ON',
//                         style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
//                     SizedBox(height: 4,),
//                     Text(
//                         '${item.insertDateTime}',style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold).copyWith(color:Colors.black)),
//
//
//                     SizedBox(
//                       height: 10,
//                     ),
//
//                     Text(
//                         'TOTAL AMOUNT',
//                         style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
//                     SizedBox(height: 4,),
//
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                             '${item.totalAmt}',style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold).copyWith(color:Colors.black)),
//
//                         InkWell(
//                           onTap: (){
//                             openGrievanceBottomSheet();
//                           },
//                           child: Text(
//                               'ADD GRIEVANCES',
//                               style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold).copyWith(color:Colors.redAccent)),
//                         ),
//                       ],
//                     ),
//
//                     SizedBox(
//                       height: 4,
//                     ),
//                     Divider(
//                       color: Colors.grey,
//                     ),
//                     SizedBox(
//                       height: 4,
//                     ),
//
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         Text(
//                             getOrderStatus(item.orderStatus),
//                             style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold).copyWith(color:Colors.grey)),
//
//
//
//                       ],),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//       //  ),
//     );
//   }
//
//   String getOrderStatus(int status){
//
//     if(status==0){
//       return "";
//     }
//
//     if(status==1){
//       return 'Shop Confirmation Pending';
//     }
//     if(status==2){
//       return 'Order Accepted By Shop';
//     }
//     if(status==3){
//       return 'Order Processing At Shop End';
//     }
//     if(status==4){
//       return 'Order On The Way';
//     }
//     if(status==5){
//       return 'Order Delivered';
//     }
//     if(status==6){
//       return 'Rejected By Shop';
//     }
//
//     if(status==7){
//       return 'Return Order';
//     }
//
//     if(status==8){
//       return 'Canceled Order';
//     }
//
//   }
//
//   void openGrievanceBottomSheet(){
//
//
//     // allFrenchisiViewModel.getAddress();
//     showModalBottomSheet(
//         context: context,
//         backgroundColor: Colors.white,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         enableDrag: true,
//         builder: (BuildContext bc){
//           return StatefulBuilder(
//               builder: (context, setState) {
//
//                 return Container(
//
//                   width: MediaQuery
//                       .of(context)
//                       .size
//                       .width,
//                   height: MediaQuery
//                       .of(context)
//                       .size
//                       .height*.5,
//                   padding: EdgeInsets.all(16),
//
//
//                   child: Observer(
//                     builder:(_)=>
//
//                         Column(
//                             mainAxisSize: MainAxisSize.max,
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//
//                               Column(
//                                 children: [
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text("Add Grievances",style: Theme.of(context).textTheme.headline6,),
//
//                                       IconButton(icon: Icon(Icons.close,), onPressed:(){
//                                         Navigator.pop(context);
//                                       })
//                                     ],
//                                   ),
//                                   SizedBox(
//                                     height: 4,
//                                   ),
//
//                                   Container(
//                                     color: Colors.grey.withOpacity(0.5),
//                                     height: 1,
//                                     width: MediaQuery.of(context).size.width,
//                                   ),
//                                   SizedBox(
//                                     height: 20,
//                                   ),
//
//                                   Observer(builder: (_) {
//
//                                     return Padding(
//                                       padding: const EdgeInsets.all(2.0),
//                                       child: FormField<String>(
//                                         builder: (FormFieldState<String> state) {
//                                           var dropdownValue1;
//                                           return InputDecorator(
//                                             decoration: InputDecoration(
//                                                 errorStyle: TextStyle(
//                                                     color: Colors.grey, fontSize: 16.0),
//                                                 hintText: 'Please Select Grievances',
//                                                 // errorText: addPurposeStore.error.purposError,
//                                                 border: OutlineInputBorder(
//                                                     borderRadius: BorderRadius.circular(2.0))),
//                                             isEmpty: dropdownValue1 == '',
//                                             child: DropdownButtonHideUnderline(
//                                               child: DropdownButton<Type>(
//                                                 value: dropdownValue1,
//                                                 hint: Text("Please Select Grievances"),
//                                                 isDense: true,
//                                                 onChanged: (Type newValue) {
//                                                   setState(() {
//                                                     dropdownValue1 = newValue;
//                                                     // state.didChange(newValue.caption);
//
//                                                   });
//                                                 },
//                                                 items: _type.map((Type value) {
//                                                   print('Dropdown Values $value');
//                                                   return DropdownMenuItem<Type>(
//                                                     value: value,
//                                                     // child: Text(value.caption),
//                                                   );
//
//                                                 }).toList(),
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     );
//                                   }),
//
//                                   SizedBox(height: 10),
//
//                                   TextField(
//                                     textAlign: TextAlign.start,
//                                     keyboardType: TextInputType.text,
//                                     controller: remarkController,
//                                     decoration: new InputDecoration(
//                                         hintText: 'Enter Remark',
//                                         // errorText: contactUSViewModel.contactUSErrorState.email,
//                                         prefixIcon: Icon(Icons.question_answer),
//                                         border: new OutlineInputBorder(
//                                           borderRadius: const BorderRadius.all(
//                                             const Radius.circular(2.0),
//                                           ),
//                                           borderSide: new BorderSide(
//                                             color: Colors.black,
//                                             width: 1.0,
//                                           ),
//                                         ),
//                                         isDense: true
//
//                                     ),
//
//                                   ),
//                                   SizedBox(height: 20),
//
//                                   Container(
//                                     decoration: BoxDecoration(
//                                       border: Border.all(
//                                         color: Theme.of(context).primaryColor,
//                                         style: BorderStyle.solid,
//                                         width: 1.0,
//                                       ),
//                                       color: Theme.of(context).primaryColor,
//                                       borderRadius: BorderRadius.circular(2.0),
//                                     ),
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: <Widget>[
//                                         Padding(
//                                           padding: const EdgeInsets.all(10.0),
//                                           child: Center(
//                                             child: Text(
//                                                 "SAVE",
//                                                 style:Theme.of(context).textTheme.button.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.white)),
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//
//
//                                 ],
//
//
//
//                               ),
//
//
//                             ]
//                         ),
//                   ),
//                 );
//               }
//           );
//         }
//
//     );
//
//   }
// }