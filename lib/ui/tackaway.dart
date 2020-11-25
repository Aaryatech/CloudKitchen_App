import 'package:cloud_kitchen/network/model/response/Franchise.dart';
import 'package:cloud_kitchen/ui/home/HomeScreen.dart';
import 'package:cloud_kitchen/viewmodel/franchisi/frviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:url_launcher/url_launcher.dart';

class TakeAway extends StatefulWidget {

  final AllFrenchisiViewModel allFrenchisiViewModel;

  const TakeAway({this.allFrenchisiViewModel});

  @override
  _TakeAwayState createState() => _TakeAwayState();
}

class _TakeAwayState extends State<TakeAway> {



  bool showlist=false;

  List<Frainchise> filterList=[];
  bool isLoading=true;


  @override
  void initState() {
    // TODO: implement initState
    // getSelectedFranchise();/
    // widget.allFrenchisiViewModel.getAllFranchiseForTackAway();

    callAllFraichiseMethod();
    super.initState();
  }

  callAllFraichiseMethod()async{
     setState(() {
       isLoading=true;
     });

     filterList=await widget.allFrenchisiViewModel.getFranchise();


     setState(() {
      isLoading=false;
    });


  }


   Future<void> openMap() async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=${widget.allFrenchisiViewModel.selectedFranchise.fromLatitude},${widget.allFrenchisiViewModel.selectedFranchise.fromLongitude}';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body :Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        child: WillPopScope(
          onWillPop: (){
            Navigator.pop(context);
          },
          child:  Observer(
            builder:(_)=>(!widget.allFrenchisiViewModel.isLoading)?
            isLoading?Container():  SingleChildScrollView(
              child:Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                    Stack(
                    overflow:Overflow.visible,
                      children: [
                        Container(

                          color: Colors.red,
                          height: 80,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                SizedBox(height: 8,),
                                Row(
                                  children: [
                                    InkWell(

                                        onTap:(){
                                          Navigator.pop(context);
                                        },
                                        child: Icon(Icons.arrow_back,color: Colors.white,)),
                                    SizedBox(width: 8,),
                                    Text('Takeaway',style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),


                        Positioned(
                          bottom: -60,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Padding(padding: EdgeInsets.all(16),
                              child: Card(
                                elevation: 4,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Your Location",style: Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.grey),),

                                      SizedBox(height: 8,),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [

                                          Row(
                                            children: [
                                              Icon(Icons.check_circle,color: Colors.red,size: 16,),
                                              SizedBox(width: 8,),
                                              Text(widget.allFrenchisiViewModel.getCustAddress(),style: Theme.of(context).textTheme.bodyText2.copyWith(fontWeight: FontWeight.w600),)
                                            ],

                                          ),
                                          // Text("CHANGE",style: Theme.of(context).textTheme.caption.copyWith(color: Colors.red,),)

                                        ],
                                      )
                                    ],
                                  ),
                                ),

                              ),
                            ),
                          ),
                        )

                      ],
                    ),


