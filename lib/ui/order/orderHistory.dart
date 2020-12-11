import 'package:cloud_kitchen/network/model/response/DetailList.dart';
import 'package:cloud_kitchen/network/model/response/OrderHistory.dart';
import 'package:cloud_kitchen/network/repository/grievanceListRepo.dart';
import 'package:cloud_kitchen/ui/supportui/nodataavailable.dart';
import 'package:cloud_kitchen/ui/wallet/MadhviCreadits.dart';
import 'package:cloud_kitchen/ui/order/OrderSummary.dart';
import 'package:cloud_kitchen/viewmodel/franchisi/frviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    widget.allFrenchisiViewModel.getOrderHistory();
    widget.allFrenchisiViewModel.getGetGrievanceTypes();
    super.initState();
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
        builder: (_) => (widget.allFrenchisiViewModel.isLoadingForHistory)
            ? LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor),
              )
            : widget.allFrenchisiViewModel.orderHistory.orderList.isEmpty
                ? Center(
                    child: Text(
                      'N0 Data Available',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  )
                : ListView.builder(
                    itemCount: widget
                        .allFrenchisiViewModel.orderHistory.orderList.length,
                    itemBuilder: (context, index) {
                      OrderHistoryItem item = widget
                          .allFrenchisiViewModel.orderHistory.orderList[index];
                      return Padding(
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
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal)),
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
                                                "images/bell.gif",
                                                height: 32.0,
                                                width: 32.0,
                                              ),
                                            ))
                                        : Container(),
                                  ],
                                ),

                                SizedBox(
                                  height: 4,
                                ),
                                Divider(
                                  color: Colors.grey[300],
                                ),
                                SizedBox(
                                  height: 4,
                                ),

                                Text('Items',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(fontWeight: FontWeight.normal)
                                        .copyWith(color: Colors.grey)),
                                SizedBox(
                                  height: 4,
                                ),
                                // Text(,style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold).copyWith(color:Colors.black)),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: getItems(item.detailList),
                                ),

                                SizedBox(
                                  height: 10,
                                ),

                                Text('Ordered On',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(color: Colors.grey)),
                                SizedBox(
                                  height: 4,
                                ),
                                Text('${item.insertDateTime}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(fontFamily: 'Metropolis')),

                                SizedBox(
                                  height: 10,
                                ),

                                Text('Total Amount',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(color: Colors.grey)),
                                SizedBox(
                                  height: 4,
                                ),
                                Text('${item.totalAmt}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(fontFamily: 'Metropolis')),

                                SizedBox(
                                  height: 4,
                                ),
                                Divider(
                                  color: Colors.grey[300],
                                ),
                                SizedBox(
                                  height: 4,
                                ),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(getOrderStatus(item.orderStatus),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1),
                                    InkWell(
                                      onTap: () {
                                        showGrievanceAlert(item.orderId);
                                      },
                                      child: Text("Add Grievance",
                                          style: Theme.of(context)
                                              .textTheme
                                              .button
                                              .copyWith(color: Colors.red)),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
      ),
      //  ),
    );
  }

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
