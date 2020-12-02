
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

            tabs: [
              Tab(text: "Dairy",),
              Tab(text: "Restaurants"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
           widget.allFrenchisiViewModel.isLoading?Container(child:LinearProgressIndicator(),):getDairyList(),
           getRestaurentList(),
          ],
        ),
      ),
    );
  }

  Widget getDairyList(){

    List<Frainchise> list=widget.allFrenchisiViewModel.getDairys(1);

    return ListView.builder(
      itemCount: list.length,
        itemBuilder: (context, index) =>  Container(
          margin: EdgeInsets.all(8),
     child: Row(
       children: [
         SizedBox(
             width:MediaQuery.of(context).size.width*.25,
             height: 100,
             child: Image.asset('images/loginbg.jpg',fit:BoxFit.cover),),


         SizedBox(width: 8,),

         Column(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Row(
               children: [
                 Icon(Icons.business,color: Colors.grey,),
                 SizedBox(width: 4,)
                 ,Text(list[index].frName,style: Theme.of(context).textTheme.subtitle2,)
               ],
             ),

             Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Icon(Icons.location_on,color: Colors.grey,)
                 ,
    SizedBox(width: 4,),

    SizedBox(
                     width: MediaQuery.of(context).size.width*.6,
                     child: Text(list[index].frAddress,style: Theme.of(context).textTheme.subtitle2,))
               ],
             ),

             Row(
               children: [
                 Icon(Icons.phone,color: Colors.grey,),                SizedBox(width: 4,)
            ,Text(list[index].frMob,style: Theme.of(context).textTheme.subtitle2,)
               ],
             ),
             InkWell(
               onTap: ()async{
                 String googleUrl = 'https://www.google.com/maps/search/?api=1&query=${list[index].fromLatitude},${list[index].fromLongitude}';
                 if (await canLaunch(googleUrl)) {
                   await launch(googleUrl);
                 } else {
                   throw 'Could not open the map.';
                 }
               },
               child: Row(
                 children: [
                   Image.asset('images/location_icn.png',color: Colors.grey,width: 24,height: 24,),                SizedBox(width: 4,)
    ,Text("Show On Map",style: Theme.of(context).textTheme.subtitle2,)
                 ],
               ),
             ),
           ],
         )

       ],
     ),
    )
    );
  }

Widget  getRestaurentList(){
  List<Frainchise> list=widget.allFrenchisiViewModel.getDairys(2);

  return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) =>  Container(
        margin: EdgeInsets.all(8),
        child: Row(
          children: [
            SizedBox(
              width:MediaQuery.of(context).size.width*.25,
              height: 100,
              child: Image.asset('images/loginbg.jpg',fit:BoxFit.cover),),


            SizedBox(width: 8,),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.business,color: Colors.grey,),
                    SizedBox(width: 4,)
                    ,Text(list[index].frName,style: Theme.of(context).textTheme.subtitle2,)
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.location_on,color: Colors.grey,)
                    ,
                    SizedBox(width: 4,),

                    SizedBox(
                        width: MediaQuery.of(context).size.width*.6,
                        child: Text(list[index].frAddress,style: Theme.of(context).textTheme.subtitle2,))
                  ],
                ),

                Row(
                  children: [
                    Icon(Icons.phone,color: Colors.grey,),                SizedBox(width: 4,)
                    ,Text(list[index].frMob,style: Theme.of(context).textTheme.subtitle2,)
                  ],
                ),
                InkWell(
                  onTap: ()async{
                    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=${list[index].fromLatitude},${list[index].fromLongitude}';
                    if (await canLaunch(googleUrl)) {
                    await launch(googleUrl);
                    } else {
                    throw 'Could not open the map.';
                    }
                  },
                  child: Row(
                    children: [
                      Image.asset('images/location_icn.png',color: Colors.grey,width: 24,height: 24,),                SizedBox(width: 4,)
                      ,Text("Show On Map",style: Theme.of(context).textTheme.subtitle2,)
                    ],
                  ),
                ),
              ],
            )

          ],
        ),
      )
  );
}

}