                    SizedBox(height: 40,),


                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text('Your Nearest Restaurent',style: Theme.of(context).textTheme.subtitle2,),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1,color: Colors.grey)
                      ),
                      margin: EdgeInsets.all(16),
                      padding: EdgeInsets.all(8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width:70,
                            height: 70,
                            child: Image.asset('images/dish.png')),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text( filterList[0].frName,style: Theme.of(context).textTheme.subtitle2,),

                              SizedBox(height: 4,),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width-145,
                                  child: Text(filterList[0].frAddress,style: Theme.of(context).textTheme.caption.copyWith(color: Colors.grey),)),
                              SizedBox(height: 16,),

                              SizedBox(
                                width: MediaQuery.of(context).size.width-145,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [



                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Distance:',style: Theme.of(context).textTheme.subtitle2.copyWith(fontWeight: FontWeight.w600),),
                                        Text('${filterList[0].distance.toStringAsFixed(2)} Km (${filterList[0].duration} ride)',style: Theme.of(context).textTheme.caption.copyWith(color: Colors.grey),)
                                      ],
                                    ),
                                  ],
                                ),
                              ),



                              SizedBox(height: 16,),
                              SizedBox(
                                width: MediaQuery.of(context).size.width-145,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                        onTap:(){
                                          openMap();
                                        },
                                        child: Text('VIEW ON MAP',style: Theme.of(context).textTheme.caption.copyWith(color: Colors.red),)),


                                    InkWell(
                                      onTap: (){
                                        widget.allFrenchisiViewModel.changeOutlet(filterList[0]);
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(8),
                                        color: Colors.red,
                                        child: Text('SELECT',style: Theme.of(context).textTheme.caption.copyWith(color: Colors.white),),
                                      ),
                                    )

                                  ]
                                  ,
                                ),
                              ),



                            ],
                          ),
                        )

                      ],


                      ),
                    ),


                   showlist?Container(): Center(
                      child: RaisedButton(
                          onPressed: (){

                            setState(() {
                              showlist=true;
                            });
                          },
                        child: Text("VIEW MORE RESTAURENTS",style: Theme.of(context).textTheme.caption.copyWith(color: Theme.of(context).primaryColor),),

                      ),
                    ),


                    ( !isLoading && showlist)? Container(
                      child: ListView.separated(
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => Divider(
                          color: Colors.black,
                        ),
                        physics: ScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: filterList.length-1,
                        itemBuilder: (_, int index) {
                          Frainchise franchise=filterList[index+1];
                          return  Container(
                            decoration: BoxDecoration(
                                border: Border.all(width: 1,color: Colors.grey)
                            ),
                            margin: EdgeInsets.all(16),
                            padding: EdgeInsets.all(8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                    width:70,
                                    height: 70,
                                    child: Image.asset('images/dish.png')),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text( franchise.frName,style: Theme.of(context).textTheme.subtitle2,),

                                      SizedBox(height: 4,),
                                      SizedBox(
                                          width: MediaQuery.of(context).size.width-145,
                                          child: Text(franchise.frAddress,style: Theme.of(context).textTheme.caption.copyWith(color: Colors.grey),)),
                                      SizedBox(height: 16,),

                                      SizedBox(
                                        width: MediaQuery.of(context).size.width-145,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [


                                            Column(

                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Distance:',style: Theme.of(context).textTheme.subtitle2.copyWith(fontWeight: FontWeight.w600),),
                                                Text('${franchise.distance} km (${franchise.duration} ride)',style: Theme.of(context).textTheme.caption.copyWith(color: Colors.grey),),

                              ],
                                            ),
                                          ],
                                        ),
                                      ),



                                      SizedBox(height: 16,),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width-145,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                                onTap:()async{
                                                  // openMap();
                                                  String googleUrl = 'https://www.google.com/maps/search/?api=1&query=${franchise.fromLatitude},${franchise.fromLongitude}';
                                                  if (await canLaunch(googleUrl)) {
                                                    await launch(googleUrl);
                                                  } else {
                                                    throw 'Could not open the map.';
                                                  }
                                                },
                                                child: Text('VIEW ON MAP',style: Theme.of(context).textTheme.caption.copyWith(color: Colors.red),)),


                                            InkWell(
                                              onTap: (){

                                                widget.allFrenchisiViewModel.changeOutlet(franchise);
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(8),
                                                color: Colors.red,
                                                child: Text('SELECT',style: Theme.of(context).textTheme.caption.copyWith(color: Colors.white),),
                                              ),
                                            )

                                          ]
                                          ,
                                        ),
                                      ),



                                    ],
                                  ),
                                )

                              ],


                            ),
                          );
                        },
                      ),
                    ):Container()

                  ],
                ),
              ),
            ):Center(child:LinearProgressIndicator(
              valueColor:AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor) ,
            )),
          ),
        ),
      ),
    ));
  }



}
