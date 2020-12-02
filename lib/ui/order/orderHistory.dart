import 'package:cloud_kitchen/network/model/response/DetailList.dart';
import 'package:cloud_kitchen/network/model/response/OrderHistory.dart';
import 'package:cloud_kitchen/network/model/response/Type.dart';
import 'package:cloud_kitchen/ui/supportui/nodataavailable.dart';
import 'package:cloud_kitchen/ui/wallet/MadhviCreadits.dart';
import 'package:cloud_kitchen/ui/order/OrderSummary.dart';
import 'package:cloud_kitchen/viewmodel/franchisi/frviewmodel.dart';
import 'package:cloud_kitchen/viewmodel/type/typeviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:url_launcher/url_launcher.dart';

TypeViewModel typeViewModelStore = TypeViewModel();

class OrderHistory extends StatefulWidget {

  AllFrenchisiViewModel allFrenchisiViewModel;

  OrderHistory(this.allFrenchisiViewModel);


  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {

  final remarkController = TextEditingController();

  List<Type> _type = [];
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
    typeViewModelStore.getType();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
        widget.allFrenchisiViewModel.isLoadingForHistory?
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Text(
                        '${item.totalAmt}',style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold).copyWith(color:Colors.black)),

                      InkWell(
                        onTap: (){
                          openGrievanceBottomSheet();
                        },
                        child: Text(
                            'ADD GRIEVANCES',
                            style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold).copyWith(color:Colors.redAccent)),
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                    Text(
                        getOrderStatus(item.orderStatus),
                        style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold).copyWith(color:Colors.grey)),



                  ],),
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

void openGrievanceBottomSheet(){


 // allFrenchisiViewModel.getAddress();
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      enableDrag: true,
      builder: (BuildContext bc){
        return StatefulBuilder(
            builder: (context, setState) {

              return Container(

                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height*.5,
                padding: EdgeInsets.all(16),


                child: Observer(
                  builder:(_)=>

                      Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Add Grievances",style: Theme.of(context).textTheme.headline6,),

                                    IconButton(icon: Icon(Icons.close,), onPressed:(){
                                      Navigator.pop(context);
                                    })
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),

                                Container(
                                  color: Colors.grey.withOpacity(0.5),
                                  height: 1,
                                  width: MediaQuery.of(context).size.width,
                                ),
                                SizedBox(
                                  height: 20,
                                ),

                                 Observer(builder: (_) {
                                   if (typeViewModelStore.typeMain != null) {
                                     _type = typeViewModelStore.typeMain;
                                   }
                                   return Padding(
                                     padding: const EdgeInsets.all(2.0),
                                     child: FormField<String>(
                                       builder: (FormFieldState<String> state) {
                                         var dropdownValue1;
                                         return InputDecorator(
                                           decoration: InputDecoration(
                                               errorStyle: TextStyle(
                                                   color: Colors.grey, fontSize: 16.0),
                                               hintText: 'Please Select Grievances',
                                              // errorText: addPurposeStore.error.purposError,
                                               border: OutlineInputBorder(
                                                   borderRadius: BorderRadius.circular(2.0))),
                                           isEmpty: dropdownValue1 == '',
                                           child: DropdownButtonHideUnderline(
                                             child: DropdownButton<Type>(
                                               value: dropdownValue1,
                                               hint: Text("Please Select Grievances"),
                                               isDense: true,
                                               onChanged: (Type newValue) {
                                                 setState(() {
                                                   dropdownValue1 = newValue;
                                                   state.didChange(newValue.caption);

                                                 });
                                               },
                                               items: _type.map((Type value) {
                                                 print('Dropdown Values $value');
                                                 return DropdownMenuItem<Type>(
                                                   value: value,
                                                   child: Text(value.caption),
                                                 );

                                               }).toList(),
                                             ),
                                           ),
                                         );
                                       },
                                     ),
                                   );
                                 }),

                                SizedBox(height: 10),

                                TextField(
                                  textAlign: TextAlign.start,
                                  keyboardType: TextInputType.text,
                                  controller: remarkController,
                                  decoration: new InputDecoration(
                                      hintText: 'Enter Remark',
                                      // errorText: contactUSViewModel.contactUSErrorState.email,
                                      prefixIcon: Icon(Icons.question_answer),
                                      border: new OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(2.0),
                                        ),
                                        borderSide: new BorderSide(
                                          color: Colors.black,
                                          width: 1.0,
                                        ),
                                      ),
                                      isDense: true

                                  ),

                                ),
                                SizedBox(height: 20),

                                 Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Theme.of(context).primaryColor,
                                      style: BorderStyle.solid,
                                      width: 1.0,
                                    ),
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(2.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Center(
                                          child: Text(
                                              "SAVE",
                                              style:Theme.of(context).textTheme.button.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.white)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),


                              ],



                            ),


                          ]
                      ),
                ),
              );
            }
        );
      }

  );

}
}