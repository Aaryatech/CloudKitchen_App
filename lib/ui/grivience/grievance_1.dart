import 'package:cloud_kitchen/network/model/response/GrievanceList.dart';
import 'package:cloud_kitchen/viewmodel/grivience/greivanceViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

GreivanceViewModel greivanceViewModel = GreivanceViewModel();
class Greivance extends StatefulWidget {
  @override
  _GreivanceState createState() => _GreivanceState();
}

class _GreivanceState extends State<Greivance> {


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
                height: MediaQuery.of(context).size.height*.85,
                child:

              greivanceViewModel.grievanceListMain.grievanceList.isNotEmpty?   Container(

                child: ListView.builder(
                  itemCount:  greivanceViewModel.grievanceListMain.grievanceList.length,
                  itemBuilder: (context, index) {
                  GrievanceList item=  greivanceViewModel.grievanceListMain.grievanceList[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 1,
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          padding: EdgeInsets.all(4),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              Row(
                                // crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Image.asset('images/ic_launcher.png',width: 50,height: 50,),

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
                                                style:Theme.of(context)
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
                                        SizedBox(height: 4,),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width*.70,
                                          child: Text(
                                              '${item.grvType}',style: Theme.of(context)
                                              .textTheme
                                              .caption
                                              .copyWith(fontFamily:'Metropolis')),
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
                                color: Colors.grey[300],
                              ),
                              SizedBox(
                                height: 4,
                              ),


                              Text(
                                  'Grievance date',
                                  style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(fontWeight: FontWeight.normal)
                                  .copyWith(color: Colors.grey)),
                              SizedBox(height: 4,),
                              Text(
                                  '${item.date}', style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(fontFamily: 'Metropolis')),


                              SizedBox(
                                height: 10,
                              ),

                              Text(
                                  'Grievance Instruction',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(fontWeight: FontWeight.normal)
                                      .copyWith(color: Colors.grey)),
                              SizedBox(height: 4,),
                              Text(
                                  '${item.grvInstrustion}',style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(fontFamily: 'Metropolis')),


                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  'Grievance Status',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(fontWeight: FontWeight.normal)
                                      .copyWith(color: Colors.grey)),
                              SizedBox(
                                height: 4,
                              ),

                               Row(

                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                      item.currentStatus==0?"Pending": item.currentStatus==1?"Resolved":"Rejected",
                                      style:Theme.of(context).textTheme.bodyText1.copyWith(fontFamily:'Metropolis Semi Bold',color:item.currentStatus==0?Colors.red:item.currentStatus==1?Color(0xff0A6D00):Colors.red)),


                                  item.currentStatus==1?  item.extraInt1==1?Row(
                                    children: [

                                      Text('Credits: ', style:Theme.of(context).textTheme.bodyText1.copyWith(fontWeight: FontWeight.bold).copyWith(color:item.currentStatus==0?Colors.red:item.currentStatus==1?Color(0xff0A6D00):Colors.red)),
                                      Image.asset('images/rupees_icn.png',width: 16,height: 16,color: Color(0xff0A6D00),),
                                      Text('${item.walletAmt}', style:Theme.of(context).textTheme.bodyText1.copyWith(fontWeight: FontWeight.bold).copyWith(color:item.currentStatus==0?Colors.red:item.currentStatus==1?Color(0xff0A6D00):Colors.red))
                                    ],
                                  ): Text("Return Product", style:Theme.of(context).textTheme.bodyText1.copyWith(fontWeight: FontWeight.bold).copyWith(color:item.currentStatus==0?Colors.red:item.currentStatus==1?Color(0xff0A6D00):Colors.red)):Container()


                                ],),
                            ],
                          ),
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
