import 'dart:async';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_kitchen/local/staticUrls.dart';
import 'package:cloud_kitchen/network/model/request/purchase/cartitem.dart';
import 'package:cloud_kitchen/network/model/response/FranchiseId.dart';
import 'package:cloud_kitchen/network/model/response/ItemData.dart';
import 'package:cloud_kitchen/network/model/response/SubCategoryData.dart';
import 'package:cloud_kitchen/ui/home/dashboard.dart';
import 'package:cloud_kitchen/ui/home/homeItem.dart';
import 'package:cloud_kitchen/ui/notification/notificationui.dart';
import 'package:cloud_kitchen/ui/supportui/nonetwork.dart';
import 'package:cloud_kitchen/ui/user/locationScreen.dart';
import 'package:cloud_kitchen/ui/order/menudetailspage.dart';
import 'package:cloud_kitchen/ui/supportui/nodataavailable.dart';
import 'package:cloud_kitchen/ui/tackaway.dart';
import 'package:cloud_kitchen/viewmodel/con/internet.dart';
import 'package:cloud_kitchen/viewmodel/franchisi/frviewmodel.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:carousel_slider/carousel_slider.dart';


ConnectivityStore connectivityStore=ConnectivityStore();

class HomeScreen extends StatefulWidget {

  final AllFrenchisiViewModel allFrenchisiViewModel;

