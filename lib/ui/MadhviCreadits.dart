import 'package:cloud_kitchen/ui/OrderSummary.dart';
import 'package:cloud_kitchen/ui/model/MadhviCreditsModel.dart';
import 'package:flutter/material.dart';

class MadhviCredits extends StatefulWidget {
  @override
  _MadhviCreditsState createState() => _MadhviCreditsState();
}

class _MadhviCreditsState extends State<MadhviCredits> {

  final List<MadhviCreditModel> madhvi = [
    MadhviCreditModel(heading: 'Oct 10,2020',desc: 'Paid for order 9876543210',date: 'Expires on Oct 15,2020',pirce: '- Rs 58.00'),
     MadhviCreditModel(heading: 'Oct 10,2020',desc: 'Paid for order 9876543210',date: 'Expires on Oct 15,2020',pirce: '- Rs 58.00'),
    MadhviCreditModel(heading: 'Oct 10,2020',desc: 'Paid for order 9876543210',date: '',pirce: '- Rs 58.00'),
    MadhviCreditModel(heading: 'Oct 10,2020',desc: 'Paid for order 9876543210',date: 'Expires on Oct 15,2020',pirce: '- Rs 58.00'),
    MadhviCreditModel(heading: 'Oct 10,2020',desc: 'Paid for order 9876543210',date: 'Expires on Oct 15,2020',pirce: '- Rs 58.00'),
    MadhviCreditModel(heading: 'Oct 10,2020',desc: 'Paid for order 9876543210',date: '',pirce: '- Rs 58.00'),
    MadhviCreditModel(heading: 'Oct 10,2020',desc: 'Paid for order 9876543210',date: 'Expires on Oct 15,2020',pirce: '- Rs 58.00'),
    MadhviCreditModel(heading: 'Oct 10,2020',desc: 'Paid for order 9876543210',date: 'Expires on Oct 15,2020',pirce: '- Rs 58.00')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Madhvi Credits'),
        ),
        body:SingleChildScrollView(
          child: Container(

            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Text(
                      'Save money by using Madhvi Credits when paying online for an order',style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.grey)),
                  SizedBox(height: 20,),

                  Text(
                      'Credit Balance',
                      style:Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.bold).copyWith(color:Colors.black)),
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 4,
                  ),

                  Text(
                      'Rs 0.00',style:Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.bold).copyWith(color:Colors.black)),
                  SizedBox(height: 20,),


                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(height: 20,),
                  Text(
                      'Credits History',
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontWeight: FontWeight.bold)
                          .copyWith(color: Colors.black)),
                  SizedBox(height: 20,),
                //  new ListDisplay(),

                  new ListView.builder(
                    itemCount: madhvi.length,
                    shrinkWrap: true,
    itemBuilder: (context, index) {
      return Container(

          child: InkWell(
            onTap: (){
              Navigator.pushReplacement(context,
                  new MaterialPageRoute(builder: (BuildContext context) => OrderSummary()));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Text(
                    '${madhvi[index].heading}', style: Theme
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
                        '${madhvi[index].desc}', style: Theme
                        .of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(fontWeight: FontWeight.normal)
                        .copyWith(color: Colors.grey)),

                    Text(
                        '${madhvi[index].pirce}', style: Theme
                        .of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(fontWeight: FontWeight.bold)
                        .copyWith(color: Colors.green)),

                  ],),
                SizedBox(height: 4,),


                Text(
                    '${madhvi[index].date}', style: Theme
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
          ),
      );
   },
                  ),


                ],),
            ),
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
