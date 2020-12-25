import 'package:cloud_kitchen/network/model/response/MadhviCredit.dart';
import 'package:cloud_kitchen/ui/model/MadhviCreditsModel.dart';
import 'package:cloud_kitchen/ui/order/OrderSummary.dart';
import 'package:cloud_kitchen/viewmodel/madhvicredit/madhviCreditViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

MadhviCreditViewModel madhviCreditViewModel = MadhviCreditViewModel();
class MadhviCredits extends StatefulWidget {
  @override
  _MadhviCreditsState createState() => _MadhviCreditsState();
}

class _MadhviCreditsState extends State<MadhviCredits> {

   List<MadhviCredit> madhvi = [];

  @override
  void initState() {
    // TODO: implement initState
  //  var  myLocalPrefes = MyLocalPrefes();
  //  String phone = myLocalPrefes.getCustPhone();
  //  print(phone);

    madhviCreditViewModel.total=0;
    madhviCreditViewModel.getMadhviCredit();
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Observer(
        builder:(_)=> Stack(
          children: [
            Scaffold(
                appBar: AppBar(
                  title: Text('Madhvi Credits',style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),),
                ),
                body:SingleChildScrollView(
                  child: Observer(builder: (_){
                    if (madhviCreditViewModel.madhviCreditList != null) {
                      madhvi = madhviCreditViewModel.madhviCreditList.walletTransaction;
                    }
                    return Container(

                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          Text(
                              'Save money by using Madhvi Credits when paying online for an order',style:Theme.of(context).textTheme.bodyText2.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
                          SizedBox(height: 8,),

                          Text(
                              'Credit Balance',
                              style:Theme.of(context).textTheme.headline6),
                          Divider(
                            color: Colors.grey[300],
                          ),
                          SizedBox(
                            height: 4,
                          ),

                          Row(
                            children: [
                              Image.asset('images/rupees_icn.png',width: 22,height: 22,),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                  '${madhviCreditViewModel.total}',style:Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.bold).copyWith(color:Colors.black)),
                            ],
                          ),

                          SizedBox(height: 4,),


                          Divider(
                            color: Colors.grey[300],
                          ),
                          SizedBox(height: 12,),
                          Text(
                              'Credits History',
                              style:Theme.of(context).textTheme.headline6),
                          SizedBox(height: 20,),
                        //  new ListDisplay(),

                          (!madhviCreditViewModel.isLoading && madhviCreditViewModel.madhviCreditList.walletTransaction.isNotEmpty)? ListView.separated(
                            itemCount:  madhvi.length,
                            separatorBuilder: (context, index) => Divider(
                              color: Colors.grey[300],
                              height: 1,
                            ),                            shrinkWrap: true,
                             itemBuilder: (context, index) {
                            bool cr = madhvi[index].transcType == 'CR' ? true : false;



                            return ListTile(
                              title: Text('${madhvi[index].orderDate}',style: Theme.of(context).textTheme.subtitle2,),
                              subtitle:Text( 'Paid for order: ' + '${madhvi[index].billNo}',style: Theme.of(context).textTheme.subtitle2) ,
                              trailing:Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text( cr ? '+' : '-', style: Theme.of(context).textTheme.subtitle1.copyWith(color: cr ? Color(0xff0A6D00) : Colors.red)),
                                  SizedBox(width: 2,),
                                  Image.asset('images/rupees_icn.png',width: 16,height: 16,color: cr ? Color(0xff0A6D00) : Colors.red,),
                                  Text( '${madhvi[index].amount}', style: Theme.of(context).textTheme.subtitle2.copyWith(color: cr ? Color(0xff0A6D00) : Colors.red)),
                                ],
                              )

                          );

                           },
                          ):Container(
                            padding: EdgeInsets.only(top:32),
                            child: Center(child: Text('No Transaction Available',style: Theme.of(context).textTheme.headline6,)),
                          ),


                        ],),
                    ),
                  );
                  })
                ),
            ),

            (madhviCreditViewModel.isLoading)?Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.black.withOpacity(.3),
              child: Center(
                child: CircularProgressIndicator(
                  valueColor:AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor) ,
                ),
              ),
            ):Container(),
          ],
        ),
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
            return ListTile(

            );



            //   Container(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: <Widget>[
            //       Text(
            //           'Credits History',
            //           style: Theme
            //               .of(context)
            //               .textTheme
            //               .headline6
            //               .copyWith(fontWeight: FontWeight.bold)
            //               .copyWith(color: Colors.black)),
            //       SizedBox(height: 20,),
            //       Text(
            //           'Oct 10,2020', style: Theme
            //           .of(context)
            //           .textTheme
            //           .subtitle1
            //           .copyWith(fontWeight: FontWeight.normal)
            //           .copyWith(color: Colors.grey)),
            //       SizedBox(height: 4,),
            //
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: <Widget>[
            //
            //           Text(
            //               'Paid for order 9876543210', style: Theme
            //               .of(context)
            //               .textTheme
            //               .subtitle1
            //               .copyWith(fontWeight: FontWeight.normal)
            //               .copyWith(color: Colors.grey)),
            //           Text(
            //               '-Rs 58.00', style: Theme
            //               .of(context)
            //               .textTheme
            //               .subtitle1
            //               .copyWith(fontWeight: FontWeight.bold)
            //               .copyWith(color: Theme.of(context).primaryColor)),
            //
            //         ],),
            //       SizedBox(height: 4,),
            //       Text(
            //           'Expires on Oct 15,2020', style: Theme
            //           .of(context)
            //           .textTheme
            //           .subtitle1
            //           .copyWith(fontWeight: FontWeight.normal)
            //           .copyWith(color: Colors.grey)),
            //       SizedBox(height: 8,),
            //
            //       Divider(
            //         color: Colors.grey,
            //       ),
            //     ],
            //   ),
            // );
          },
        ),
// ListView.builder() shall be used here.
    );

  }
}