  const HomeScreen(this.allFrenchisiViewModel);



  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {






  String getTag(int isSortSelected){
    switch(isSortSelected){
      case 1:{
        return "Cost:Low to High    ";
      }
      break;
      case 2:{
        return "Cost:High to Low    ";
      }
      break;

      case 3:{
        return "Rating:High to Low ";
      }
      break;
    }
  }




  int currentPage=0;




  ReactionDisposer _disposer;


  int selectedSort=1;
  PageController _pageController= PageController();
  double ratefive=5.0,ratefore=4.0,rateforeh=4.5,rateth=3.5,rateAny=1,value=5;
  bool five=false,four=false,hfour=false,hthree=false,any=false;
  List<String> ratings=[];
  double selectedRating=5;
  void openFilterBottomSheet(){
    bool isSortSelected=true;
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
                      .height*.85,
                  padding: EdgeInsets.fromLTRB(4,16,16,16),

                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left:16.0),
                                child: Text('Sort and Filter',style: Theme.of(context).textTheme.headline6,),
                              ),
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
                            color: Colors.grey[300],
                            height: 1,
                          ),


                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Flexible(flex:4,child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(

                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap: (){
                                            setState((){

                                              if(!isSortSelected){
                                                _pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.fastLinearToSlowEaseIn);
                                              }
                                              isSortSelected=true;


                                              // _pageController.jumpToPage(0);
                                            });
                                          },
                                          child: AnimatedContainer(
                                            duration: Duration(milliseconds: 300),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text('Sort by',style: Theme.of(context).textTheme.subtitle2,),
                                                Text(getTag(selectedSort),style: Theme.of(context).textTheme.caption.copyWith(fontSize:10,color: Theme.of(context).primaryColor),)
                                              ],
                                            ),
                                            padding: EdgeInsets.fromLTRB(4,24,24,24),
                                            color: isSortSelected?Colors.grey[300]:Colors.white,

                                          ),
                                        ),

                                        InkWell(
                                          onTap: (){
                                            setState((){
                                              if(isSortSelected){
                                                _pageController..nextPage(duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
                                              }
                                              isSortSelected=false;

                                            });
                                          },
                                          child: AnimatedContainer(
                                            duration: Duration(milliseconds: 300),
                                            padding: EdgeInsets.fromLTRB(4,24,24,24),
                                            child: Text('Rating           ',style: Theme.of(context).textTheme.subtitle2),
                                            color: isSortSelected?Colors.white:Colors.grey[300],
                                          ),
                                        )
                                      ],

                                    ),
                                  ),
                                  Container(height: MediaQuery
                                      .of(context)
                                      .size
                                      .height*.39,
                                  width: 1,
                                  color: Colors.grey[300],
                                  )
                                ],

                              )),
                              Flexible(
                                  flex:6,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width*.55,
                                      height: MediaQuery.of(context).size.width*.75,
                                      child: PageView(
                                            controller: _pageController,
                                            scrollDirection: Axis.vertical,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  RadioListTile(
                                                    title: Text("Rating: High to low",style: Theme.of(context).textTheme.bodyText2,),
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
                                                    title: Text("Cost: High to low",style: Theme.of(context).textTheme.bodyText2),
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
                                                    title: Text("Cost: Low to high",style: Theme.of(context).textTheme.bodyText2),
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
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,

                                                children: [

                                                  SizedBox(height: 10,),
                                                  Align(
                                                    alignment: Alignment.topLeft,
                                                      child: Text('Rating:  ${selectedRating==1?"Any":selectedRating}+' ,style: Theme.of(context).textTheme.subtitle1.copyWith(fontFamily: 'Metropolis Semi Bold'),)),
                                                  SizedBox(height: 60,),

                                                  Transform.rotate(
                                                    angle:pi / 2,
                                                    child:Column(
                                                      children: [
                                                        Slider(
                                                          min: 1,
                                                          max: 5,
                                                          value: value,
                                                          activeColor: Theme.of(context).primaryColor,
                                                          divisions: 4,
                                                          autofocus: true,
                                                          inactiveColor:Theme.of(context).primaryColor.withOpacity(.3) ,
                                                          onChanged: (val){
                                                            setState((){
                                                              if(val=="1.0"){
                                                                value=2.0;
                                                              }else{
                                                                value=val;
                                                              }

                                                              print(val.toStringAsFixed(2));
                                                              print(val);
                                                               if(value.toStringAsFixed(2)=="1.00"){
                                                                selectedRating=5;
                                                              }else if(value.toStringAsFixed(2)=="2.00"){
                                                                selectedRating=4.5;
                                                              }else if(value.toStringAsFixed(2)=="3.00"){
                                                                selectedRating=4;
                                                              }else if(value.toStringAsFixed(2)=="4.00"){
                                                                selectedRating=3.5;
                                                              }else{
                                                                selectedRating=1;
                                                              }

                                                            });
                                                          },
                                                        ),

                                                        SizedBox(height: 16,),
                                                        Padding(
                                                          padding: const EdgeInsets.only(left:24,right:16,top:8,bottom: 8),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [

                                                              Transform.rotate(
                                                                  angle:-pi / 2,
                                                                  child: Text('5')),

                                                              Transform.rotate(
                                                                  angle:-pi / 2,
                                                                  child: Text('4.5')),

                                                              Transform.rotate(
                                                                  angle:-pi / 2,
                                                                  child: Text('4')),

                                                              Transform.rotate(
                                                                  angle:-pi / 2,
                                                                  child:Text('3.5')),

                                                              Transform.rotate(
                                                                  angle:-pi / 2,
                                                                  child: Text('Any')),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),

                                                  ),


                                                  SizedBox(height: 2,),

                                                ],
                                              ),
                                            ],
                                          )
                                    ),
                                  ],
                                ),
                              ),
                            ],

                          ),
                        ],
                      ),

                      Divider(
                        height: 1,
                        color: Colors.grey[300],
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
                            SizedBox(
                              width: MediaQuery.of(context).size.width*.4,
                              child: RaisedButton(onPressed: (){
                                if(isSortSelected){
                                  widget.allFrenchisiViewModel.getSortedFranchiseBySort(selectedSort);
                                }else{

                                String ratings='';
                                  if(selectedRating==1){
                                    ratings='1,2,3,4,5';
                                  }else if(selectedRating==5){
                                    ratings='5';
                                  }else if(selectedRating==4.5){
                                    ratings='4.5,5';
                                  }else if(selectedRating==4){
                                    ratings='4,4.5,5';
                                  }else if(selectedRating==3.5){
                                    ratings='3.5,4,,4.5,5';
                                  }


                                  widget.allFrenchisiViewModel
                                      .getSortedFranchiseByRating(
                                      ratings);
                                }
                                Navigator.pop(context);
                              },
                                child: Text("Apply",style: Theme.of(context).textTheme.button.copyWith(color:Colors.white),),
                                color: Theme.of(context).primaryColor,
                              ),
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


  Widget getLogo(String caption){
    switch(caption.toLowerCase()){
      case 'home':{
        return Icon(Icons.home,color: Theme.of(context).primaryColor,);
      }
      break;


      case 'work':{
        return Icon(Icons.work,color: Theme.of(context).primaryColor);
      }
      break;


      case 'other':{
        return Icon(Icons.assistant_navigation,color: Theme.of(context).primaryColor);
      }
      break;


    }


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
                      .height*.6,
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
                                    height: 8,
                                  ),

                                  widget.allFrenchisiViewModel.isAddressLoading?Container( height: 2, child: LinearProgressIndicator(
                                    valueColor:AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor) ,

                                  )):

                                  SizedBox(
                                    height: MediaQuery.of(context).size.height*.35,
                                    child: ListView.separated(
                                        itemCount:  widget.allFrenchisiViewModel.adressesMain.addressList.length,
                                        separatorBuilder: (context, index) => Divider(
                                          color: Colors.black54,
                                          height: 1,
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
                                                .addressCaption,style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.w500),softWrap: true,overflow: TextOverflow.fade,),

                                            subtitle: Text(widget.allFrenchisiViewModel
                                                .adressesMain
                                                .addressList[index]
                                                .landmark,style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.grey)),

                                            leading: getLogo(allFrenchisiViewModel
                                                .adressesMain
                                                .addressList[index].addressCaption),
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
                                      child: Text('Add New Address',style: Theme.of(context).textTheme.button.copyWith(color: Theme.of(context).primaryColor),),
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

          CachedNetworkImage(
          placeholder: (context, url) =>Image.asset('images/bannerplaceholder.jpg', fit: BoxFit.contain,),
      imageUrl: '${imageUrl}${element.imageList[0].imageName}',
      fit: BoxFit.contain,
      imageBuilder: (context, imageProvider) =>
          Container(
            width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(image: NetworkImage('${imageUrl}${element.imageList[0].imageName}'),
                    fit: BoxFit.contain)
      ),),)
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
  void dispose() {
    _disposer();
    super.dispose();
  }

  bool isNetWorkAvailable=true;
  @override
  void initState() {
      // slider();
      _disposer = reaction(
              (_) => connectivityStore.connectivityStream.value,
              (result) {
            if(result == ConnectivityResult.none){
              setState((){
                isNetWorkAvailable=false;

              });
            }else{
              setState((){
                isNetWorkAvailable=true;

              });
            }
          });

      super.initState();
  }



  void deliveryDialog(){
    showDialog(context: context,
        builder:(ctx)=> AlertDialog(
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



  final ScrollController _scrollController=ScrollController();
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
              floatingActionButton: (!widget.allFrenchisiViewModel.isLoadingForFranchiseData && widget.allFrenchisiViewModel.frainchiseHomeData==null)?Container(): FloatingActionButton.extended(
                backgroundColor: Theme.of(context).primaryColor,
                onPressed: () {

                  showDialog(context: context,
                      builder:(ctx)=>

                      new AlertDialog(



                        title: new Text("Categories",style: Theme.of(context).textTheme.headline6.copyWith(fontFamily: "Metropolis Semi Bold"),),

                        content:  Observer(
                          builder:(_)=> Container(
                            height: 300,
                            width: 250,
                            child:Scrollbar(
                              isAlwaysShown: true,
                              thickness: 4,
                              controller: _scrollController,
                              child:widget.allFrenchisiViewModel.frainchiseHomeData.subCategoryData.isEmpty?Text('Categories Not Available',style: Theme.of(context).textTheme.subtitle2,): ListView.builder(
                                 scrollDirection: Axis.vertical,
                                physics: ScrollPhysics(),
                                controller: _scrollController,
                                itemCount:  widget.allFrenchisiViewModel.frainchiseHomeData.subCategoryData.length+1,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    dense: true,

                                    onTap: (){
                                     allFrenchisiViewModel.searchListByCategory(index);
                                      Navigator.pop(context);
                                    },
                                    title: Text(index==0? "All": widget.allFrenchisiViewModel.frainchiseHomeData.subCategoryData[index-1].subCatName,style: Theme.of(context).textTheme.subtitle2.copyWith(fontWeight:allFrenchisiViewModel.localindex==index?FontWeight.bold:FontWeight.normal ),),
                                    trailing: Text(index==0? "": '${widget.allFrenchisiViewModel.frainchiseHomeData.subCategoryData[index-1].itemList.length}'),
                                  );
                                },
                              ),
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

                elevation: 0,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      children: <Widget>[
                        Image.asset('images/place_icon.png',width: 28,height: 28,color: Colors.white,),
                        SizedBox(width: 4,),
                        Expanded(
                          child: Observer(
                            builder:(_)=> InkWell(
                              onTap: (){

                                if(widget.allFrenchisiViewModel.itemsIds.isNotEmpty) {
                                  showDialog(context: context,
                                    builder: (ctx) =>
                                        AlertDialog(
                                          title: new Text("Replace cart item?", style: Theme
                                              .of(context)
                                              .textTheme
                                              .headline6,),
                                          content: Text(
                                              'The cart will empty, Do you want to continue?'),
                                          actions: [
                                            FlatButton(onPressed: () {
                                              Navigator.pop(context);
                                              // initiateHelpCall();
                                            }, child: Text("NO", style: Theme
                                                .of(context)
                                                .textTheme
                                                .button
                                                .copyWith(fontWeight: FontWeight.w600)),),

                                            FlatButton(onPressed: () async {
                                              Navigator.pop(context);
                                              openAddressedBottomSheet();

                                            }, child: Text("YES", style: Theme
                                                .of(context)
                                                .textTheme
                                                .button
                                                .copyWith(color: Theme
                                                .of(context)
                                                .primaryColor, fontWeight: FontWeight.w600))),
                                          ],
                                        ),
                                  );
                                }else {
                                  openAddressedBottomSheet();
                                }



                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${widget.allFrenchisiViewModel.isLoading?"Loading...":widget.allFrenchisiViewModel.custAdrressCaption}",style:Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.normal,color:Colors.white,),textAlign: TextAlign.center,overflow: TextOverflow.clip,),
                                  Text("${widget.allFrenchisiViewModel.isLoading?"":widget.allFrenchisiViewModel.custAdrress}",style:Theme.of(context).textTheme.caption.copyWith( fontFamily: "Metropolis",fontWeight: FontWeight.normal,color:Colors.white,),textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,),

                                ],
                              ),
                            ),
                          ),
                        ),
                      ],

                    ),
                    SizedBox(height: 4,),
                    Container(height: 1,width: MediaQuery.of(context).size.width*0.65,
                      color: Colors.white60,
                    )
                  ],
                ),
                actions: [
                  IconButton(icon:Icon( Icons.arrow_drop_down), onPressed:(){
                    if(widget.allFrenchisiViewModel.itemsIds.isNotEmpty) {
                      showDialog(context: context,
                        builder: (ctx) =>
                            AlertDialog(
                              title: new Text("Replace cart item?", style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline6,),
                              content: Text(
                                  'The cart will empty, Do you want to continue?'),
                              actions: [
                                FlatButton(onPressed: () {
                                  Navigator.pop(context);
                                  // initiateHelpCall();
                                }, child: Text("NO", style: Theme
                                    .of(context)
                                    .textTheme
                                    .button
                                    .copyWith(fontWeight: FontWeight.w600)),),

                                FlatButton(onPressed: () async {
                                  Navigator.pop(context);
                                  openAddressedBottomSheet();

                                }, child: Text("YES", style: Theme
                                    .of(context)
                                    .textTheme
                                    .button
                                    .copyWith(color: Theme
                                    .of(context)
                                    .primaryColor, fontWeight: FontWeight.w600))),
                              ],
                            ),
                      );
                    }else {
                      openAddressedBottomSheet();
                    }
                  }),

                  IconButton(icon:Icon( Icons.notifications), onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> NotificationsUi(widget.allFrenchisiViewModel)));

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
                          Radius.circular(8),
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

                                  prefixIcon: Image.asset('images/search_icn.png',color: Colors.grey[400],),
                                  prefixIconConstraints: BoxConstraints(maxHeight: 24,maxWidth: 24),
                                  prefixText: "  ",
                                  hintStyle: Theme.of(context).textTheme.subtitle2.copyWith(color:Colors.grey[400]),
                                  hintText: 'Search', border: InputBorder.none,),
                                // onChanged: onSearchTextChanged,
                              ),
                            ),
                            InkWell(

                              onTap: (){
                                openFilterBottomSheet();
                              },
                              child: Image.asset('images/filter_icon.png',color: Colors.grey[400],width: 24,height: 24,),),
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
                          margin: const EdgeInsets.only(bottom: 4),
                          child:


                          (allFrenchisiViewModel.isLoading || allFrenchisiViewModel.isLoadingForFranchiseData)?Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              color: Colors.white,
                              margin: EdgeInsets.only(top:8),
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey[200],
                                highlightColor: Colors.grey[50],
                                enabled: true,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 250,
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
                          ):(!widget.allFrenchisiViewModel.isLoadingForFranchiseData && widget.allFrenchisiViewModel.frainchiseHomeData==null)?Container(
                           height:  MediaQuery.of(context).size.height*.7,
                           width: MediaQuery.of(context).size.width ,
                            child:Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children:[ Image.asset(
                               "images/nointernet.png",
                               height:250,
                               width: MediaQuery.of(context).size.width*.6,
                             ),


                               SizedBox(
                                   width: MediaQuery.of(context).size.width*.8,
                                   child: Text("Could not connect to the internet. Please check your network",textAlign: TextAlign.center,style: Theme.of(context).textTheme.subtitle2.copyWith(color:Colors.grey),)),

                               FlatButton(
                                 onPressed: (){
                                   widget.allFrenchisiViewModel.getNearestFranchiseById();
                                 },
                                 child: Text("Try Again",style: Theme.of(context).textTheme.button.copyWith(color:Theme.of(context).primaryColor,fontFamily: "Metropolis"),),
                               )
                           ]
                           ),
                          ):Column(
                            children: <Widget>[
                              NoNetWorkWidget(),
                          Padding(
                                padding: const EdgeInsets.only(left:12.0,top: 8),
                                child: Observer(
                                  builder:(_)=> Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        //  height: 30.0,
                                        child: GestureDetector(
                                          onTap: () async{
                                            widget.allFrenchisiViewModel.setDelMode(2);
                                            if(widget.allFrenchisiViewModel.itemsIds.isEmpty) {
                                              if (widget.allFrenchisiViewModel
                                                  .outletType != 1) {
                                                await widget
                                                    .allFrenchisiViewModel
                                                    .setOutletType(1);
                                                widget.allFrenchisiViewModel
                                                    .frainchiseHomeData =
                                                    FranchiseId();
                                                widget.allFrenchisiViewModel
                                                    .getNearestFranchiseById();
                                              } else {
                                                _showSnackbar(
                                                    "Already Selected", true);
                                              }
                                            }else{
                                              showDialog(context: context,
                                                builder:(ctx)=> AlertDialog(
                                                  title: new Text("Replace cart item?",style: Theme.of(context).textTheme.headline6,),
                                                  content: Text('The cart will empty, Do you want to continue?'),
                                                  actions: [
                                                    FlatButton(onPressed: (){
                                                      Navigator.pop(context);
                                                      // initiateHelpCall();
                                                    }, child: Text("NO",style: Theme.of(context).textTheme.button.copyWith(fontWeight: FontWeight.w600)),),

                                                    FlatButton(onPressed: ()async{
                                                      if (widget.allFrenchisiViewModel
                                                          .outletType != 1) {
                                                        await widget
                                                            .allFrenchisiViewModel
                                                            .setOutletType(1);
                                                        widget.allFrenchisiViewModel
                                                            .frainchiseHomeData =
                                                            FranchiseId();
                                                        widget.allFrenchisiViewModel
                                                            .getNearestFranchiseById();
                                                      } else {
                                                        _showSnackbar(
                                                            "Already Selected", true);
                                                      }
                                                      Navigator.pop(context);
                                                    }, child: Text("YES",style: Theme.of(context).textTheme.button.copyWith(color:Theme.of(context).primaryColor,fontWeight: FontWeight.w600))),
                                                  ],
                                                ),
                                              );
                                            }
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: widget.allFrenchisiViewModel.outletType==1?Theme.of(context).primaryColor:Colors.grey[300] ,
                                                style: BorderStyle.solid,
                                                width: 1.0,
                                              ),
                                              color:widget.allFrenchisiViewModel.outletType==1?Theme.of(context).primaryColor:Colors.grey[300],
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
                                                      "Dairy Products",
                                                      style:Theme.of(context).textTheme.caption.copyWith(fontFamily: "Metropolis",fontWeight: FontWeight.bold).copyWith(color:widget.allFrenchisiViewModel.outletType==1?Colors.white:Colors.black))
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

                                            widget.allFrenchisiViewModel.setDelMode(2);
                                            if(widget.allFrenchisiViewModel.itemsIds.isEmpty){
                                            if( (!widget.allFrenchisiViewModel.isLoadingForFranchiseData && widget.allFrenchisiViewModel.frainchiseHomeData.subCategoryData.isEmpty)){
                                              _showSnackbar("Please wait , We are on it ..",true);

                                            }else {
                                              if (widget.allFrenchisiViewModel
                                                  .outletType != 2) {
                                                await widget
                                                    .allFrenchisiViewModel
                                                    .setOutletType(2);
                                                widget.allFrenchisiViewModel
                                                    .frainchiseHomeData =
                                                    FranchiseId();
                                                widget.allFrenchisiViewModel
                                                    .getNearestFranchiseById();
                                              } else {
                                                _showSnackbar(
                                                    "Already Selected", true);
                                              }
                                            }
                                            }else{
                                              showDialog(context: context,
                                                builder:(ctx)=> AlertDialog(
                                                  title: new Text("Replace cart item?",style: Theme.of(context).textTheme.headline6,),
                                                  content: Text('The cart will empty, Do you want to continue?'),

                                                  actions: [

                                                    FlatButton(onPressed: (){
                                                      Navigator.pop(context);
                                                      // initiateHelpCall();
                                                    }, child: Text("NO",style: Theme.of(context).textTheme.button.copyWith(fontWeight: FontWeight.w600))),

                                                    FlatButton(onPressed: ()async{
                                                      if (widget.allFrenchisiViewModel
                                                          .outletType != 2) {
                                                        await widget
                                                            .allFrenchisiViewModel
                                                            .setOutletType(2);
                                                        widget.allFrenchisiViewModel
                                                            .frainchiseHomeData =
                                                            FranchiseId();
                                                        widget.allFrenchisiViewModel
                                                            .getNearestFranchiseById();
                                                      } else {
                                                        _showSnackbar(
                                                            "Already Selected", true);
                                                      }
                                                      Navigator.pop(context);
                                                    }, child: Text("YES",style: Theme.of(context).textTheme.button.copyWith(color:Theme.of(context).primaryColor,fontWeight: FontWeight.w600),)),

                                                  ],
                                                ),
                                              );
                                            }
                                              // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
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
                                                      "Restaurant",
                                                      style:Theme.of(context).textTheme.caption.copyWith(fontFamily: "Metropolis",fontWeight: FontWeight.bold).copyWith(color:widget.allFrenchisiViewModel.outletType==2?Colors.white:Colors.black))
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


                                        if(widget.allFrenchisiViewModel.itemsIds.isNotEmpty) {
                                          showDialog(context: context,
                                            builder: (ctx) =>
                                                AlertDialog(
                                                  title: new Text("Replace cart item?", style: Theme
                                                      .of(context)
                                                      .textTheme
                                                      .headline6,),
                                                  content: Text(
                                                      'The cart will empty, Do you want to continue?'),
                                                  actions: [
                                                    FlatButton(onPressed: () {
                                                      Navigator.pop(context);
                                                      // initiateHelpCall();
                                                    }, child: Text("NO", style: Theme
                                                        .of(context)
                                                        .textTheme
                                                        .button
                                                        .copyWith(fontWeight: FontWeight.w600)),),

                                                    FlatButton(onPressed: () async {
                                                      widget.allFrenchisiViewModel.setDelMode(2);
                                                      widget.allFrenchisiViewModel.myLocalPrefes.setDefFranchiseRest(0);
                                                      widget.allFrenchisiViewModel.myLocalPrefes.setdefFranchiseDairy(0);
                                                      widget.allFrenchisiViewModel.getAllFranchise();
                                                      Navigator.pop(context);
                                                    }, child: Text("YES", style: Theme
                                                        .of(context)
                                                        .textTheme
                                                        .button
                                                        .copyWith(color: Theme
                                                        .of(context)
                                                        .primaryColor, fontWeight: FontWeight.w600))),
                                                  ],
                                                ),
                                          );
                                        }else {
                                          widget.allFrenchisiViewModel.setDelMode(2);
                                          widget.allFrenchisiViewModel.myLocalPrefes.setDefFranchiseRest(0);
                                          widget.allFrenchisiViewModel.myLocalPrefes.setdefFranchiseDairy(0);
                                          widget.allFrenchisiViewModel.getAllFranchise();
                                        }




                                        // deliveryDialog();


                                      },
                                      child: Row(

                                        children: [
                                          Radio(
                                            activeColor: Theme.of(context).primaryColor,
                                            value: widget.allFrenchisiViewModel.selectedDelMode, groupValue: 2, onChanged: (flag){
                                            if(widget.allFrenchisiViewModel.itemsIds.isNotEmpty) {
                                              showDialog(context: context,
                                                builder: (ctx) =>
                                                    AlertDialog(
                                                      title: new Text("Replace cart item?", style: Theme
                                                          .of(context)
                                                          .textTheme
                                                          .headline6,),
                                                      content: Text(
                                                          'The cart will empty, Do you want to continue?'),
                                                      actions: [
                                                        FlatButton(onPressed: () {
                                                          Navigator.pop(context);
                                                          // initiateHelpCall();
                                                        }, child: Text("NO", style: Theme
                                                            .of(context)
                                                            .textTheme
                                                            .button
                                                            .copyWith(fontWeight: FontWeight.w600)),),

                                                        FlatButton(onPressed: () async {
                                                          widget.allFrenchisiViewModel.setDelMode(2);
                                                          widget.allFrenchisiViewModel.myLocalPrefes.setDefFranchiseRest(0);
                                                          widget.allFrenchisiViewModel.myLocalPrefes.setdefFranchiseDairy(0);
                                                          widget.allFrenchisiViewModel.getAllFranchise();
                                                          Navigator.pop(context);
                                                        }, child: Text("YES", style: Theme
                                                            .of(context)
                                                            .textTheme
                                                            .button
                                                            .copyWith(color: Theme
                                                            .of(context)
                                                            .primaryColor, fontWeight: FontWeight.w600))),
                                                      ],
                                                    ),
                                              );
                                            }else {
                                              widget.allFrenchisiViewModel.setDelMode(2);
                                              widget.allFrenchisiViewModel.myLocalPrefes.setDefFranchiseRest(0);
                                              widget.allFrenchisiViewModel.myLocalPrefes.setdefFranchiseDairy(0);
                                              widget.allFrenchisiViewModel.getAllFranchise();
                                            }


                                            // deliveryDialog();

                                          }, ),
                                          Text('Delivery',style: Theme.of(context).textTheme.bodyText2.copyWith(fontFamily: "Metropolis",color:widget.allFrenchisiViewModel.selectedDelMode==2?Theme.of(context).primaryColor :Colors.black,fontWeight: FontWeight.bold),),
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        if(widget.allFrenchisiViewModel.itemsIds.isNotEmpty) {
                                          showDialog(context: context,
                                            builder: (ctx) =>
                                                AlertDialog(
                                                  title: new Text("Replace cart item?", style: Theme
                                                      .of(context)
                                                      .textTheme
                                                      .headline6,),
                                                  content: Text(
                                                      'The cart will empty, Do you want to continue?'),
                                                  actions: [
                                                    FlatButton(onPressed: () {
                                                      Navigator.pop(context);
                                                      // initiateHelpCall();
                                                    }, child: Text("NO", style: Theme
                                                        .of(context)
                                                        .textTheme
                                                        .button
                                                        .copyWith(fontWeight: FontWeight.w600)),),

                                                    FlatButton(onPressed: () async {
                                                      widget.allFrenchisiViewModel
                                                          .frainchiseHomeData =
                                                          FranchiseId();
                                                      widget.allFrenchisiViewModel
                                                          .getNearestFranchiseById();
                                                      widget.allFrenchisiViewModel.setDelMode(1);
                                                      Navigator.pop(context);
                                                      Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                                          TakeAway(allFrenchisiViewModel: widget.allFrenchisiViewModel,)));

                                                    }, child: Text("YES", style: Theme
                                                        .of(context)
                                                        .textTheme
                                                        .button
                                                        .copyWith(color: Theme
                                                        .of(context)
                                                        .primaryColor, fontWeight: FontWeight.w600))),
                                                  ],
                                                ),
                                          );
                                        }else {
                                          widget.allFrenchisiViewModel.setDelMode(1);
                                          Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                              TakeAway(allFrenchisiViewModel: widget.allFrenchisiViewModel,)));
                                        } },
                                      child: Row(
                                        children: [
                                          Radio(
                                            activeColor: Theme.of(context).primaryColor,
                                            value: widget.allFrenchisiViewModel.selectedDelMode, groupValue: 1, onChanged: (flag){
        if(widget.allFrenchisiViewModel.itemsIds.isNotEmpty) {
          showDialog(context: context,
            builder: (ctx) =>
                AlertDialog(
                  title: new Text("Replace cart item?", style: Theme
                      .of(context)
                      .textTheme
                      .headline6,),
                  content: Text(
                      'The cart will empty, Do you want to continue?'),
                  actions: [
                    FlatButton(onPressed: () {
                      Navigator.pop(context);
                      // initiateHelpCall();
                    }, child: Text("NO", style: Theme
                        .of(context)
                        .textTheme
                        .button
                        .copyWith(fontWeight: FontWeight.w600)),),

                    FlatButton(onPressed: () async {
                      widget.allFrenchisiViewModel
                          .frainchiseHomeData =
                          FranchiseId();
                      widget.allFrenchisiViewModel
                          .getNearestFranchiseById();
                      widget.allFrenchisiViewModel.setDelMode(1);
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>
                          TakeAway(allFrenchisiViewModel: widget.allFrenchisiViewModel,)));

                    }, child: Text("YES", style: Theme
                        .of(context)
                        .textTheme
                        .button
                        .copyWith(color: Theme
                        .of(context)
                        .primaryColor, fontWeight: FontWeight.w600))),
                  ],
                ),
          );
        }else {
          widget.allFrenchisiViewModel.setDelMode(1);
          Navigator.push(context, MaterialPageRoute(builder: (context) =>
              TakeAway(allFrenchisiViewModel: widget.allFrenchisiViewModel,)));
        }
                                          }, ),
                                          Text('Takeaway',style: Theme.of(context).textTheme.bodyText2.copyWith(fontFamily: "Metropolis",color:widget.allFrenchisiViewModel.selectedDelMode==1?Theme.of(context).primaryColor :Colors.black,fontWeight: FontWeight.bold),),
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
                              (allFrenchisiViewModel.frainchiseHomeData.offerData !=null && allFrenchisiViewModel.frainchiseHomeData.offerData.isNotEmpty)?    Container(
                                padding: EdgeInsets.only(bottom: 16),
                                decoration: BoxDecoration(
                                    border: Border.symmetric(vertical: BorderSide.none)
                                ),
                                child: Column(
                                  children: [

                                    widget.allFrenchisiViewModel.searchString==''?  SizedBox(
                                      height: 200,
                                      width: MediaQuery.of(context).size.width,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top:2.0,),
                                        child:
                                        CarouselSlider.builder(
                                          itemCount: getSliderImages().length,
                                          itemBuilder: (BuildContext context, int itemIndex) =>
                                            getSliderImages()[itemIndex],
                                          options: CarouselOptions(
                                            autoPlay: true,
                                            initialPage: 0,
                                            enlargeCenterPage: true,
                                            enableInfiniteScroll: true,
                                          ),
                                        )
                                        // PageView(
                                        //   scrollDirection: Axis.horizontal,
                                        //   physics: ScrollPhysics(),
                                        //   controller: _controller,
                                        //   children: getSliderImages(),
                                        //
                                        //   onPageChanged: (page){
                                        //   },
                                        // ),
                                      ),
                                    ):Container(),
                                  ],
                                ),
                              ):Container(
                                child: Container(),
                              ):Container(
                                child: NoServiceAvailable(widget.allFrenchisiViewModel.custAdrress),
                                color: Colors.red,
                              ),




                              (!widget.allFrenchisiViewModel.isLoading&&!widget.allFrenchisiViewModel.isLoadingForFranchiseData)?
                              (!widget.allFrenchisiViewModel.isLoadingForFranchiseData && widget.allFrenchisiViewModel.frainchiseHomeData.subCategoryData.isEmpty )? NoServiceAvailable(widget.allFrenchisiViewModel.custAdrress):
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Column(

                                    children: allFrenchisiViewModel.isSerching? getSearchedList(): getChildViews(),

                                  ),
                                  (!widget.allFrenchisiViewModel.isLoading&&!widget.allFrenchisiViewModel.isLoadingForFranchiseData)?
                                  widget.allFrenchisiViewModel.frainchiseHomeData!=null?

                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        SizedBox(width: 16,),
                                      Image.asset('images/fssai.png',height: 20,color:Colors.grey),
                                        SizedBox(height: 8,),
                                         Text('Lic.No. ${widget.allFrenchisiViewModel.frainchiseHomeData?.franchise?.frCode.split("~")[1]??""}',style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.grey),),
                                      ],
                                    ),
                                  )
                                      :Container()
                                      :Container(),
                                ],
                              ):Container(

                              ),

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



  _animateToIndex(index) {
    scrollController.animateTo(100*3.0,
        duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
  }

  List<Widget> getSearchedList(){


    List<Widget> widgets=[];

    widgets.add(
        Observer(
          builder: (_) => ListView.separated(
            shrinkWrap: true,
            // controller: controller,
            separatorBuilder: (context, index) => Divider(
              color: Colors.grey[300],
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

final scrollController=ScrollController();


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
          padding: EdgeInsets.only(top:8,left: 16,bottom: 8,right: 8),
          color: Theme.of(context).primaryColor,
          child: Text('${widget.Data.subCatName}',style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),)),
      content:  Container(
        padding: EdgeInsets.only(left:8,right:8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.Data.itemList.isNotEmpty? ListView.separated(
              controller: scrollController,
              shrinkWrap: true,
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey[300],
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
  double _height=0;
  double _width=0;
  double height=100;
  double width=0.25;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 5000),
      curve: Curves.easeInOutCirc,
      padding: EdgeInsets.only(left:8,right:8),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Stack(
              children: <Widget>[

                widget.itemData.imageList.isNotEmpty?
                InkWell(
                      onTap: (){
                        setState(() {
                          isSelected=false;
                          _height=0;
                           _width=0.0;
                           height=100;
                           width=0.25;
                        });
                      },
                  child: AnimatedContainer(
                    width: MediaQuery.of(context).size.width*_width,
            height:  _height,
            duration:Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            child: Image.network('${imageUrl}${widget.itemData.imageList[0].imageName}',width:MediaQuery.of(context).size.width*_width,height: _height,fit: BoxFit.cover,)),
                ):Container(),

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

            isSelected? Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment:  CrossAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> MenuDetails( widget.itemData,widget.allFrenchisiViewModel)));
                  },
                  child: Container(
                    width:widget.itemData.imageList.isNotEmpty? MediaQuery.of(context).size.width*.39:MediaQuery.of(context).size.width*.60,
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
                            style: Theme.of(context).textTheme.bodyText1,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        // SizedBox(
                        //   child: Text(
                        //     widget.itemData.itemDesc,
                        //     style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.grey),
                        //     textAlign: TextAlign.start,
                        //     overflow: TextOverflow.ellipsis,
                        //   ),
                        // ),


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
                                  widget.itemData.productStatus.toUpperCase(),
                                  style:Theme.of(context).textTheme.caption.copyWith(color:Colors.white,fontSize: 10)),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 4,
                        ),
                        new Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[

                            Icon(Icons.star, color:widget.itemData.rating>=1?Colors.yellow.shade800:Colors.grey,size: 12,),
                            Icon(Icons.star, color: widget.itemData.rating>=2?Colors.yellow.shade800:Colors.grey,size: 12,),
                            Icon(Icons.star, color: widget.itemData.rating>=3?Colors.yellow.shade800:Colors.grey,size: 12,),
                            Icon(Icons.star, color: widget.itemData.rating>=4?Colors.yellow.shade800:Colors.grey,size: 12,),
                            Icon(Icons.star, color: widget.itemData.rating>=5?Colors.yellow.shade800:Colors.grey,size: 12,),


                          ],
                        ),

                        Row(
                          children: [
                            Image.asset('images/rupees_icn.png',width: 16,height: 16,),
                            Text('${widget.itemData.spRateAmt}',style: Theme.of(context).textTheme.bodyText2.copyWith( fontFamily: "Metropolis",),),
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
                      padding: EdgeInsets.all(6),
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


                            String selected='100g';
                            double selectedQuestity=0.10;


                            showModalBottomSheet(
                                context: context,
                                builder:(_)=>
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
                                                            selected='100g';
                                                            selectedQuestity=.10;
                                                          });
                                                        },

                                                        child: Container(

                                                          child: Text('100g',
                                                            style: Theme.of(context).textTheme.subtitle2
                                                                .copyWith(color: selectedQuestity==0.10?Colors.white:Colors.black,),
                                                          ),
                                                          padding: EdgeInsets.all(8),
                                                          decoration: BoxDecoration(
                                                              border: Border.all(color: Theme.of(context).primaryColor),
                                                              shape: BoxShape.rectangle,
                                                              color: selectedQuestity==0.10?Theme.of(context).primaryColor:Colors.white,
                                                              borderRadius: BorderRadius.all(Radius.circular(8))


                                                          ),
                                                        ),
                                                      ),

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
                                                            selected='1 kg';
                                                            selectedQuestity=1.0;
                                                          });
                                                        },
                                                        child: Container(

                                                          child: Text(' 1 kg ',
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
                                                        padding: EdgeInsets.only(left:4,right:4,top: 4,bottom: 4),
                                                        width: MediaQuery.of(context).size.width*.20,
                                                        decoration: BoxDecoration(
                                                          border: Border.all(color: Colors.grey),
                                                          borderRadius:
                                                          new BorderRadius.circular(4.0),

                                                        ),
                                                        child: Container(

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
                                                                    height: 16,color:Colors.black)),
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
                                                                    height: 16,color:Colors.black)),


                                                            ],
                                                          ),
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
                              Expanded(

                                child: widget.allFrenchisiViewModel.itemsIds.contains(widget.itemData.itemId)?InkWell(
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
                                        String selected = '100g';
                                        double selectedQuestity = 0.10;

                                        showModalBottomSheet(
                                            context: context,
                                            builder:(_)=>
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
                                                                        '100g';
                                                                        selectedQuestity =
                                                                        .10;
                                                                      });
                                                                    },

                                                                    child: Container(

                                                                      child: Text(
                                                                        '100g',
                                                                        style: Theme
                                                                            .of(
                                                                            context)
                                                                            .textTheme
                                                                            .subtitle2
                                                                            .copyWith(
                                                                          color: selectedQuestity ==
                                                                              0.10
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
                                                                              0.10
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
                                                                        '250g';
                                                                        selectedQuestity =
                                                                        0.25;
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
                                                                              0.50
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
                                                                              0.50
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
                                                                        '1 kg';
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
                                                                    padding: EdgeInsets.only(left:4,right:4,top: 4,bottom: 4),
                                                                    width: MediaQuery.of(context).size.width*.20,
                                                                    decoration: BoxDecoration(
                                                                      border: Border.all(color: Colors.grey),
                                                                      borderRadius:
                                                                      new BorderRadius.circular(4.0),
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
                                                                            child: Container(
                                                                              padding: EdgeInsets.all(2),

                                                                              child: Image
                                                                                  .asset(
                                                                                'images/minus_icn.png',
                                                                                width: 16,
                                                                                height: 16,color:Colors.black),
                                                                            )),
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
                                                                            child: Container(
                                                                              padding: EdgeInsets.all(2),

                                                                              child: Image
                                                                                  .asset(
                                                                                'images/plus_icon.png',
                                                                                width: 16,
                                                                                height: 16,color:Colors.black),
                                                                            )),


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
                                    child:widget.itemData.isDecimal!=0?Container():Container(


                                        padding: EdgeInsets.all(2),
                                        child: Image.asset('images/plus_icon.png',width: 16,height: 16,color: Colors.black,))):Container(),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(left:8,right:8,top:2,bottom: 2),
                                child: Row(
                                  children: [
                                    Text(
                                      widget. allFrenchisiViewModel.itemsIds.contains(widget.itemData.itemId)?widget.itemData.isDecimal!=0?"Added":"${widget.allFrenchisiViewModel.getQuantity(widget.itemData.itemId)}":"Add",style: Theme.of(context).textTheme.subtitle2.copyWith(color: Theme.of(context).primaryColor),),
                                    widget.allFrenchisiViewModel.itemsIds.contains(widget.itemData.itemId)? Container():SizedBox(width: 4,),
                                    widget.allFrenchisiViewModel.itemsIds.contains(widget.itemData.itemId)? Container():Image.asset('images/plus_icon.png',width: 12,height: 12,color: Colors.black,),

                                  ],
                                ),
                              ),

                              Expanded(
                                child: widget.allFrenchisiViewModel.itemsIds.contains(widget.itemData.itemId)?
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

                                          showModalBottomSheet(
                                              context: context,
                                              builder:(_)=>   StatefulBuilder(
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
                                                                      selected='1kg';
                                                                      selectedQuestity=1.0;
                                                                    });
                                                                  },
                                                                  child: Container(

                                                                    child: Text(' 1 kg ',
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
                                                                  padding: EdgeInsets.only(left:4,right:4,top: 4,bottom: 4),
                                                                  width: MediaQuery.of(context).size.width*.20,
                                                                  decoration: BoxDecoration(
                                                                    border: Border.all(color: Colors.grey),
                                                                    borderRadius:
                                                                    new BorderRadius.circular(4.0),
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
                                                                          child: Container(
                                                                            padding: EdgeInsets.all(2),
                                                                            child: Image.asset(
                                                                              'images/minus_icn.png',
                                                                              width: 16,
                                                                              height: 16,color: Colors.black,),
                                                                          )),
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
                                                                          child: Container(
                                                                            padding: EdgeInsets.all(2),
                                                                            child: Image.asset(
                                                                              'images/plus_icon.png',
                                                                              width: 16,
                                                                              height: 16,color:Colors.black),
                                                                          )),


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
                                    child:widget.itemData.isDecimal!=0?Container(): Container(

                                        padding: EdgeInsets.all(2),
                                        child: Image.asset('images/minus_icn.png',width: 16,height: 16,color: Colors.black,))):Container(),
                              ),
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
            ):
            Row(
              mainAxisSize: MainAxisSize.max,
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
                        ):Stack(
                          children: <Widget>[

                            widget.itemData.imageList.isNotEmpty?
                            InkWell(
                                onTap: (){
                                  setState(() {
                                    isSelected=true;
                                    _height=200;
                                    _width=0.9;
                                    height=0;
                                    width=0;

                                  });
                                },
                                child: AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    width: MediaQuery.of(context).size.width*width,
                                    height: height,
                                    curve: Curves.easeInOut,
                                    child:FadeInImage.assetNetwork(
                                        placeholder: 'images/dairyplaceholder.jpg',
                                        image: '${imageUrl}${widget.itemData.imageList[0].imageName}',fit: BoxFit.fill
                                    ),
                                    //
                                    // CachedNetworkImage(
                                    //   imageUrl: '${imageUrl}${widget.itemData.imageList[0].imageName}',
                                    //     width: MediaQuery.of(context).size.width*width,height:height,
                                    //   // progressIndicatorBuilder: (context, url, downloadProgress) =>
                                    //   //     CircularProgressIndicator(value: downloadProgress.progress,valueColor:AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),),
                                    //   errorWidget: (context, url, error) => Icon(Icons.error),
                                    // )
                                    //
                                )):Container(),

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
                        width:widget.itemData.imageList.isNotEmpty? MediaQuery.of(context).size.width*.35:MediaQuery.of(context).size.width*.55,
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
                                style: Theme.of(context).textTheme.bodyText1,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            // SizedBox(
                            //   child: Text(
                            //     widget.itemData.itemDesc,
                            //     style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.grey),
                            //     textAlign: TextAlign.start,
                            //     overflow: TextOverflow.ellipsis,
                            //   ),
                            // ),


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
                                      widget.itemData.productStatus.toUpperCase(),
                                      style:Theme.of(context).textTheme.caption.copyWith(color:Colors.white,fontSize: 10)),
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 4,
                            ),
                            new Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[

                                Icon(Icons.star, color:widget.itemData.rating>=1?Colors.yellow.shade800:Colors.grey,size: 12,),
                                Icon(Icons.star, color: widget.itemData.rating>=2?Colors.yellow.shade800:Colors.grey,size: 12,),
                                Icon(Icons.star, color: widget.itemData.rating>=3?Colors.yellow.shade800:Colors.grey,size: 12,),
                                Icon(Icons.star, color: widget.itemData.rating>=4?Colors.yellow.shade800:Colors.grey,size: 12,),
                                Icon(Icons.star, color: widget.itemData.rating>=5?Colors.yellow.shade800:Colors.grey,size: 12,),


                              ],
                            ),

                            Row(
                              children: [
                                Image.asset('images/rupees_icn.png',width: 16,height: 16,),
                                Text('${widget.itemData.spRateAmt}',style: Theme.of(context).textTheme.bodyText2.copyWith( fontFamily: "Metropolis",),),
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


                            String selected='100g';
                            double selectedQuestity=0.10;


                            showModalBottomSheet(
                                context: context,
                                builder:(_)=>
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
                                                        selected='100g';
                                                        selectedQuestity=.10;
                                                      });
                                                    },

                                                    child: Container(

                                                      child: Text('100g',
                                                        style: Theme.of(context).textTheme.subtitle2
                                                            .copyWith(color: selectedQuestity==0.10?Colors.white:Colors.black,),
                                                      ),
                                                      padding: EdgeInsets.all(8),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(color: Theme.of(context).primaryColor),
                                                          shape: BoxShape.rectangle,
                                                          color: selectedQuestity==0.10?Theme.of(context).primaryColor:Colors.white,
                                                          borderRadius: BorderRadius.all(Radius.circular(8))


                                                      ),
                                                    ),
                                                  ),

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
                                                        selected='1 kg';
                                                        selectedQuestity=1.0;
                                                      });
                                                    },
                                                    child: Container(

                                                      child: Text(' 1 kg ',
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

                                                      width: MediaQuery.of(context).size.width*.20,
                                                      padding: EdgeInsets.all(4),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(color: Colors.grey),
                                                        borderRadius:
                                                        new BorderRadius.circular(4.0),
                                                      ),
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                   allFrenchisiViewModel.decreaseQuentityForDecimal(widget.itemData.itemId,selectedQuestity);

                                                                });
                                                              },
                                                              child: Image.asset(
                                                                'images/minus_icn.png',
                                                                width: 16,
                                                                height: 16,color: Colors.black,)),
                                                        ),
                                                        Expanded(
                                                          child: Text("${allFrenchisiViewModel.getQuantityData(selectedQuestity,widget.itemData.itemId)} ",
                                                            textAlign: TextAlign.center,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  allFrenchisiViewModel.increseQuentityForDecimal(widget.itemData.itemId,selectedQuestity);

                                                                });
                                                              },
                                                              child: Image.asset(
                                                                'images/plus_icon.png',
                                                                width: 16,
                                                                height: 16,color: Colors.black)),
                                                        ),


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

                              widget.allFrenchisiViewModel.itemsIds.contains(widget.itemData.itemId)? Expanded(
                                flex: 1,
                                child: InkWell(
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

                                          showModalBottomSheet(
                                              context: context,
                                              builder:(_)=>   StatefulBuilder(
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
                                                                      selected='1kg';
                                                                      selectedQuestity=1.0;
                                                                    });
                                                                  },
                                                                  child: Container(

                                                                    child: Text(' 1 kg ',
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
                                                                  padding: EdgeInsets.only(left:4,right:4,top: 4,bottom: 4),
                                                                  width: MediaQuery.of(context).size.width*.20,
                                                                  decoration: BoxDecoration(
                                                                    border: Border.all(color: Colors.grey),
                                                                    borderRadius:
                                                                    new BorderRadius.circular(4.0),
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    children: [
                                                                      Expanded(
                                                                        child: InkWell(
                                                                            onTap: () {
                                                                              setState(() {

                                                                                allFrenchisiViewModel.decreaseQuentityForDecimal(widget.itemData.itemId,selectedQuestity);

                                                                              });
                                                                            },
                                                                            child: Container(
                                                                              padding: EdgeInsets.all(2),
                                                                              child: Image.asset(
                                                                                  'images/minus_icn.png',
                                                                                  width: 16,
                                                                                  height: 16,color:Colors.black),
                                                                            )),
                                                                      ),

                                                                      Expanded(
                                                                        child: Text("  ${ widget.allFrenchisiViewModel.itemsIds.contains(widget.itemData.itemId)?
                                                                        allFrenchisiViewModel.getQuantityData(selectedQuestity,widget.itemData.itemId)??1:1} ",
                                                                          textAlign: TextAlign.center,
                                                                        ),
                                                                      ),

                                                                      Expanded(
                                                                        child: InkWell(
                                                                            onTap: () {
                                                                              setState(() {
                                                                                allFrenchisiViewModel.increseQuentityForDecimal(widget.itemData.itemId,selectedQuestity);

                                                                              });
                                                                            },
                                                                            child: Container(

                                                                              padding: EdgeInsets.all(2),
                                                                              child: Image.asset(
                                                                                  'images/plus_icon.png',
                                                                                  width: 16,
                                                                                  height: 16,color:Colors.black),
                                                                            )),
                                                                      ),


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
                                    child:widget.itemData.isDecimal!=0?Container(): Container(
                                        padding: EdgeInsets.all(2),
                                        child: Image.asset('images/minus_icn.png',width: 16,height: 16,color: Colors.black,))),
                              ):Container(),
                              Padding(
                                padding: const EdgeInsets.only(left:8,right:8,top:2,bottom: 2),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget. allFrenchisiViewModel.itemsIds.contains(widget.itemData.itemId)?widget.itemData.isDecimal!=0?"Added":"${widget.allFrenchisiViewModel.getQuantity(widget.itemData.itemId)}":"Add",style: Theme.of(context).textTheme.bodyText2.copyWith(color: Theme.of(context).primaryColor),),
                                    widget.allFrenchisiViewModel.itemsIds.contains(widget.itemData.itemId)? Container():SizedBox(width: 4,),
                                    widget.allFrenchisiViewModel.itemsIds.contains(widget.itemData.itemId)? Container():Image.asset('images/plus_icon.png',width: 12,height: 12,color: Colors.black,),

                                  ],
                                ),
                              ),
                              widget.allFrenchisiViewModel.itemsIds.contains(widget.itemData.itemId)?  Expanded(
                                child: widget.allFrenchisiViewModel.itemsIds.contains(widget.itemData.itemId)?InkWell(
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
                                        String selected = '100g';
                                        double selectedQuestity = 0.10;

                                        showModalBottomSheet(
                                            context: context,
                                            builder:(_)=>
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
                                                                        '100g';
                                                                        selectedQuestity =
                                                                        .10;
                                                                      });
                                                                    },

                                                                    child: Container(

                                                                      child: Text(
                                                                        '100g',
                                                                        style: Theme
                                                                            .of(
                                                                            context)
                                                                            .textTheme
                                                                            .subtitle2
                                                                            .copyWith(
                                                                          color: selectedQuestity ==
                                                                              0.10
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
                                                                              0.10
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
                                                                        '250g';
                                                                        selectedQuestity =
                                                                        0.25;
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
                                                                              0.50
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
                                                                              0.50
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
                                                                        '1 kg';
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
                                                                    width: MediaQuery.of(context).size.width*.20,
                                                                    padding: EdgeInsets.all(4),
                                                                    decoration: BoxDecoration(
                                                                      border: Border.all(color: Colors.grey),
                                                                      borderRadius:
                                                                      new BorderRadius.circular(4.0),
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisSize: MainAxisSize.min,
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                                            child: Container(
                                                                              padding: EdgeInsets.all(2),

                                                                              child: Image
                                                                                  .asset(
                                                                                  'images/minus_icn.png',
                                                                                  width: 16,
                                                                                  height: 16,color: Colors.black),
                                                                            )),
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
                                                                            child: Container(
                                                                              padding: EdgeInsets.all(2),

                                                                              child: Image
                                                                                  .asset(
                                                                                  'images/plus_icon.png',
                                                                                  width: 16,
                                                                                  height: 16,color: Colors.black),
                                                                            )),


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
                                    child:widget.itemData.isDecimal!=0?Container():Container(

                                        padding: EdgeInsets.all(2),
                                        child: Image.asset('images/plus_icon.png',width: 16,height: 16,color: Colors.black,))):Container(),
                              ):Container(),

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
          ],
        ),
      ),
    );
  }



  void  _showSnackbar(String msg,bool isPositive) {
    Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(msg,style:Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.white),),
          duration: Duration(seconds: 3),
          backgroundColor: isPositive?Colors.green:Colors.redAccent,
        ));
  }
}

