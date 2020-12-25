
import 'package:cloud_kitchen/network/model/response/Franchise.dart';
import 'package:cloud_kitchen/viewmodel/franchisi/frviewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OutletTypes extends StatefulWidget {
 final AllFrenchisiViewModel allFrenchisiViewModel;

  const OutletTypes( this.allFrenchisiViewModel);

  @override
  _OutletTypesState createState() => _OutletTypesState();
}

class _OutletTypesState extends State<OutletTypes> {
  int segmentedControlGroupValue = 0;


  @override
  void initState() {
    // TODO: implement initState
    widget.allFrenchisiViewModel.getAllFranchiseForTackAway();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
        elevation: 0,
        title: Text("Outlets",style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white,)),
       

          bottom: TabBar(
            labelColor: Colors.white,
            labelStyle: Theme.of(context).textTheme.subtitle1.copyWith(fontFamily: 'Metropolis Semi Bold'),
            unselectedLabelStyle:Theme.of(context).textTheme.subtitle1,
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(text: "Dairy",),
              Tab(text: "Restaurants"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
           widget.allFrenchisiViewModel.isLoading?Container(child:LinearProgressIndicator(),):getDairyList(),
            widget.allFrenchisiViewModel.isLoading?Container(child:LinearProgressIndicator(),):getRestaurentList(),
          ],
        ),
      ),
    );
  }

  Widget getDairyList() {

    List<Frainchise> list= widget.allFrenchisiViewModel.getDairys(1);

    return ListView.builder(
      itemCount: list.length,
        itemBuilder: (context, index) =>  Container(
          margin: EdgeInsets.all(16),
     child: Card(
       elevation: 1,
       child: Column(
         children: [
           Container(
             height: 150,
             width: MediaQuery.of(context).size.width*9,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)),
               image: DecorationImage(
                 fit: BoxFit.cover,
                 image: AssetImage('images/dairymart.jpg')
               )
             ),
           ),


           SizedBox(width: 8,),

           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text(list[index].frName,style: Theme.of(context).textTheme.subtitle1.copyWith(fontFamily: 'Metropolis Semi Bold'),),


                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.call,color: Color(0xff0A6D00),size: 14,),                SizedBox(width: 4,)
                          ,Text('Call Now',style: Theme.of(context).textTheme.caption.copyWith(color: Color(0xff0A6D00),fontFamily: 'Metropolis Semi Bold'),)
                        ],
                      ),


                    ],
                  )

                   ],
                 ),
                 SizedBox(height: 8,),
                 Text(list[index].frAddress,style: Theme.of(context).textTheme.caption.copyWith(color: Colors.black87, fontFamily: 'Metropolis',height: 1.2),),

                 SizedBox(height: 8,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text( '' ,style: Theme.of(context).textTheme.caption.copyWith(color: Colors.grey,fontFamily: 'Metropolis Semi Bold'),),
                     Row(
                       children: [
                         Icon(Icons.location_on_outlined,color: Colors.blue,size: 14,),                SizedBox(width: 4,)
                         ,Text(  'Show on Map',style: Theme.of(context).textTheme.caption.copyWith(color: Colors.blue,fontFamily: 'Metropolis Semi Bold'),)
                       ],
                     ),
                   ],
                 ),
               ],
             ),
           )

         ],
       ),
     ),
    )
    );
  }

Widget  getRestaurentList(){
  List<Frainchise> list=widget.allFrenchisiViewModel.getDairys(2);

   return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) =>  Container(
        margin: EdgeInsets.all(16),
        child: Card(
          elevation: 1,
          child: Column(
            children: [
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width*9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/dairymart.jpg')
                    )
                ),
              ),


              SizedBox(width: 8,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(list[index].frName,style: Theme.of(context).textTheme.subtitle2.copyWith(fontFamily: 'Metropolis Semi Bold'),),


                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.call,color: Colors.green,),                SizedBox(width: 4,)
                                ,Text('Call Now',style: Theme.of(context).textTheme.caption.copyWith(color: Colors.green,fontFamily: 'Metropolis Semi Bold'),)
                              ],
                            ),

                            Row(
                              children: [
                                Icon(Icons.location_on_outlined,color: Colors.blue,),                SizedBox(width: 4,)
                                ,Text(  'Show on Map',style: Theme.of(context).textTheme.caption.copyWith(color: Colors.blue,fontFamily: 'Metropolis Semi Bold'),)
                              ],
                            ),
                          ],
                        )

                      ],
                    ),

                    Text(list[index].frAddress,style: Theme.of(context).textTheme.caption,),

                    SizedBox(height: 8,),
                    Row(
                      children: [
                        Icon(Icons.alarm,color: Colors.grey[400],),                SizedBox(width: 4,)
                        ,Text( '8.00 am to 11.00 pm' ,style: Theme.of(context).textTheme.caption.copyWith(color: Colors.grey[400],fontFamily: 'Metropolis Semi Bold'),)
                      ],
                    ),
                  ],
                ),
              )

            ],
          ),
        ),
      )
  );
}

}
