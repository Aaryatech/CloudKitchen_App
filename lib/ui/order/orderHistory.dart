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




List<Widget>  getItems(List<DetailList> list){
  List<Widget> widgets=[];

  list.forEach((element) {
    widgets.add(Text('${element.exInt1} X ${element.itemName} [${element.exFloat2} ${element.exVar1}]')
    );
  });

  return widgets;
}

void initiateHelpCall(){
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
      appBar: AppBar(
          title: Text('Your Order History'),
        actions: [
          FlatButton(
            textColor: Colors.white,
            onPressed: () {
              initiateHelpCall();
            },
            child: Text("Support"),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
        ),
      body:Observer(
        builder:(_)=>
        (widget.allFrenchisiViewModel.isLoadingForHistory)?
              LinearProgressIndicator(
                valueColor:AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor) ,

              ):


        widget.allFrenchisiViewModel.orderHistory.orderList.isEmpty? Center(
          child: Text('N0 Data Available',style: Theme.of(context).textTheme.headline6,),
        ) : ListView.separated(
            separatorBuilder: (context, index) => Divider(
              color: Colors.black,
            ),
    itemCount:  widget.allFrenchisiViewModel.orderHistory.orderList.length,
    itemBuilder: (context, index) {
     OrderHistoryItem item= widget.allFrenchisiViewModel.orderHistory.orderList[index];
        return Container(
            margin:const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            padding: EdgeInsets.all(4),
            width: MediaQuery.of(context).size.width,
            child: InkWell(
              onTap: (){
                Navigator.push(context,
                     new MaterialPageRoute(builder: (BuildContext context) => OrderSummary(widget.allFrenchisiViewModel.orderHistory.orderList[index],widget.allFrenchisiViewModel)));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                 Row(
                 // crossAxisAlignment: CrossAxisAlignment.stretch,
                   mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Image.asset('images/ic_launcher.png',width: 80,height: 80,),

                    SizedBox(width: 4,),
                    Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: [
                              Text(
                                  'Order number: ${item.orderId}',
                                  style:Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.bold).copyWith(color:Theme.of(context).primaryColor)),

                            ],
                          ),
                          SizedBox(height: 4,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*.70,
                            child: Text(
                                '${item.landmark}',style:Theme.of(context).textTheme.bodyText2.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
                          ),


                        ],
                      ),

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
                      'Items',
                      style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
                  SizedBox(height: 4,),
                  // Text(,style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold).copyWith(color:Colors.black)),


                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: getItems(item.detailList),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Text(
                      'ORDERED ON',
                      style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
                  SizedBox(height: 4,),
                  Text(
                      '${item.insertDateTime}',style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold).copyWith(color:Colors.black)),


                  SizedBox(
                    height: 10,
                  ),

                  Text(
                      'TOTAL AMOUNT',
                      style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
                  SizedBox(height: 4,),
                  Text(
                      '${item.totalAmt}',style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold).copyWith(color:Colors.black)),

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
                        getOrderStatus(item.orderStatus),
                        style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold).copyWith(color:Colors.grey)),


                    InkWell(
                      onTap: (){
                        showGrievanceAlert(item.orderId);
                      },
                      child:  Text(
                         "Add Grievance",
                          style:Theme.of(context).textTheme.button.copyWith(fontWeight: FontWeight.bold).copyWith(color:Colors.red)),
                    )
                  ],
                  ),
                ],
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
void  _showSnackbar(String msg,bool isPositive) {
  _scaffoldKey.currentState .showSnackBar(
      SnackBar(
        content: Text(msg,style: TextStyle(color: Colors.white),),
        duration: Duration(seconds: 3),
        backgroundColor: isPositive?Colors.green:Colors.redAccent,
      ));
}

 List<Widget>  getChildren(int orederId){
  List<Widget> list=[];
  widget.allFrenchisiViewModel.grievanceTypeListMain.forEach((element) {
    list.add(InkWell(
        onTap: (){



          widget.allFrenchisiViewModel.addGrievance(orederId, element.grievanceId).then((value) {
          if(value.status==200){
            _showSnackbar("Grievance Raise", true);
          }else{
            _showSnackbar("Something Went Wrong", false);

          }


          }


          );

          Navigator.pop(context);
        },
        child: Text(element.caption)));
  });

return list;
 }

  void showGrievanceAlert(int orderId)async{
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Grievance Reason'),
          content: SingleChildScrollView(
            child: ListBody(
              children: getChildren(orderId),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  String getOrderStatus(int status){

  if(status==0){
    return "";
  }

    if(status==1){
      return 'Shop Confirmation Pending';
    }
    if(status==2){
      return 'Order Accepted By Shop';
    }
    if(status==3){
      return 'Order Processing At Shop End';
    }
    if(status==4){
      return 'Order On The Way';
    }
    if(status==5){
      return 'Order Delivered';
    }
    if(status==6){
      return 'Rejected By Shop';
    }

    if(status==7){
      return 'Return Order';
    }

    if(status==8){
      return 'Canceled Order';
    }

  }
}