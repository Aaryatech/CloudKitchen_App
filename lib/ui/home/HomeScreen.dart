import 'dart:async';

import 'package:cloud_kitchen/local/staticUrls.dart';
import 'package:cloud_kitchen/network/model/request/purchase/cartitem.dart';
import 'package:cloud_kitchen/network/model/response/FranchiseId.dart';
import 'package:cloud_kitchen/network/model/response/ItemData.dart';
import 'package:cloud_kitchen/network/model/response/SubCategoryData.dart';
import 'package:cloud_kitchen/ui/home/dashboard.dart';
import 'package:cloud_kitchen/ui/home/homeItem.dart';
import 'package:cloud_kitchen/ui/user/locationScreen.dart';
import 'package:cloud_kitchen/ui/order/menudetailspage.dart';
import 'package:cloud_kitchen/ui/supportui/nodataavailable.dart';
import 'package:cloud_kitchen/ui/tackaway.dart';
import 'package:cloud_kitchen/viewmodel/franchisi/frviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';



class HomeScreen extends StatefulWidget {

  final AllFrenchisiViewModel allFrenchisiViewModel;

  const HomeScreen(this.allFrenchisiViewModel);


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {






  int currentPage=0;

  PageController _controller = PageController(
    initialPage: 0,

  );


  bool isSortSelected=true;
  int selectedSort=1;

  double ratefive=5.0,ratefore=4.0,rateforeh=4.5,rateth=3.5,rateAny=1;
  bool five=false,four=false,hfour=false,hthree=false,any=false;
  List<String> ratings=[];
  void openFilterBottomSheet(){

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
                      .height*.45,
                  padding: EdgeInsets.all(16),

                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Sort and Filter',style: Theme.of(context).textTheme.subtitle2,),
                              InkWell(

                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                  child: Icon(Icons.close))
                            ],
                          ),
                          SizedBox(height: 16,),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.black.withOpacity(.3),
                            height: 1,
                          ),


                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(child: Row(
                                children: [
                                  Container(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap: (){
                                            setState((){
                                              isSortSelected=true;
                                            });
                                          },
                                          child: AnimatedContainer(
                                            duration: Duration(milliseconds: 300),
                                            child: Text('Sort by'),
                                            padding: EdgeInsets.all(24),
                                            color: isSortSelected?Colors.grey[300]:Colors.white,

                                          ),
                                        ),
                                        SizedBox(height: 16,),
                                        InkWell(
                                          onTap: (){
                                            setState((){
                                              isSortSelected=false;
                                            });
                                          },
                                          child: AnimatedContainer(
                                            duration: Duration(milliseconds: 300),
                                            padding: EdgeInsets.all(24),
                                            child: Text('Rating '),
                                            color: isSortSelected?Colors.white:Colors.grey[300],
                                          ),
                                        )
                                      ],

                                    ),
                                  )
                                ],

                              )),
                              Row(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*.65,

                                    child: isSortSelected?Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        RadioListTile(
                                          title: Text("Rating: High to low"),
                                          dense: true,
                                          toggleable: true,
                                          value: selectedSort,
                                          groupValue: 3,
                                          activeColor: Theme.of(context).primaryColor,
                                          selected: selectedSort==3,
                                          onChanged: (flag){

                                            setState((){
                                              selectedSort=3;

                                            });

                                          },
                                        ),

                                        RadioListTile(
                                          title: Text("Cost: High to low"),
                                          dense: true,
                                          groupValue: 2,
                                          toggleable: true,
                                          activeColor: Theme.of(context).primaryColor,
                                          selected: selectedSort==2,
                                          value: selectedSort,
                                          onChanged: (flag){

                                            setState((){
                                              selectedSort=2;

                                            });

                                          },
                                        ),

                                        RadioListTile(
                                          title: Text("Cost: Low to high"),
                                          dense: true,
                                          groupValue: 1,
                                          toggleable: true,
                                          activeColor: Theme.of(context).primaryColor,
                                          selected: selectedSort==1,
                                          value: selectedSort,
                                          onChanged: (flag){

                                            setState((){
                                              selectedSort=1;

                                            });

                                          },
                                        ),
                                      ],
                                    ):Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [

                                        InkWell(
                                          onTap: (){
                                            setState((){
                                              five=!five;
                                              if(five){
                                                if(!ratings.contains('5')){
                                                  ratings.add('5');
                                                }
                                              }else{
                                                if(ratings.contains('5')){
                                                  ratings.remove('5');
                                                }
                                              }
                                            });
                                          },
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("5.0 "),
                                              SizedBox(width: 16,),
                                              Column(
                                                children: [

                                                  SizedBox(height: 2,),
                                                  Container(
                                                    width: 10,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: five?Colors.red:Colors.grey,
                                                    ),
                                                  ),

                                                  SizedBox(height: 2,),
                                                  Container(
                                                    width: 2,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.rectangle,
                                                      color:five?Colors.red:Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: (){
                                            setState((){
                                              hfour=!hfour;
                                              if(hfour){
                                                if(!ratings.contains('4.5')){
                                                  ratings.add('4.5');
                                                }
                                              }else{
                                                if(ratings.contains('4.5')){
                                                  ratings.remove('4.5');
                                                }
                                              }});
                                          },
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("4.5 "),
                                              SizedBox(width: 16,),
                                              Column(
                                                children: [

                                                  SizedBox(height: 2,),
                                                  Container(
                                                    width: 10,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color:hfour? Colors.red:Colors.grey,
                                                    ),
                                                  ),

                                                  SizedBox(height: 2,),
                                                  Container(
                                                    width: 2,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.rectangle,
                                                      color:hfour? Colors.red:Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),

                                        InkWell(
                                          onTap: (){
                                            setState((){

                                              four=!four;

                                              if(four){
                                                if(!ratings.contains('4.0')){
                                                  ratings.add('4.0');
                                                }
                                              }else{
                                                if(ratings.contains('4.0')){
                                                  ratings.remove('4.0');
                                                }
                                              }


                                            });
                                          },

                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("4.0 "),
                                              SizedBox(width: 16,),
                                              Column(
                                                children: [

                                                  SizedBox(height: 2,),
                                                  Container(
                                                    width: 10,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color:four? Colors.red:Colors.grey,
                                                    ),
                                                  ),

                                                  SizedBox(height: 2,),
                                                  Container(
                                                    width: 2,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.rectangle,
                                                      color:four? Colors.red:Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),

                                        InkWell(
                                          onTap: (){
                                            setState((){
                                              hthree=!hthree;
                                              if(hthree){
                                                if(!ratings.contains('3.5')){
                                                  ratings.add('3.5');
                                                }
                                              }else{
                                                if(ratings.contains('3.5')){
                                                  ratings.remove('3.5');
                                                }
                                              }

                                            });
                                          },

                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text("3.5 "),
                                              SizedBox(width: 16,),
                                              Column(
                                                children: [

                                                  SizedBox(height: 2,),
                                                  Container(
                                                    width: 10,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: hthree?Colors.red:Colors.grey,
                                                    ),
                                                  ),

                                                  SizedBox(height: 2,),
                                                  Container(
                                                    width: 2,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.rectangle,
                                                      color: hthree? Colors.red:Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),

                                        InkWell(

                                          onTap: (){
                                            setState((){
                                              any=!any;
                                              if(any){
                                                ratings.clear();
                                                ratings.add('1,2,3,4,5');
                                              }else{
                                                ratings.remove('1,2,3,4,5');
                                              }

                                            });
                                          },
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Any"),
                                              SizedBox(width: 16,),
                                              Column(
                                                children: [

                                                  SizedBox(height: 2,),
                                                  Container(
                                                    width:30,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.red,
                                                    ),
                                                  ),

                                                  SizedBox(height: 2,),

                                                ],
                                              ),
                                            ],
                                          ),
                                        ),

                                        SizedBox(height: 2,),

                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],

                          ),
                        ],
                      ),

                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                                onTap:(){
                                  widget.allFrenchisiViewModel.getNearestFranchiseById();
                                  Navigator.pop(context);
                                },
                                child: Text('Clear All',style: Theme.of(context).textTheme.subtitle2.copyWith(decorationStyle: TextDecorationStyle.dotted,decoration: TextDecoration.underline,color: Theme.of(context).primaryColor),)),
                            RaisedButton(onPressed: (){
                              if(isSortSelected){
                                widget.allFrenchisiViewModel.getSortedFranchiseBySort(selectedSort);
                              }else{


                                if(ratings.length>0) {
                                  StringBuffer newratings = StringBuffer();
                                  bool fist = true;
                                  ratings.forEach((element) {
                                    if (fist) {
                                      fist = false;
                                      newratings.write('$element');
                                    } else {
                                      newratings.write(',$element');
                                    }
                                  });

                                  widget.allFrenchisiViewModel
                                      .getSortedFranchiseByRating(
                                      newratings.toString());
                                }else{
                                  widget.allFrenchisiViewModel
                                      .getSortedFranchiseByRating(
                                      '1,2,3,4,5');

                                }
                              }
                              Navigator.pop(context);
                            },
                              child: Text("Apply",style: Theme.of(context).textTheme.button.copyWith(color:Colors.white),),
                              color: Theme.of(context).primaryColor,
                            ),
                          ],
                        ),
                      )

                    ],


                  ),
                );
              }
          );
        }

    );

  }


  void openAddressedBottomSheet(){


    widget.allFrenchisiViewModel.getAddress();
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
                                      Text("Search Location",style: Theme.of(context).textTheme.headline6,),

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

                                  widget.allFrenchisiViewModel.isAddressLoading?Container( height: 2, child: LinearProgressIndicator(
                                    valueColor:AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor) ,

                                  )):

                                  SizedBox(
                                    height: MediaQuery.of(context).size.height*.3,
                                    child: ListView.separated(
                                        itemCount:  widget.allFrenchisiViewModel.adressesMain.addressList.length,
                                        separatorBuilder: (context, index) => Divider(
                                          color: Colors.black,
                                        ),
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            onTap: (){

                                              widget.allFrenchisiViewModel.changeDefAddress(widget.allFrenchisiViewModel.adressesMain.addressList[index]);

                                              Navigator.pop(context);

                                            },
                                            title: Text(widget.allFrenchisiViewModel
                                                .adressesMain
                                                .addressList[index]
                                                .addressCaption),

                                            subtitle: Text(widget.allFrenchisiViewModel
                                                .adressesMain
                                                .addressList[index]
                                                .landmark),

                                            leading: Image.asset('images/location_icn.png',width: 24,height: 24,color: Theme.of(context).primaryColor,),
                                          );
                                        }

                                    ),
                                  ),

                                ],



                              ),


                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Row(
                                  children: [

                                    Icon(Icons.gps_fixed_outlined,color: Colors.red,),

                                    FlatButton(onPressed: (){

                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> LocationScreen()));

                                    },
                                      child: Text('Add New Address',style: Theme.of(context).textTheme.headline6.copyWith(color: Theme.of(context).primaryColor),),
                                    ),
                                  ],
                                ),

                              )
                            ]
                        ),
                  ),
                );
              }
          );
        }

    );

  }


  List<Widget> getSliderImages(){
    List<Widget> widgets=[];
    widget.allFrenchisiViewModel.frainchiseHomeData.offerData.forEach((element) {
      widgets.add(
          Card(child: Image.network('${imageUrl}${element.imageList[0].imageName}',fit: BoxFit.contain,))
      );
    });

    return widgets;
  }



  final searchController = TextEditingController();

  void  _showSnackbar(String msg,bool isPositive) {
    Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(msg, style: TextStyle(color: Colors.white),),
          duration: Duration(seconds: 3),
          backgroundColor: isPositive ? Colors.green : Colors.redAccent,
        ));
  }


  @override
  void initState() {
    // TODO: implement initState
    if(widget.allFrenchisiViewModel.isLoadingForFranchiseData) {
      slider();
    }

    super.initState();
  }



  void deliveryDialog(){
    showDialog(context: context,
      child: AlertDialog(
        title: new Text("Alert"),
        content: Text('We are currently not accepting home delivery order due to festival rush,Please use take away'),
        actions: [
          FlatButton(onPressed: (){

            Navigator.pop(context);
          }, child: Text("Ok")),

        ],
      ),
    );

  }


  void slider(){
    Timer.periodic(Duration(seconds: 2), (Timer t)  {

      try {
        if (widget.allFrenchisiViewModel.frainchiseHomeData.offerData
            .length >=
            1)
        {
          setState(() {
            if (currentPage < 2) {
              _controller.nextPage(
                  duration: Duration(milliseconds: 700),
                  curve: Curves.fastLinearToSlowEaseIn);
            } else {
              currentPage = 0;
              _controller.jumpToPage(0);
            }
          });
        }
      }catch(error){
        print(error);

      }
    });
  }

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder:(_){
        searchController.value = TextEditingValue(
          text: widget.allFrenchisiViewModel.searchString,
          selection: TextSelection.fromPosition(
            TextPosition(offset: widget.allFrenchisiViewModel.searchString.length),
          ),
        );

        return  Stack(
          children: [
            Scaffold(
              key: _scaffoldKey,
              floatingActionButton: FloatingActionButton.extended(
                backgroundColor: Theme.of(context).primaryColor,
                onPressed: () {

                  showDialog(context: context,
                      child:

                      new AlertDialog(



                        title: new Text("Categories"),

                        content:  Observer(
                          builder:(_)=> Container(
                            height: 300,
                            width: 250,
                            child:ListView.builder(
                              itemCount:  widget.allFrenchisiViewModel.frainchiseHomeData.subCategoryData.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  dense: true,
                                  onTap: (){
                                    widget.allFrenchisiViewModel.changeDefAddress(widget.allFrenchisiViewModel.adressesMain.addressList[index]);
                                    Navigator.pop(context);
                                  },
                                  title: Text( widget.allFrenchisiViewModel.frainchiseHomeData.subCategoryData[index].subCatName),
                                  trailing: Text( '${widget.allFrenchisiViewModel.frainchiseHomeData.subCategoryData[index].itemList.length}'),
                                );
                              },
                            ),

                          ),
                        ),
                      )
                  );

                },
                icon: Icon(Icons.list),
                label: Text("Menu"),
              ),
              appBar: AppBar(

                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: <Widget>[
                        Image.asset('images/place_icon.png',width: 28,height: 28,color: Colors.white,),
                        SizedBox(width: 4,),
                        Observer(
                          builder:(_)=> Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${widget.allFrenchisiViewModel.isLoading?"":widget.allFrenchisiViewModel.custAdrressCaption}",style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.normal,color:Colors.white,),textAlign: TextAlign.center,overflow: TextOverflow.clip,),
                              Text("${widget.allFrenchisiViewModel.isLoading?"":widget.allFrenchisiViewModel.custAdrress}",style:Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.normal,color:Colors.white,),textAlign: TextAlign.center,overflow: TextOverflow.clip,),

                            ],
                          ),
                        ),
                      ],

                    ),
                    SizedBox(height: 4,),
                    Container(height: 1,width: MediaQuery.of(context).size.width*0.8,
                      color: Colors.white60,
                    )
                  ],
                ),
                actions: [
                  IconButton(icon:Icon( Icons.arrow_drop_down), onPressed:(){
                    openAddressedBottomSheet();
                  })
                ],


                backgroundColor: Theme.of(context).primaryColor,
                // elevation: 50.0,
                bottom: PreferredSize(
                  preferredSize: Size.square(60.0),
                  child: Container(
                    //   child: Container(
                    margin: EdgeInsets.only(left: 8,right: 8,bottom: 8),
                    color: Theme.of(context).primaryColor,
                    child: new Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white70, width: 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                      child:  Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width:MediaQuery.of(context).size.width*.80,
                              child: TextFormField(
                                controller: searchController,
                                onChanged: (str){
                                  widget.allFrenchisiViewModel.searchList(str);
                                },
                                decoration:  InputDecoration(

                                  prefixIcon:   Image.asset('images/search_icn.png',color: Colors.grey,),
                                  prefixIconConstraints: BoxConstraints(maxHeight: 24,maxWidth: 24),
                                  prefixText: "  ",
                                  hintText: 'Search', border: InputBorder.none,),
                                // onChanged: onSearchTextChanged,
                              ),
                            ),
                            InkWell(

                              onTap: (){
                                openFilterBottomSheet();
                              },
                              child: Image.asset('images/filter_icon.png',color: Colors.grey,width: 24,height: 24,),),
                          ],
                        ),
                      ),
                    ),
                    //),
                  ),
                ),
              ),


              body:   Container(
                child: Observer(
                  builder: (_) =>
                      SingleChildScrollView(
                        child:  Container(
                          margin: const EdgeInsets.only(left:8.0,right: 8,top:8,bottom: 4),
                          child:


                          (allFrenchisiViewModel.isLoading || allFrenchisiViewModel.isLoadingForFranchiseData)?Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              color: Colors.black.withOpacity(.3),
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey[400],
                                highlightColor: Colors.grey[100],
                                enabled: true,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [

                                    Container(
                                      width: double.infinity,
                                      height: 220,
                                      color: Colors.white,
                                    ),

                                    SizedBox(height: 16,),

                                    Expanded(
                                      child: ListView.builder(
                                        itemBuilder: (_, __) => Padding(
                                          padding: const EdgeInsets.only(bottom: 8.0),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 100.0,
                                                height: 100.0,
                                                color: Colors.white,
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Container(
                                                      width: double.infinity,
                                                      height: 8.0,
                                                      color: Colors.white,
                                                    ),
                                                    const Padding(
                                                      padding: EdgeInsets.symmetric(vertical: 2.0),
                                                    ),
                                                    Container(
                                                      width: double.infinity,
                                                      height: 8.0,
                                                      color: Colors.white,
                                                    ),
                                                    const Padding(
                                                      padding: EdgeInsets.symmetric(vertical: 2.0),
                                                    ),
                                                    Container(
                                                      width: 40.0,
                                                      height: 8.0,
                                                      color: Colors.white,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        itemCount: 6,
                                      ),
                                    ),

                                  ],
                                ),
                              )
                          ): Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left:12.0),
                                child: Observer(
                                  builder:(_)=> Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        //  height: 30.0,
                                        child: GestureDetector(
                                          onTap: () async{

                                            if(widget.allFrenchisiViewModel.outletType!=1) {
                                              await widget.allFrenchisiViewModel.setOutletType(1);
                                              widget.allFrenchisiViewModel.frainchiseHomeData=FranchiseId();
                                              widget.allFrenchisiViewModel
                                                  .getNearestFranchiseById();
                                            }else{
                                              _showSnackbar("Already Selected",true);
                                            }
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: widget.allFrenchisiViewModel.outletType==1?Theme.of(context).primaryColor:Colors.grey ,
                                                style: BorderStyle.solid,
                                                width: 1.0,
                                              ),
                                              color:widget.allFrenchisiViewModel.outletType==1?Theme.of(context).primaryColor:Colors.grey,
                                              borderRadius: BorderRadius.circular(15.0),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Icon(Icons.fiber_manual_record, color: widget.allFrenchisiViewModel.outletType==1?Colors.white:Colors.grey,size: 10,),
                                                  SizedBox(width: 4,),
                                                  Text(
                                                      "DAIRY PRODUCTS",
                                                      style:Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.bold).copyWith(color:widget.allFrenchisiViewModel.outletType==1?Colors.white:Colors.black))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(width: 10,),

                                      Container(
                                        //height: 30.0,
                                        child: GestureDetector(
                                          onTap: () async{

                                            if( (!widget.allFrenchisiViewModel.isLoadingForFranchiseData && widget.allFrenchisiViewModel.frainchiseHomeData.subCategoryData.isEmpty)){
                                              _showSnackbar("Please wait , We are on it ..",true);

                                            }else{
                                              if(widget.allFrenchisiViewModel.outletType!=2) {
                                                await widget.allFrenchisiViewModel.setOutletType(2);
                                                widget.allFrenchisiViewModel.frainchiseHomeData=FranchiseId();
                                                widget.allFrenchisiViewModel
                                                    .getNearestFranchiseById();
                                              }else{
                                                _showSnackbar("Already Selected",true);
                                              }
                                              // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                                            }
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: widget.allFrenchisiViewModel.outletType==2?Theme.of(context).primaryColor:Colors.grey[300],
                                                style: BorderStyle.solid,
                                                width: 1.0,
                                              ),
                                              color:widget.allFrenchisiViewModel.outletType==2?Theme.of(context).primaryColor:Colors.grey[300],
                                              borderRadius: BorderRadius.circular(15.0),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Icon(Icons.fiber_manual_record, color: widget.allFrenchisiViewModel.outletType==2?Colors.white:Colors.grey,size: 10,),
                                                  SizedBox(width: 4,),
                                                  Text(
                                                      "RESTURANT",
                                                      style:Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.bold).copyWith(color:widget.allFrenchisiViewModel.outletType==2?Colors.white:Colors.black))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),




                              Observer(
                                builder:(_)=> Row(
                                  children: [


                                    InkWell(
                                      onTap: (){
                                        widget.allFrenchisiViewModel.setDelMode(1);
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=> TakeAway(allFrenchisiViewModel: widget.allFrenchisiViewModel,)));
                                      },
                                      child: Row(
                                        children: [
                                          Radio(
                                            activeColor: Theme.of(context).primaryColor,
                                            value: widget.allFrenchisiViewModel.selectedDelMode, groupValue: 1, onChanged: (flag){

                                            widget.allFrenchisiViewModel.setDelMode(1);
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=> TakeAway(allFrenchisiViewModel: widget.allFrenchisiViewModel,)));

                                          }, ),
                                          Text('Takeaway',style: Theme.of(context).textTheme.bodyText2.copyWith(color:widget.allFrenchisiViewModel.selectedDelMode==1?Theme.of(context).primaryColor :Colors.black,fontWeight: FontWeight.bold),),
                                        ],
                                      ),
                                    ),


                                    InkWell(
                                      onTap: (){
                                        widget.allFrenchisiViewModel.setDelMode(2);
                                        // deliveryDialog();
                                      },
                                      child: Row(

                                        children: [
                                          Radio(

                                            value: widget.allFrenchisiViewModel.selectedDelMode, groupValue: 2, onChanged: (flag){
                                            widget.allFrenchisiViewModel.setDelMode(2);
                                            // deliveryDialog();

                                          }, ),
                                          Text('Delivery',style: Theme.of(context).textTheme.bodyText2.copyWith(color:widget.allFrenchisiViewModel.selectedDelMode==2?Theme.of(context).primaryColor :Colors.black,fontWeight: FontWeight.bold),),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),


                              // Observer(
                              //   builder: (_) =>
                              //   widget.allFrenchisiViewModel.isLoadingForFranchiseData?
                              //          Column(
                              //            mainAxisAlignment: MainAxisAlignment.center,
                              //            children: [
                              //              CircularProgressIndicator(),
                              //              // Text("Getting Franchise Data",style: Theme.of(context).textTheme.headline6,),
                              //            ],
                              //          ):Container(),
                              // ),

                              (!allFrenchisiViewModel.isLoadingForFranchiseData)?
                              allFrenchisiViewModel.frainchiseHomeData.offerData.isNotEmpty?    Container(
                                padding: EdgeInsets.only(top: 2,bottom: 8),
                                decoration: BoxDecoration(
                                    border: Border.symmetric(vertical: BorderSide.none)
                                ),
                                child: Column(
                                  children: [

                                    widget.allFrenchisiViewModel.searchString==''?  SizedBox(
                                      height: 200,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top:2.0),
                                        child: PageView(
                                          scrollDirection: Axis.horizontal,
                                          controller: _controller,
                                          children: getSliderImages(),
                                          onPageChanged: (page){
                                            setState(() {
                                              currentPage=page;

                                            });
                                          },
                                        ),
                                      ),
                                    ):Container(),
                                  ],
                                ),
                              ):Container():Container(),




                              (!widget.allFrenchisiViewModel.isLoading&&!widget.allFrenchisiViewModel.isLoadingForFranchiseData)?
                              (!widget.allFrenchisiViewModel.isLoadingForFranchiseData && widget.allFrenchisiViewModel.frainchiseHomeData.subCategoryData.isEmpty )? NoServiceAvailable(widget.allFrenchisiViewModel.custAdrress):
                              Column(
                                children: allFrenchisiViewModel.isSerching? getSearchedList(): getChildViews(),
                              ):Container(),

                              SizedBox(height: 60,),



                            ],
                          ),

                        ),

                      ),
                ),
              ),
            ),
          ],
        );},
    );
  }


  List<Widget> getChildViews(){

    List<Widget> widgets=[];



    if(widget.allFrenchisiViewModel.frainchiseHomeData.subCategoryData!=null) {
      widget.allFrenchisiViewModel.frainchiseHomeData.subCategoryData.forEach((
          element) {
        widgets.add(
            StickyHeaderList(element, widget.allFrenchisiViewModel)
        );
      });
    }
    return widgets;
  }


  List<Widget> getSearchedList(){


    List<Widget> widgets=[];

    widgets.add(
        Observer(
          builder: (_) => ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) => Divider(
              color: Colors.black,
            ),
            physics: ScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: widget.allFrenchisiViewModel.filterList.length,
            itemBuilder: (_, int index) {
              return HomeItem( itemData: widget.allFrenchisiViewModel.filterList[index],allFrenchisiViewModel: widget.allFrenchisiViewModel,);
            },
          ),
        )
    );

    return widgets;
  }



}



