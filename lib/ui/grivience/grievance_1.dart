import 'package:cloud_kitchen/network/model/request/Grievance/Grievance.dart';
import 'package:cloud_kitchen/network/model/response/GrievanceList.dart';
import 'package:cloud_kitchen/network/model/response/MadhviCredit.dart';
import 'package:cloud_kitchen/ui/model/MadhviCreditsModel.dart';
import 'package:cloud_kitchen/viewmodel/grivience/greivanceViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

GreivanceViewModel greivanceViewModel = GreivanceViewModel();
class Greivance extends StatefulWidget {
  @override
  _GreivanceState createState() => _GreivanceState();
}

class _GreivanceState extends State<Greivance> {

   List<Grievance> grieList = [
    Grievance(
            grieveId: 15,
            orderId: 44,
            grievenceTypeId: 1,
            grievenceSubtypeId: 1,
            remark: "hjghjgj hjhj jhk jjkjkl",
            currentStatus: 1,
            insertDateTime: "07-11-2020 06:19 PM",
            insertById: 16,
            grievenceTypeName: null,
            grievenceSubtypeName: null,
            date: "07-11-2020",
            extraInt1: 1,
            extraInt2: 0,
            extraVar1: null,
            extraVar2: null,
            platform: 1,
            grievencceNo: "00011",
            grvInstrustion: "Poor Packaging",
            grvType: "Packaging Issue",
            orderNo: "00181",

        ),
     Grievance(
            grieveId: 15,
            orderId: 44,
            grievenceTypeId: 1,
            grievenceSubtypeId: 1,
            remark: "hjghjgj hjhj jhk jjkjkl",
            currentStatus: 1,
            insertDateTime: "07-11-2020 06:19 PM",
            insertById: 16,
            grievenceTypeName: null,
            grievenceSubtypeName: null,
            date: "07-11-2020",
            extraInt1: 1,
            extraInt2: 0,
            extraVar1: null,
            extraVar2: null,
            platform: 1,
            grievencceNo: "00011",
            grvInstrustion: "Poor Packaging",
            grvType: "Packaging Issue",
            orderNo: "00181",

        ),
  ];

