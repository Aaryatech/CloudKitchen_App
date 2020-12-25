import 'package:cloud_kitchen/ui/dairymart/bulkorder.dart';
import 'package:cloud_kitchen/viewmodel/bulkorderviewmodel/bulkorderviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:url_launcher/url_launcher.dart';

BulkOrderViewModel bulkOrderViewModel=BulkOrderViewModel();
class DairyMart extends StatefulWidget {
  @override
  _DairyMartState createState() => _DairyMartState();
}

class _DairyMartState extends State<DairyMart> {


  @override
  void initState() {
    // TODO: implement initState
    bulkOrderViewModel.getMartStatus();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      appBar:  AppBar(
        title: Text('Dairy Mart',style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),
          ),
      ),
        body: Observer(
          builder:(_)=> Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children:[

                  // bulkOrderViewModel.isLoading?LinearProgressIndicator():Container(),

                    Image.asset('images/dairymart.jpg',width: MediaQuery.of(context).size.width,height:MediaQuery.of(context).size.width/2,fit: BoxFit.cover,)
                  ,SizedBox(height: 16,),
                  SizedBox(
                      width: MediaQuery.of(context).size.width*.85,
                      child: Column(
                        children: [
                          Text('Worried, how you will manage your party! Need not to be. Please fill the form and we will get back to you within couple of hours.',textAlign: TextAlign.center,style: Theme.of(context).textTheme.subtitle2.copyWith(fontFamily: 'Open Sans regular')),
                          SizedBox(height: 8,),
                          Text('Orders are accepted only for Gujarat.',textAlign: TextAlign.center,style: Theme.of(context).textTheme.subtitle2.copyWith(fontFamily: 'Open Sans regular',fontWeight: FontWeight.w600),),
                        ],
                      )),

                    SizedBox(height: 32,),

                  Text("Be one of the smartest hosts!",style: Theme.of(context).textTheme.headline6.copyWith(color: Theme.of(context).primaryColor,fontFamily: 'Metropolis Semi Bold'),)
                  ,SizedBox(height: 16,),
                  Text("To place a BULK ORDER",style: Theme.of(context).textTheme.subtitle1,)
                ,SizedBox(height: 16,),

                  InkWell(
                    onTap: (){

                      if(bulkOrderViewModel.mart.delStatus==0 && !bulkOrderViewModel.isLoading) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => BulkOrder(bulkOrderViewModel)));
                      }else{

                      }
                    },
                    child:

                    // Container(
                    //   width: MediaQuery.of(context).size.width*5,
                    //   padding: EdgeInsets.all(8),
                    //   decoration: BoxDecoration(
                    //     border: Border.all(
                    //       color: Theme.of(context).primaryColor,
                    //       style: BorderStyle.solid,
                    //       width: 1.0,
                    //     ),
                    //     borderRadius: BorderRadius.circular(8.0),
                    //
                    //   ),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: <Widget>[
                    //       SizedBox(height: 28,width: 4,),
                    //       Expanded(
                    //         child: Text( "FILL THE FORM",textAlign: TextAlign.center,
                    //             style: Theme.of(context).textTheme.bodyText1.copyWith(color: bulkOrderViewModel.isLoading?Colors.black:bulkOrderViewModel.mart.delStatus==1?Colors.black:Theme.of(context).primaryColor,)),
                    //       )
                    //     ],
                    //   ),
                    // )



                    Container(
                padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
                border: Border.all(color: bulkOrderViewModel.isLoading?Colors.grey[300]:bulkOrderViewModel.mart.delStatus==1?Colors.grey[300]:Theme.of(context).primaryColor,),
                 borderRadius: BorderRadius.circular(8.0),
                 ),
      child:( Text('FILL THE FORM',style: Theme.of(context).textTheme.bodyText1.copyWith(color: bulkOrderViewModel.isLoading?Colors.black:bulkOrderViewModel.mart.delStatus==1?Colors.black:Theme.of(context).primaryColor,))
                    ),
                    ),
                  ),
              SizedBox(height: 16,),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0,right:8),
                    child: Row(
                      children: [
                        Flexible(child: Container(height: 1,color: Colors.grey[300],)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("OR",style: Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.black87),),
                        ),
                        Flexible(child: Container(height: 1,color: Colors.grey[300],))
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      initiateHelpCall();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(

                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.call,color: Theme.of(context).primaryColor,size: 32,),
                            Text(' 82600 60049',style: Theme.of(context).textTheme.headline6,)
                          ],
                        ),
                      ),
                    ),
                  )

      ],
              ),
              bulkOrderViewModel.isLoading?Container(
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
      ),

    );
  }

  void initiateHelpCall(){
    launch('tel:8260060049');

  }
}