class StickyHeaderList extends StatefulWidget {
  final SubCategoryData Data;
  final AllFrenchisiViewModel allFrenchisiViewModel;

  StickyHeaderList(this.Data, this.allFrenchisiViewModel);

  @override
  _StickyHeaderListState createState() => _StickyHeaderListState();
}

class _StickyHeaderListState extends State<StickyHeaderList> {
  @override
  Widget build(BuildContext context) {
    return StickyHeader(
      header: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(8),
          color: Theme.of(context).primaryColor,
          child: Text('${widget.Data.subCatName}',style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),)),
      content:  Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.Data.itemList.isNotEmpty? ListView.separated(
              controller: ScrollController(),
              shrinkWrap: true,
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey[400],
              ),
              physics: ScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: widget.Data.itemList.length,
              itemBuilder: (_, int index) {
                return HomeItem( itemData: widget.Data.itemList[index],allFrenchisiViewModel: widget.allFrenchisiViewModel,);
              },
            ):Container(),

          ],
        ),
      ),
    );
  }
}



class HomeItem extends StatefulWidget {
  final ItemData itemData;
  final AllFrenchisiViewModel allFrenchisiViewModel;

  const HomeItem({this.itemData,this.allFrenchisiViewModel});

  @override
  _HomeItemState createState() => _HomeItemState();
}