  @override
  void initState() {
    // TODO: implement initState
  //  var  myLocalPrefes = MyLocalPrefes();
  //  String phone = myLocalPrefes.getCustPhone();
  //  print(phone);
    greivanceViewModel.getGrievanceList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Grievance History',style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white,)),
        ),
        body:SingleChildScrollView(
          child: Observer(builder: (_){
            return greivanceViewModel.isLoading?LinearProgressIndicator():Container(
              child:

              greivanceViewModel.grievanceListMain.grievanceList.isNotEmpty?   Container(
                height: MediaQuery.of(context).size.height,
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.black,
                  ),
                   itemCount:  greivanceViewModel.grievanceListMain.grievanceList.length,
                  itemBuilder: (context, index) {
                  GrievanceList item=  greivanceViewModel.grievanceListMain.grievanceList[index];
                    return Container(
                      margin:const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                      padding: EdgeInsets.all(4),
                      width: MediaQuery.of(context).size.width,
                      child: InkWell(
                        onTap: (){
                          // Navigator.push(context,
                          //     new MaterialPageRoute(builder: (BuildContext context) => OrderSummary(widget.allFrenchisiViewModel.orderHistory.orderList[index],widget.allFrenchisiViewModel)));
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
                                              'Grievance No: ${item.grievencceNo}',
                                              style:Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.bold).copyWith(color:Theme.of(context).primaryColor)),

                                        ],
                                      ),
                                      SizedBox(height: 4,),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width*.70,
                                        child: Text(
                                            '${item.grvType}',style:Theme.of(context).textTheme.bodyText2.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
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
                                'Grievance date',
                                style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
                            SizedBox(height: 4,),
                            Text(
                                '${item.date}',style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold).copyWith(color:Colors.black)),


                            SizedBox(
                              height: 10,
                            ),

                            Text(
                                'Grievance Instruction',
                                style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
                            SizedBox(height: 4,),
                            Text(
                                '${item.grvInstrustion}',style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold).copyWith(color:Colors.black)),

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
                                    '${item.remark}',
                                    style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold).copyWith(color:Colors.grey)),





                              ],),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ):Container(
              child: Center(
                child: Text("No data available",style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.black),),
              ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              )
                      // padding: EdgeInsets.only(top:8),
                      // scrollDirection:Axis.horizontal,

                    );
  //                 new ListView.builder(
  //                   itemCount: madhvi.length, //greivanceViewModel.grievanceList == null ? madhvi.length : 0, //greivanceViewModel.grievanceList.length,
  //                   shrinkWrap: true,
  //   itemBuilder: (context, index) {
  //     // MadhviCredit mCredit = greivanceViewModel.grievanceList[index];
  //     // bool cr = mCredit.transcType == 'CR' ? true : false;
  //     return Container(
        
  //       height: 50,
  //       // color: Colors.blue,
  //         child: InkWell(
  //           onTap: (){
  //             Navigator.pushReplacement(context,
  //                 new MaterialPageRoute(builder: (BuildContext context) => OrderSummary()));
  //           },
  //           child: Align(
  //             alignment: Alignment.center,
  //             child:ListView(
  //                     // padding: EdgeInsets.only(top:8),
  //                     scrollDirection:Axis.horizontal,
  //                     children: [
  //                       Text('GRV NO.', style: Theme
  //                   .of(context)
  //                   .textTheme
  //                   .subtitle1
  //                   .copyWith(fontWeight: FontWeight.normal)
  //                   .copyWith(color: Colors.grey,),
  //                   textAlign: TextAlign.center,
  //                   ),
  //                   SizedBox(width: 20),
  //                   Text('DATE.', style: Theme
  //                   .of(context)
  //                   .textTheme
  //                   .subtitle1
  //                   .copyWith(fontWeight: FontWeight.normal)
  //                   .copyWith(color: Colors.grey)),
  //                   SizedBox(width: 20),
  //                   Text('GRV NO.', style: Theme
  //                   .of(context)
  //                   .textTheme
  //                   .subtitle1
  //                   .copyWith(fontWeight: FontWeight.normal)
  //                   .copyWith(color: Colors.grey)),
  //                   SizedBox(width: 20),
  //                   Text('GRV AMT.', style: Theme
  //                   .of(context)
  //                   .textTheme
  //                   .subtitle1
  //                   .copyWith(fontWeight: FontWeight.normal)
  //                   .copyWith(color: Colors.grey)),
  //                   SizedBox(width: 20),
  //                   Text('ORD AMT.', style: Theme
  //                   .of(context)
  //                   .textTheme
  //                   .subtitle1
  //                   .copyWith(fontWeight: FontWeight.normal)
  //                   .copyWith(color: Colors.grey)),
  //                   SizedBox(width: 20),
  //                   Text('SETTLE.', style: Theme
  //                   .of(context)
  //                   .textTheme
  //                   .subtitle1
  //                   .copyWith(fontWeight: FontWeight.normal)
  //                   .copyWith(color: Colors.grey))
  //                     ],
  //                   )
  //           )
  //         ),
  //     );
  //  },
  //                 ),
          // );
          })
        ),
    );
  }
}

class ListDisplay extends StatelessWidget {
  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
      //  appBar: new AppBar(title: new Text("Dynamic Demo"),),
        body:  ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                      'Credits History',
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontWeight: FontWeight.bold)
                          .copyWith(color: Colors.black)),
                  SizedBox(height: 20,),
                  Text(
                      'Oct 10,2020', style: Theme
                      .of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(fontWeight: FontWeight.normal)
                      .copyWith(color: Colors.grey)),
                  SizedBox(height: 4,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      Text(
                          'Paid for order 9876543210', style: Theme
                          .of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(fontWeight: FontWeight.normal)
                          .copyWith(color: Colors.grey)),
                      Text(
                          '-Rs 58.00', style: Theme
                          .of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(fontWeight: FontWeight.bold)
                          .copyWith(color: Theme.of(context).primaryColor)),

                    ],),
                  SizedBox(height: 4,),
                  Text(
                      'Expires on Oct 15,2020', style: Theme
                      .of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(fontWeight: FontWeight.normal)
                      .copyWith(color: Colors.grey)),
                  SizedBox(height: 8,),

                  Divider(
                    color: Colors.grey,
                  ),
                ],
              ),
            );
          },
        ),
// ListView.builder() shall be used here.
    );

  }
}