class _HomeItemState extends State<HomeItem> {

  bool isSelected=false;
  @override
  Widget build(BuildContext context) {
    return  isSelected?AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                widget.itemData.imageList.isEmpty?  Padding(
                  padding: const EdgeInsets.only(top:15,left: 5),
                  child: Image.asset(
                    "images/veg_icn.png",
                    height: 10,
                    width: 10,
                  ),
                ): Stack(
                  children: <Widget>[

                    widget.itemData.imageList.isNotEmpty?
                    InkWell(
                        onTap: (){
                          setState(() {
                            isSelected=false;
                          });
                        },

                        child: Image.network('${imageUrl}${widget.itemData.imageList[0].imageName}',width: MediaQuery.of(context).size.width*.8,height: 200,fit: BoxFit.fill,)):Container(),

                    Positioned(
                      top: 15,
                      left: 5,
                      child: Image.asset(
                        "images/veg_icn.png",
                        height: 10,
                        width: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> MenuDetails( widget.itemData,widget.allFrenchisiViewModel)));
              },
              child: Container(
                width: MediaQuery.of(context).size.width*.35,
                padding: EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    SizedBox(
                      child: Text(
                        widget.itemData.itemName,
                        style: Theme.of(context).textTheme.subtitle1,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    SizedBox(
                      child: Text(
                        widget.itemData.itemDesc,
                        style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.grey),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),


                    GestureDetector(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                              widget.itemData.productStatus,
                              style:Theme.of(context).textTheme.caption.copyWith(color:Colors.white,fontSize: 10)),
                        ),
                      ),
                    ),


                    new Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[

                        Icon(Icons.star, color:widget.itemData.rating>=1?Colors.yellow:Colors.grey,size: 12,),

                        SizedBox(
                          width: 4,
                        ),

                        Icon(Icons.star, color: widget.itemData.rating>=2?Colors.yellow:Colors.grey,size: 12,),

                        SizedBox(
                          width: 4,
                        ),

                        Icon(Icons.star, color: widget.itemData.rating>=3?Colors.yellow:Colors.grey,size: 12,),
                        SizedBox(
                          width: 4,
                        ),

                        Icon(Icons.star, color: widget.itemData.rating>=4?Colors.yellow:Colors.grey,size: 12,),

                        SizedBox(
                          width: 4,
                        ),

                        Icon(Icons.star, color: widget.itemData.rating>=5?Colors.yellow:Colors.grey,size: 12,),

                      ],
                    ),

                    Row(
                      children: [
                        Image.asset('images/rupees_icn.png',width: 16,height: 16,),
                        Text('${widget.itemData.spRateAmt}'),
                      ],
                    ),

                  ],
                ),
              ),
            ),

            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*.25,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius:
                    new BorderRadius.circular(4.0),
                  ),

                  child:
                  InkWell(

                    onTap: (){
                      if(widget.itemData.isDecimal==0) {
                        if(!widget. allFrenchisiViewModel.itemsIds.contains(widget.itemData.itemId)) {
                          CartItem cartItem = CartItem(
                              widget.itemData.itemId, 1, 1,
                              widget.itemData.itemName,
                              widget.itemData.spRateAmt,
                              widget.itemData.itemUom
                          );
                          widget.allFrenchisiViewModel.addCartItem(
                              cartItem);
                          _showSnackbar("Item Added!", true);

                        }

                      }else{

                        int quantity=1;
                        String selected='250g';
                        double selectedQuestity=0.25;

                        Scaffold.of(context). showBottomSheet((context) =>
                            StatefulBuilder(
                                builder: (BuildContext context, StateSetter setState /*You can rename this!*/) {
                                  return Container(
                                    height: 200,
                                    margin: EdgeInsets.all(16),
                                    padding: EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Text('Select Size'),

                                        // Container(
                                        //   width: MediaQuery
                                        //       .of(context)
                                        //       .size
                                        //       .width,
                                        //   height: 1,
                                        //   color: Colors.grey,
                                        // ),

                                        SizedBox(height: 16,),

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            InkWell(
                                              onTap:(){
                                                setState((){
                                                  selected='250g';
                                                  selectedQuestity=.25;
                                                });
                                              },

                                              child: Container(

                                                child: Text('250g',
                                                  style: Theme.of(context).textTheme.subtitle2
                                                      .copyWith(color: selectedQuestity==0.25?Colors.white:Colors.black,),
                                                ),
                                                padding: EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                    border: Border.all(color: Theme.of(context).primaryColor),
                                                    shape: BoxShape.rectangle,
                                                    color: selectedQuestity==0.25?Theme.of(context).primaryColor:Colors.white,
                                                    borderRadius: BorderRadius.all(Radius.circular(8))


                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap:(){
                                                setState((){
                                                  selected='500g';
                                                  selectedQuestity=0.5;
                                                });
                                              },

                                              child: Container(

                                                child: Text('500g',
                                                  style: Theme.of(context).textTheme.subtitle2
                                                      .copyWith(color: selectedQuestity==0.5?Colors.white:Colors.black,),
                                                ),
                                                padding: EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                    border: Border.all(color: Theme.of(context).primaryColor),
                                                    shape: BoxShape.rectangle,
                                                    color: selectedQuestity==0.5?Theme.of(context).primaryColor:Colors.white,

                                                    borderRadius: BorderRadius.all(Radius.circular(8))


                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap:(){
                                                setState((){
                                                  selected='750g';
                                                  selectedQuestity=0.75;
                                                });
                                              },

                                              child: Container(

                                                child: Text('750g',
                                                  style: Theme.of(context).textTheme.subtitle2
                                                      .copyWith(color: selectedQuestity==0.75?Colors.white:Colors.black,),
                                                ),
                                                padding: EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                    border: Border.all(color: Theme.of(context).primaryColor),
                                                    shape: BoxShape.rectangle,
                                                    color: selectedQuestity==0.75?Theme.of(context).primaryColor:Colors.white,

                                                    borderRadius: BorderRadius.all(Radius.circular(8))


                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap:(){
                                                setState((){
                                                  selected='1000g';
                                                  selectedQuestity=1.0;
                                                });
                                              },
                                              child: Container(

                                                child: Text('1000g',
                                                  style: Theme.of(context).textTheme.subtitle2
                                                      .copyWith(color: selectedQuestity==1.0?Colors.white:Colors.black,),
                                                ),
                                                padding: EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                    border: Border.all(color: Theme.of(context).primaryColor),
                                                    shape: BoxShape.rectangle,
                                                    color: selectedQuestity==1.0?Theme.of(context).primaryColor:Colors.white,

                                                    borderRadius: BorderRadius.all(Radius.circular(8))


                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 16,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [

                                            Text('Select Quantity',style: Theme.of(context).textTheme.subtitle2,),

                                            SizedBox(width: 16,),
                                            Container(
                                              padding: EdgeInsets.only(left:8,right:8,top:4,bottom: 4),
                                              decoration: BoxDecoration(
                                                  border: Border.all(color: Theme.of(context).primaryColor),
                                                  shape: BoxShape.rectangle,
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.all(Radius.circular(4))

                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          if (quantity >
                                                              1) {
                                                            quantity--;
                                                          }
                                                        });
                                                      },
                                                      child: Image.asset(
                                                        'images/minus_icn.png',
                                                        width: 16,
                                                        height: 16,)),
                                                  SizedBox(width: 2,),
                                                  Text("  ${ widget.allFrenchisiViewModel.itemsIds.contains(widget.itemData.itemId)?
                                                  allFrenchisiViewModel.getQuantityData(selectedQuestity,widget.itemData.itemId)??quantity:quantity} ",
                                                  ),
                                                  SizedBox(width: 2,),
                                                  InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          quantity++;
                                                        });
                                                      },
                                                      child: Image.asset(
                                                        'images/plus_icon.png',
                                                        width: 16,
                                                        height: 16,)),


                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 16,),
                                        Align(
                                          alignment: Alignment.center,
                                          child: RaisedButton(onPressed: (){

                                            CartItem cartItem = CartItem(
                                                widget.itemData.itemId, selectedQuestity, quantity,
                                                widget.itemData.itemName,
                                                widget.itemData.spRateAmt,
                                                widget.itemData.itemUom);
                                            widget.allFrenchisiViewModel.addCartItem(
                                                cartItem);

                                            _showSnackbar("Item Added!", true);
                                            Navigator.pop(context);
                                          },
                                            color: Theme.of(context).primaryColor,
                                            child: Text("Done",style: Theme.of(context).textTheme.button.copyWith(color: Colors.white),),
                                          ),
                                        ),

                                        SizedBox(height: 16,),

                                      ],
                                    ),
                                  );
                                }
                            )
                        );
                      }
                    },
                    child: Observer(
                      builder: (_)=> Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          widget.allFrenchisiViewModel.itemsIds.contains(widget.itemData.itemId)?InkWell(
                              onTap: (){
                                widget.allFrenchisiViewModel. items.forEach((element) {
                                  if(element.itemId==widget.itemData.itemId){
                                    setState(() {
                                      element.qty++;

                                    });
                                  }
                                });
                              },
                              child: Image.asset('images/plus_icon.png',width: 16,height: 16,color: Colors.black,)):Container(),
                          SizedBox(width: 4,),

                          Padding(
                            padding: const EdgeInsets.only(left:8,right:8),
                            child: Row(
                              children: [
                                Text(
                                  widget. allFrenchisiViewModel.itemsIds.contains(widget.itemData.itemId)?"${widget.allFrenchisiViewModel.getQuantity(widget.itemData.itemId)}":"Add",style: Theme.of(context).textTheme.subtitle2.copyWith(color: Theme.of(context).primaryColor),),
                                widget.allFrenchisiViewModel.itemsIds.contains(widget.itemData.itemId)? Container():SizedBox(width: 4,),
                                widget.allFrenchisiViewModel.itemsIds.contains(widget.itemData.itemId)? Container():Image.asset('images/plus_icon.png',width: 12,height: 12,color: Colors.black,),

                              ],
                            ),
                          ),


                          SizedBox(width: 4,),

                          widget.allFrenchisiViewModel.itemsIds.contains(widget.itemData.itemId)?

                          InkWell(
                              onTap: (){
                                widget.allFrenchisiViewModel. items.forEach((element) {
                                  if(element.itemId==widget.itemData.itemId){
                                    setState(() {
                                      if(element.qty>1)
                                      {
                                        element.qty--;
                                      }else{
                                        setState(() {
                                          widget.allFrenchisiViewModel.removeItem(element);
                                        });

                                      }

                                    });
                                  }
                                });
                              },
                              child: Image.asset('images/minus_icn.png',width: 16,height: 16,color: Colors.black,)):Container(),
                        ],
                      ),
                    ),
                  ),
                ),

                Text(
                  widget.itemData.isDecimal!=0?"Customizable":"",style: Theme.of(context).textTheme.caption.copyWith(color: Colors.orange),),

              ],
            )

          ],
        ),
      ),
    ): AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.all(4.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment:  CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    widget.itemData.imageList.isEmpty?  Padding(
                      padding: const EdgeInsets.only(top:15,left: 5),
                      child: Image.asset(
                        "images/veg_icn.png",
                        height: 10,
                        width: 10,
                      ),
                    ): Stack(
                      children: <Widget>[

                        widget.itemData.imageList.isNotEmpty?
                        InkWell(
                            onTap: (){
                              setState(() {
                                isSelected=true;
                              });
                            },
                            child: Image.network('${imageUrl}${widget.itemData.imageList[0].imageName}',width: MediaQuery.of(context).size.width*.25,height: 100,)):Container(),

                        Positioned(
                          top: 15,
                          left: 5,
                          child: Image.asset(
                            "images/veg_icn.png",
                            height: 10,
                            width: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> MenuDetails( widget.itemData,widget.allFrenchisiViewModel)));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width*.35,
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        SizedBox(
                          child: Text(
                            widget.itemData.itemName,
                            style: Theme.of(context).textTheme.subtitle1,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        SizedBox(
                          child: Text(
                            widget.itemData.itemDesc,
                            style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.grey),
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),


                        GestureDetector(
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                  widget.itemData.productStatus,
                                  style:Theme.of(context).textTheme.caption.copyWith(color:Colors.white,fontSize: 10)),
                            ),
                          ),
                        ),


                        new Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[

                            Icon(Icons.star, color:widget.itemData.rating>=1?Colors.yellow:Colors.grey,size: 12,),

                            SizedBox(
                              width: 4,
                            ),

                            Icon(Icons.star, color: widget.itemData.rating>=2?Colors.yellow:Colors.grey,size: 12,),

                            SizedBox(
                              width: 4,
                            ),

                            Icon(Icons.star, color: widget.itemData.rating>=3?Colors.yellow:Colors.grey,size: 12,),
                            SizedBox(
                              width: 4,
                            ),

                            Icon(Icons.star, color: widget.itemData.rating>=4?Colors.yellow:Colors.grey,size: 12,),

                            SizedBox(
                              width: 4,
                            ),

                            Icon(Icons.star, color: widget.itemData.rating>=5?Colors.yellow:Colors.grey,size: 12,),

                          ],
                        ),

                        Row(
                          children: [
                            Image.asset('images/rupees_icn.png',width: 16,height: 16,),
                            Text('${widget.itemData.spRateAmt}'),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),

              ],
            ),


            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*.25,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius:
                    new BorderRadius.circular(4.0),
                  ),

                  child:
                  InkWell(

                    onTap: (){
                      if(widget.itemData.isDecimal==0) {
                        if(!widget. allFrenchisiViewModel.itemsIds.contains(widget.itemData.itemId)) {
                          CartItem cartItem = CartItem(
                              widget.itemData.itemId, 1, 1,
                              widget.itemData.itemName,
                              widget.itemData.spRateAmt,
                              widget.itemData.itemUom
                          );
                          widget.allFrenchisiViewModel.addCartItem(
                              cartItem);
                          _showSnackbar("Item Added!", true);

                        }

                      }else{


                        String selected='250g';
                        double selectedQuestity=0.25;


                        Scaffold.of(context). showBottomSheet((context) =>
                            StatefulBuilder(
                                builder: (BuildContext context, StateSetter setState /*You can rename this!*/) {
                                  return Container(
                                    height: 200,
                                    margin: EdgeInsets.all(16),
                                    padding: EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: Observer(
                                      builder:(_)=> Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Text('Select Size'),

                                          // Container(
                                          //   width: MediaQuery
                                          //       .of(context)
                                          //       .size
                                          //       .width,
                                          //   height: 1,
                                          //   color: Colors.grey,
                                          // ),

                                          SizedBox(height: 16,),

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              InkWell(
                                                onTap:(){
                                                  setState((){
                                                    selected='250g';
                                                    selectedQuestity=.25;
                                                  });
                                                },

                                                child: Container(

                                                  child: Text('250g',
                                                    style: Theme.of(context).textTheme.subtitle2
                                                        .copyWith(color: selectedQuestity==0.25?Colors.white:Colors.black,),
                                                  ),
                                                  padding: EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(color: Theme.of(context).primaryColor),
                                                      shape: BoxShape.rectangle,
                                                      color: selectedQuestity==0.25?Theme.of(context).primaryColor:Colors.white,
                                                      borderRadius: BorderRadius.all(Radius.circular(8))


                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap:(){
                                                  setState((){
                                                    selected='500g';
                                                    selectedQuestity=0.5;
                                                  });
                                                },

                                                child: Container(

                                                  child: Text('500g',
                                                    style: Theme.of(context).textTheme.subtitle2
                                                        .copyWith(color: selectedQuestity==0.5?Colors.white:Colors.black,),
                                                  ),
                                                  padding: EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(color: Theme.of(context).primaryColor),
                                                      shape: BoxShape.rectangle,
                                                      color: selectedQuestity==0.5?Theme.of(context).primaryColor:Colors.white,

                                                      borderRadius: BorderRadius.all(Radius.circular(8))


                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap:(){
                                                  setState((){
                                                    selected='750g';
                                                    selectedQuestity=0.75;
                                                  });
                                                },

                                                child: Container(

                                                  child: Text('750g',
                                                    style: Theme.of(context).textTheme.subtitle2
                                                        .copyWith(color: selectedQuestity==0.75?Colors.white:Colors.black,),
                                                  ),
                                                  padding: EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(color: Theme.of(context).primaryColor),
                                                      shape: BoxShape.rectangle,
                                                      color: selectedQuestity==0.75?Theme.of(context).primaryColor:Colors.white,

                                                      borderRadius: BorderRadius.all(Radius.circular(8))


                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap:(){
                                                  setState((){
                                                    selected='1000g';
                                                    selectedQuestity=1.0;
                                                  });
                                                },
                                                child: Container(

                                                  child: Text('1000g',
                                                    style: Theme.of(context).textTheme.subtitle2
                                                        .copyWith(color: selectedQuestity==1.0?Colors.white:Colors.black,),
                                                  ),
                                                  padding: EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(color: Theme.of(context).primaryColor),
                                                      shape: BoxShape.rectangle,
                                                      color: selectedQuestity==1.0?Theme.of(context).primaryColor:Colors.white,

                                                      borderRadius: BorderRadius.all(Radius.circular(8))


                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 16,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [

                                              Text('Select Quantity',style: Theme.of(context).textTheme.subtitle2,),

                                              SizedBox(width: 16,),
                                              Container(
                                                padding: EdgeInsets.only(left:8,right:8,top:4,bottom: 4),
                                                decoration: BoxDecoration(
                                                    border: Border.all(color: Theme.of(context).primaryColor),
                                                    shape: BoxShape.rectangle,
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.all(Radius.circular(4))

                                                ),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            allFrenchisiViewModel.decreaseQuentityForDecimal(widget.itemData.itemId,selectedQuestity);

                                                          });
                                                        },
                                                        child: Image.asset(
                                                          'images/minus_icn.png',
                                                          width: 16,
                                                          height: 16,)),
                                                    SizedBox(width: 2,),
                                                    Text("${allFrenchisiViewModel.getQuantityData(selectedQuestity,widget.itemData.itemId)} ",
                                                    ),
                                                    SizedBox(width: 2,),
                                                    InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            allFrenchisiViewModel.increseQuentityForDecimal(widget.itemData.itemId,selectedQuestity);

                                                          });
                                                        },
                                                        child: Image.asset(
                                                          'images/plus_icon.png',
                                                          width: 16,
                                                          height: 16,)),


                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 16,),
                                          Align(
                                            alignment: Alignment.center,
                                            child: RaisedButton(onPressed: (){

                                              CartItem cartItem = CartItem(
                                                  widget.itemData.itemId, selectedQuestity, int.parse(allFrenchisiViewModel.getQuantityData(selectedQuestity,widget.itemData.itemId)),
                                                  widget.itemData.itemName,
                                                  widget.itemData.spRateAmt,
                                                  widget.itemData.itemUom);
                                              widget.allFrenchisiViewModel.addCartItem(
                                                  cartItem);
                                              _showSnackbar("Item Added!", true);
                                              Navigator.pop(context);
                                            },
                                              color: Theme.of(context).primaryColor,
                                              child: Text("Done",style: Theme.of(context).textTheme.button.copyWith(color: Colors.white),),
                                            ),
                                          ),

                                          SizedBox(height: 16,),

                                        ],
                                      ),
                                    ),
                                  );
                                }
                            )
                        );
                      }
                    },
                    child: Observer(
                      builder: (_)=> Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          widget.allFrenchisiViewModel.itemsIds.contains(widget.itemData.itemId)?InkWell(
                              onTap: () {
                                if (widget.itemData.isDecimal != 1) {
                                  widget.allFrenchisiViewModel.items
                                      .forEach((element) {
                                    if (element.itemId ==
                                        widget.itemData.itemId) {
                                      setState(() {
                                        element.qty++;
                                      });
                                    }
                                  });
                                } else {
                                  String selected = '250g';
                                  double selectedQuestity = 0.25;

                                  Scaffold.of(context)
                                      .showBottomSheet((context) =>
                                      StatefulBuilder(
                                          builder: (
                                              BuildContext context,
                                              StateSetter setState
                                              /*You can rename this!*/) {
                                            return Container(
                                              height: 200,
                                              margin: EdgeInsets.all(
                                                  16),
                                              padding: EdgeInsets
                                                  .only(
                                                  left: 8, right: 8),
                                              child: Observer(
                                                builder:(_)=> Column(
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Text('Select Size'),

                                                    // Container(
                                                    //   width: MediaQuery
                                                    //       .of(context)
                                                    //       .size
                                                    //       .width,
                                                    //   height: 1,
                                                    //   color: Colors.grey,
                                                    // ),

                                                    SizedBox(
                                                      height: 16,),

                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment
                                                          .spaceEvenly,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              selected =
                                                              '250g';
                                                              selectedQuestity =
                                                              .25;
                                                            });
                                                          },

                                                          child: Container(

                                                            child: Text(
                                                              '250g',
                                                              style: Theme
                                                                  .of(
                                                                  context)
                                                                  .textTheme
                                                                  .subtitle2
                                                                  .copyWith(
                                                                color: selectedQuestity ==
                                                                    0.25
                                                                    ? Colors
                                                                    .white
                                                                    : Colors
                                                                    .black,),
                                                            ),
                                                            padding: EdgeInsets
                                                                .all(8),
                                                            decoration: BoxDecoration(
                                                                border: Border
                                                                    .all(
                                                                    color: Theme
                                                                        .of(
                                                                        context)
                                                                        .primaryColor),
                                                                shape: BoxShape
                                                                    .rectangle,
                                                                color: selectedQuestity ==
                                                                    0.25
                                                                    ? Theme
                                                                    .of(
                                                                    context)
                                                                    .primaryColor
                                                                    : Colors
                                                                    .white,
                                                                borderRadius: BorderRadius
                                                                    .all(
                                                                    Radius
                                                                        .circular(
                                                                        8))


                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              selected =
                                                              '500g';
                                                              selectedQuestity =
                                                              0.5;
                                                            });
                                                          },

                                                          child: Container(

                                                            child: Text(
                                                              '500g',
                                                              style: Theme
                                                                  .of(
                                                                  context)
                                                                  .textTheme
                                                                  .subtitle2
                                                                  .copyWith(
                                                                color: selectedQuestity ==
                                                                    0.5
                                                                    ? Colors
                                                                    .white
                                                                    : Colors
                                                                    .black,),
                                                            ),
                                                            padding: EdgeInsets
                                                                .all(8),
                                                            decoration: BoxDecoration(
                                                                border: Border
                                                                    .all(
                                                                    color: Theme
                                                                        .of(
                                                                        context)
                                                                        .primaryColor),
                                                                shape: BoxShape
                                                                    .rectangle,
                                                                color: selectedQuestity ==
                                                                    0.5
                                                                    ? Theme
                                                                    .of(
                                                                    context)
                                                                    .primaryColor
                                                                    : Colors
                                                                    .white,

                                                                borderRadius: BorderRadius
                                                                    .all(
                                                                    Radius
                                                                        .circular(
                                                                        8))


                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              selected =
                                                              '750g';
                                                              selectedQuestity =
                                                              0.75;
                                                            });
                                                          },

                                                          child: Container(

                                                            child: Text(
                                                              '750g',
                                                              style: Theme
                                                                  .of(
                                                                  context)
                                                                  .textTheme
                                                                  .subtitle2
                                                                  .copyWith(
                                                                color: selectedQuestity ==
                                                                    0.75
                                                                    ? Colors
                                                                    .white
                                                                    : Colors
                                                                    .black,),
                                                            ),
                                                            padding: EdgeInsets
                                                                .all(8),
                                                            decoration: BoxDecoration(
                                                                border: Border
                                                                    .all(
                                                                    color: Theme
                                                                        .of(
                                                                        context)
                                                                        .primaryColor),
                                                                shape: BoxShape
                                                                    .rectangle,
                                                                color: selectedQuestity ==
                                                                    0.75
                                                                    ? Theme
                                                                    .of(
                                                                    context)
                                                                    .primaryColor
                                                                    : Colors
                                                                    .white,

                                                                borderRadius: BorderRadius
                                                                    .all(
                                                                    Radius
                                                                        .circular(
                                                                        8))


                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              selected =
                                                              '1000g';
                                                              selectedQuestity =
                                                              1.0;
                                                            });
                                                          },
                                                          child: Container(

                                                            child: Text(
                                                              '1000g',
                                                              style: Theme
                                                                  .of(
                                                                  context)
                                                                  .textTheme
                                                                  .subtitle2
                                                                  .copyWith(
                                                                color: selectedQuestity ==
                                                                    1.0
                                                                    ? Colors
                                                                    .white
                                                                    : Colors
                                                                    .black,),
                                                            ),
                                                            padding: EdgeInsets
                                                                .all(8),
                                                            decoration: BoxDecoration(
                                                                border: Border
                                                                    .all(
                                                                    color: Theme
                                                                        .of(
                                                                        context)
                                                                        .primaryColor),
                                                                shape: BoxShape
                                                                    .rectangle,
                                                                color: selectedQuestity ==
                                                                    1.0
                                                                    ? Theme
                                                                    .of(
                                                                    context)
                                                                    .primaryColor
                                                                    : Colors
                                                                    .white,

                                                                borderRadius: BorderRadius
                                                                    .all(
                                                                    Radius
                                                                        .circular(
                                                                        8))


                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 16,),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment
                                                          .center,
                                                      children: [

                                                        Text(
                                                          'Select Quantity',
                                                          style: Theme
                                                              .of(
                                                              context)
                                                              .textTheme
                                                              .subtitle2,),

                                                        SizedBox(
                                                          width: 16,),
                                                        Container(
                                                          padding: EdgeInsets
                                                              .only(
                                                              left: 8,
                                                              right: 8,
                                                              top: 4,
                                                              bottom: 4),
                                                          decoration: BoxDecoration(
                                                              border: Border
                                                                  .all(
                                                                  color: Theme
                                                                      .of(
                                                                      context)
                                                                      .primaryColor),
                                                              shape: BoxShape
                                                                  .rectangle,
                                                              color: Colors
                                                                  .white,
                                                              borderRadius: BorderRadius
                                                                  .all(
                                                                  Radius
                                                                      .circular(
                                                                      4))

                                                          ),
                                                          child: Row(
                                                            mainAxisSize: MainAxisSize
                                                                .min,
                                                            children: [
                                                              InkWell(
                                                                  onTap: () {
                                                                    setState(() {
                                                                      allFrenchisiViewModel
                                                                          .decreaseQuentityForDecimal(
                                                                          widget
                                                                              .itemData
                                                                              .itemId,
                                                                          selectedQuestity);
                                                                    });
                                                                  },
                                                                  child: Image
                                                                      .asset(
                                                                    'images/minus_icn.png',
                                                                    width: 16,
                                                                    height: 16,)),
                                                              SizedBox(
                                                                width: 2,),
                                                              Text(
                                                                "  ${ widget
                                                                    .allFrenchisiViewModel
                                                                    .itemsIds
                                                                    .contains(
                                                                    widget
                                                                        .itemData
                                                                        .itemId)
                                                                    ?
                                                                allFrenchisiViewModel
                                                                    .getQuantityData(
                                                                    selectedQuestity,
                                                                    widget
                                                                        .itemData
                                                                        .itemId) ??
                                                                    1
                                                                    : 1} ",
                                                              ),
                                                              SizedBox(
                                                                width: 2,),
                                                              InkWell(
                                                                  onTap: () {
                                                                    setState(() {
                                                                      allFrenchisiViewModel
                                                                          .increseQuentityForDecimal(
                                                                          widget
                                                                              .itemData
                                                                              .itemId,
                                                                          selectedQuestity);
                                                                    });
                                                                  },
                                                                  child: Image
                                                                      .asset(
                                                                    'images/plus_icon.png',
                                                                    width: 16,
                                                                    height: 16,)),


                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 16,),
                                                    Align(
                                                      alignment: Alignment
                                                          .center,
                                                      child: RaisedButton(
                                                        onPressed: () {
                                                          CartItem cartItem = CartItem(
                                                              widget
                                                                  .itemData
                                                                  .itemId,
                                                              selectedQuestity,
                                                              int.parse(
                                                                  allFrenchisiViewModel
                                                                      .getQuantityData(
                                                                      selectedQuestity,
                                                                      widget
                                                                          .itemData
                                                                          .itemId)),
                                                              widget
                                                                  .itemData
                                                                  .itemName,
                                                              widget
                                                                  .itemData
                                                                  .spRateAmt,
                                                              widget
                                                                  .itemData
                                                                  .itemUom);
                                                          widget
                                                              .allFrenchisiViewModel
                                                              .addCartItem(
                                                              cartItem);

                                                          _showSnackbar(
                                                              "Item Added!",
                                                              true);
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        color: Theme
                                                            .of(context)
                                                            .primaryColor,
                                                        child: Text(
                                                          "Done",
                                                          style: Theme
                                                              .of(
                                                              context)
                                                              .textTheme
                                                              .button
                                                              .copyWith(
                                                              color: Colors
                                                                  .white),),
                                                      ),
                                                    ),

                                                    SizedBox(
                                                      height: 16,),

                                                  ],
                                                ),
                                              ),
                                            );
                                          }
                                      )
                                  );
                                }
                              },
                              child:widget.itemData.isDecimal!=0?Container():Image.asset('images/plus_icon.png',width: 16,height: 16,color: Colors.black,)):Container(),
                          SizedBox(width: 4,),

                          Padding(
                            padding: const EdgeInsets.only(left:8,right:8),
                            child: Row(
                              children: [
                                Text(
                                  widget. allFrenchisiViewModel.itemsIds.contains(widget.itemData.itemId)?widget.itemData.isDecimal!=0?"Added":"${widget.allFrenchisiViewModel.getQuantity(widget.itemData.itemId)}":"Add",style: Theme.of(context).textTheme.subtitle2.copyWith(color: Theme.of(context).primaryColor),),
                                widget.allFrenchisiViewModel.itemsIds.contains(widget.itemData.itemId)? Container():SizedBox(width: 4,),
                                widget.allFrenchisiViewModel.itemsIds.contains(widget.itemData.itemId)? Container():Image.asset('images/plus_icon.png',width: 12,height: 12,color: Colors.black,),

                              ],
                            ),
                          ),
                          SizedBox(width: 4,),
                          widget.allFrenchisiViewModel.itemsIds.contains(widget.itemData.itemId)?
                          InkWell(
                              onTap: (){
                                widget.allFrenchisiViewModel. items.forEach((element) {

                                  if(widget.itemData.isDecimal!=1) {
                                    if (element.itemId ==
                                        widget.itemData.itemId) {
                                      setState(() {
                                        if (element.qty > 1) {
                                          element.qty--;
                                        } else {
                                          setState(() {
                                            widget
                                                .allFrenchisiViewModel
                                                .removeItem(element);
                                          });
                                        }
                                      });
                                    }
                                  }else{


                                    String selected='250g';
                                    double selectedQuestity=0.25;

                                    Scaffold.of(context). showBottomSheet((context) =>
                                        StatefulBuilder(
                                            builder: (BuildContext context, StateSetter setState /*You can rename this!*/) {
                                              return Container(
                                                height: 200,
                                                margin: EdgeInsets.all(16),
                                                padding: EdgeInsets.only(
                                                    left: 8, right: 8),
                                                child: Observer(
                                                  builder:(_)=> Column(
                                                    crossAxisAlignment: CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Text('Select Size'),

                                                      // Container(
                                                      //   width: MediaQuery
                                                      //       .of(context)
                                                      //       .size
                                                      //       .width,
                                                      //   height: 1,
                                                      //   color: Colors.grey,
                                                      // ),

                                                      SizedBox(height: 16,),

                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          InkWell(
                                                            onTap:(){
                                                              setState((){
                                                                selected='250g';
                                                                selectedQuestity=.25;
                                                              });
                                                            },

                                                            child: Container(

                                                              child: Text('250g',
                                                                style: Theme.of(context).textTheme.subtitle2
                                                                    .copyWith(color: selectedQuestity==0.25?Colors.white:Colors.black,),
                                                              ),
                                                              padding: EdgeInsets.all(8),
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(color: Theme.of(context).primaryColor),
                                                                  shape: BoxShape.rectangle,
                                                                  color: selectedQuestity==0.25?Theme.of(context).primaryColor:Colors.white,
                                                                  borderRadius: BorderRadius.all(Radius.circular(8))


                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap:(){
                                                              setState((){
                                                                selected='500g';
                                                                selectedQuestity=0.5;
                                                              });
                                                            },

                                                            child: Container(

                                                              child: Text('500g',
                                                                style: Theme.of(context).textTheme.subtitle2
                                                                    .copyWith(color: selectedQuestity==0.5?Colors.white:Colors.black,),
                                                              ),
                                                              padding: EdgeInsets.all(8),
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(color: Theme.of(context).primaryColor),
                                                                  shape: BoxShape.rectangle,
                                                                  color: selectedQuestity==0.5?Theme.of(context).primaryColor:Colors.white,

                                                                  borderRadius: BorderRadius.all(Radius.circular(8))


                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap:(){
                                                              setState((){
                                                                selected='750g';
                                                                selectedQuestity=0.75;
                                                              });
                                                            },

                                                            child: Container(

                                                              child: Text('750g',
                                                                style: Theme.of(context).textTheme.subtitle2
                                                                    .copyWith(color: selectedQuestity==0.75?Colors.white:Colors.black,),
                                                              ),
                                                              padding: EdgeInsets.all(8),
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(color: Theme.of(context).primaryColor),
                                                                  shape: BoxShape.rectangle,
                                                                  color: selectedQuestity==0.75?Theme.of(context).primaryColor:Colors.white,

                                                                  borderRadius: BorderRadius.all(Radius.circular(8))


                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap:(){
                                                              setState((){
                                                                selected='1000g';
                                                                selectedQuestity=1.0;
                                                              });
                                                            },
                                                            child: Container(

                                                              child: Text('1000g',
                                                                style: Theme.of(context).textTheme.subtitle2
                                                                    .copyWith(color: selectedQuestity==1.0?Colors.white:Colors.black,),
                                                              ),
                                                              padding: EdgeInsets.all(8),
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(color: Theme.of(context).primaryColor),
                                                                  shape: BoxShape.rectangle,
                                                                  color: selectedQuestity==1.0?Theme.of(context).primaryColor:Colors.white,

                                                                  borderRadius: BorderRadius.all(Radius.circular(8))


                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 16,),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [

                                                          Text('Select Quantity',style: Theme.of(context).textTheme.subtitle2,),

                                                          SizedBox(width: 16,),
                                                          Container(
                                                            padding: EdgeInsets.only(left:8,right:8,top:4,bottom: 4),
                                                            decoration: BoxDecoration(
                                                                border: Border.all(color: Theme.of(context).primaryColor),
                                                                shape: BoxShape.rectangle,
                                                                color: Colors.white,
                                                                borderRadius: BorderRadius.all(Radius.circular(4))

                                                            ),
                                                            child: Row(
                                                              mainAxisSize: MainAxisSize.min,
                                                              children: [
                                                                InkWell(
                                                                    onTap: () {
                                                                      setState(() {

                                                                        allFrenchisiViewModel.decreaseQuentityForDecimal(widget.itemData.itemId,selectedQuestity);

                                                                      });
                                                                    },
                                                                    child: Image.asset(
                                                                      'images/minus_icn.png',
                                                                      width: 16,
                                                                      height: 16,)),
                                                                SizedBox(width: 2,),
                                                                Text("  ${ widget.allFrenchisiViewModel.itemsIds.contains(widget.itemData.itemId)?
                                                                allFrenchisiViewModel.getQuantityData(selectedQuestity,widget.itemData.itemId)??1:1} ",
                                                                ),
                                                                SizedBox(width: 2,),
                                                                InkWell(
                                                                    onTap: () {
                                                                      setState(() {
                                                                        allFrenchisiViewModel.increseQuentityForDecimal(widget.itemData.itemId,selectedQuestity);

                                                                      });
                                                                    },
                                                                    child: Image.asset(
                                                                      'images/plus_icon.png',
                                                                      width: 16,
                                                                      height: 16,)),


                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 16,),
                                                      Align(
                                                        alignment: Alignment.center,
                                                        child: RaisedButton(onPressed: (){

                                                          CartItem cartItem = CartItem(
                                                              widget.itemData.itemId, selectedQuestity, int.parse(allFrenchisiViewModel.getQuantityData(selectedQuestity,widget.itemData.itemId)),
                                                              widget.itemData.itemName,
                                                              widget.itemData.spRateAmt,
                                                              widget.itemData.itemUom);
                                                          widget.allFrenchisiViewModel.addCartItem(
                                                              cartItem);

                                                          _showSnackbar("Item Added!", true);
                                                          Navigator.pop(context);
                                                        },
                                                          color: Theme.of(context).primaryColor,
                                                          child: Text("Done",style: Theme.of(context).textTheme.button.copyWith(color: Colors.white),),
                                                        ),
                                                      ),

                                                      SizedBox(height: 16,),

                                                    ],
                                                  ),
                                                ),
                                              );
                                            }
                                        )
                                    );
                                  }
                                });
                              },
                              child:widget.itemData.isDecimal!=0?Container(): Image.asset('images/minus_icn.png',width: 16,height: 16,color: Colors.black,)):Container(),
                        ],
                      ),
                    ),
                  ),
                ),

                Text(
                  widget.itemData.isDecimal!=0?"Customizable":"",style: Theme.of(context).textTheme.caption.copyWith(color: Colors.orange),),

              ],
            )

          ],
        ),
      ),
    );
  }



  void  _showSnackbar(String msg,bool isPositive) {
    Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(msg,style: TextStyle(color: Colors.white),),
          duration: Duration(seconds: 3),
          backgroundColor: isPositive?Colors.green:Colors.redAccent,
        ));
  }
}

