
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_kitchen/local/staticUrls.dart';
import 'package:cloud_kitchen/network/model/request/purchase/cartitem.dart';
import 'package:cloud_kitchen/network/model/response/ItemData.dart';
import 'package:cloud_kitchen/network/model/response/RelItemList.dart';
import 'package:cloud_kitchen/viewmodel/franchisi/frviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MenuDetails extends StatefulWidget {
 final ItemData itemData;
 final AllFrenchisiViewModel allFrenchisiViewModel;

  const MenuDetails( this.itemData,this.allFrenchisiViewModel) ;

  @override
  _MenuDetailsState createState() => _MenuDetailsState();
}
final scaffoldState = GlobalKey<ScaffoldState>();
class _MenuDetailsState extends State<MenuDetails> {



  List<Widget> getSliderImages(){
    List<Widget> widgets=[];
    widget.itemData.imageList.forEach((element) {
      widgets.add(
          Image.network('${imageUrl}${element.imageName}',fit: BoxFit.contain,)
      );
    });

    return widgets;
  }

  final reviewController=TextEditingController();
  double rating=5;
  final ScrollController _scrollController=ScrollController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldState,
        body:Scrollbar(
          controller: _scrollController,
          isAlwaysShown: true,
          thickness: 4,
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [

                SingleChildScrollView(
                  child: Observer(
                    builder:(_)=> Container(

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          widget.itemData.imageList.isNotEmpty?        SizedBox(
                            height: 250,
                            child: CarouselSlider.builder(
                              itemCount: getSliderImages().length,
                              itemBuilder: (BuildContext context, int itemIndex) =>
                              getSliderImages()[itemIndex],
                              options: CarouselOptions(
                                autoPlay: true,
                                viewportFraction: 1,
                                initialPage: 0,
                                enlargeCenterPage: true,
                                enableInfiniteScroll: true,
                              ),
                            )

                            // PageView(
                            //
                            //   children: getSliderImages(),
                            // ),
                          ):Container(),




                          Container(
                            padding: EdgeInsets.all(16),
                            margin:widget.itemData.imageList.isEmpty?  EdgeInsets.only(top: 42):EdgeInsets.only(top: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(2),
                                      padding: EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        color:widget.itemData.rating>=1 ?Theme.of(context).primaryColor:Colors.grey,
                                        borderRadius: BorderRadius.circular(2)

                                      ),
                                      child: Icon(Icons.star,color: Colors.white,size: 14,),
                                    ),

                                    Container(
                                      margin: EdgeInsets.all(2),
                                      padding: EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                          color:widget.itemData.rating>=2 ?Theme.of(context).primaryColor:Colors.grey,
                                          borderRadius: BorderRadius.circular(2)

                                      ),
                                      child: Icon(Icons.star,color: Colors.white,size: 14,),
                                    ),

                                    Container(
                                      margin: EdgeInsets.all(2),
                                      padding: EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                          color:widget.itemData.rating>=3 ?Theme.of(context).primaryColor:Colors.grey,

                                          borderRadius: BorderRadius.circular(2)

                                      ),
                                      child: Icon(Icons.star,color: Colors.white,size: 14,),
                                    ),

                                    Container(
                                      margin: EdgeInsets.all(2),
                                      padding: EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                          color:widget.itemData.rating>=4 ?Theme.of(context).primaryColor:Colors.grey,

                                          borderRadius: BorderRadius.circular(2)

                                      ),
                                      child: Icon(Icons.star,color: Colors.white,size: 14,),
                                    ),

                                    Container(
                                      margin: EdgeInsets.all(2),
                                      padding: EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                          color:widget.itemData.rating>=5 ?Theme.of(context).primaryColor:Colors.grey,
                                          borderRadius: BorderRadius.circular(2)

                                      ),

                                      child: Icon(Icons.star,color: Colors.white,size: 14,),
                                    ),

                                    SizedBox(width: 8,),
                                    Text('${widget.itemData.rating}',style: Theme.of(context).textTheme.subtitle2.copyWith(fontWeight: FontWeight.bold),)
                                  ],
                                ),

                                Row(children: [
                                  Image.asset('images/rupees_icn.png',width: 16,height: 16,color: Theme.of(context).primaryColor),
                                  Text("${widget.itemData.spRateAmt}",style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),),
                                  SizedBox(width: 4,),
                                  Image.asset('images/rupees_icn.png',width: 14,height: 14,color: Colors.grey,),
                                  Text("${widget.itemData.rateAmt}",style: Theme.of(context).textTheme.bodyText2.copyWith(fontWeight: FontWeight.bold,color: Colors.grey,decoration: TextDecoration.lineThrough),),
                                ],)
                              ],
                            ),
                          ),

                          Container(
                              padding: EdgeInsets.only(left: 16,right: 16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${widget.itemData.itemName}',style: Theme.of(context).textTheme.headline6.copyWith(fontFamily: 'Metropolis Semi Bold'),),
                              SizedBox(height: 4,),
                               Text('${widget.itemData.itemDesc}',style: Theme.of(context).textTheme.subtitle2.copyWith(fontFamily: 'Metropolis'),),
                              SizedBox(height: 4,),
                               Text('${widget.itemData.tasteName} - ${widget.itemData.tagName}',style: Theme.of(context).textTheme.caption,),

                            ],
                          )),

                          widget.itemData.exVar1==""?Container(): Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                             mainAxisSize: MainAxisSize.min,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               SizedBox(height: 8,),
                               Divider(
                                 color: Colors.grey[300],
                               ),
                               Container(
                                   padding: EdgeInsets.only(left: 16,right: 16),
                                   child: Column(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text('Ingredients',style: Theme.of(context).textTheme.subtitle1.copyWith(fontFamily: 'Metropolis Semi Bold'),),
                                       Text('${widget.itemData.exVar1}',style: Theme.of(context).textTheme.caption,),

                                     ],
                                   )
                               ),
                             ],
                           ),


                            Container(
                              padding: EdgeInsets.only(left: 16,right: 16,top: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Text('Coupons for you',style: Theme.of(context).textTheme.headline6,),

                                  // SizedBox(height: 16,),
                                  // SizedBox(
                                  //   width: MediaQuery.of(context).size.width,
                                  //
                                  //   child: ListView.builder(
                                  //       scrollDirection: Axis.horizontal,
                                  //       itemCount: widget.itemData.offerList.length??0,
                                  //       itemBuilder: (BuildContext context, int index) {
                                  //         return Container(
                                  //             margin: EdgeInsets.all(4),
                                  //             padding: EdgeInsets.all(8),
                                  //             decoration: BoxDecoration(
                                  //               border: Border.all(color: Colors.grey)
                                  //             ),
                                  //             child: Row(
                                  //               children: [
                                  //
                                  //                 Icon(Icons.local_offer_outlined,color: Theme.of(context).primaryColor,),
                                  //                 SizedBox(width: 8,),
                                  //
                                  //                 Column(
                                  //                   crossAxisAlignment: CrossAxisAlignment.start,
                                  //                   children: [
                                  //                     Text('${widget.itemData.offerList[index].offerName}', style: Theme.of(context).textTheme.headline6.copyWith()),
                                  //                     Text('${widget.itemData.offerList[index].offerDetailList[0].offerLimit}% off upto ${widget.itemData.offerList[index].offerDetailList[0].offerLimit}', style: TextStyle()),
                                  //                   ],
                                  //                 ),
                                  //               ],
                                  //             ));
                                  //       }
                                  //
                                  //   ),
                                  // ),

                                //   widget.itemData.relItemList.isNotEmpty?  SizedBox(height: 16,):Container(),
                                //
                                //   widget.itemData.relItemList.isNotEmpty?  Container(height: 1,
                                //     color: Colors.grey[300],):Container(),
                                //
                                //
                                // SizedBox(height: 8,),
                                //   widget.itemData.relItemList.isNotEmpty? Text('Related Items',style: Theme.of(context).textTheme.subtitle1):Container(),

                                                                  widget.itemData.relItemList.isNotEmpty?SizedBox(height: 8,):Container(),
                                                                  widget.itemData.relItemList.isNotEmpty?Text('Related Products',style: Theme.of(context).textTheme.subtitle2,):Container(),

                                  widget.itemData.relItemList.isNotEmpty? ListView.separated(
                                    shrinkWrap: true,
                                    separatorBuilder: (context, index) => Divider(
                                      color: Colors.black,
                                    ),
                                    physics: ScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    itemCount: widget.itemData.relItemList.length,
                                    itemBuilder: (_, int index) {
                                      RelItemList relitem=widget.itemData.relItemList[index];
                                      return    AnimatedContainer(
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
                                                      relitem.imageList.isEmpty?  Padding(
                                                        padding: const EdgeInsets.only(top:15,left: 5),
                                                        child: Image.asset(
                                                          "images/veg_icn.png",
                                                          height: 10,
                                                          width: 10,
                                                        ),
                                                      ): Stack(
                                                        children: <Widget>[

                                                          relitem.imageList.isNotEmpty?
                                                          InkWell(
                                                              onTap: (){
                                                                // setState(() {
                                                                //   isSelected=true;
                                                                // });
                                                              },
                                                              child: Image.network('${imageUrl}${relitem.imageList[0].imageName}',width: MediaQuery.of(context).size.width*.25,height: 100,)):Container(),

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
                                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> MenuDetails( relitem,widget.allFrenchisiViewModel)));
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
                                                              relitem.itemName,
                                                              style: Theme.of(context).textTheme.bodyText1,
                                                              textAlign: TextAlign.start,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 4,
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
                                                                    relitem.productStatus.toUpperCase(),
                                                                    style:Theme.of(context).textTheme.caption.copyWith(color:Colors.white,fontSize: 10)),
                                                              ),
                                                            ),
                                                          ),


                                                          new Row(
                                                            mainAxisSize: MainAxisSize.min,
                                                            children: <Widget>[

                                                              Icon(Icons.star, color:relitem.rating>=1?Colors.yellow.shade800:Colors.grey,size: 12,),
                                                              Icon(Icons.star, color: relitem.rating>=2?Colors.yellow.shade800:Colors.grey,size: 12,),
                                                              Icon(Icons.star, color: relitem.rating>=3?Colors.yellow.shade800:Colors.grey,size: 12,),
                                                              Icon(Icons.star, color: relitem.rating>=4?Colors.yellow.shade800:Colors.grey,size: 12,),
                                                              Icon(Icons.star, color: relitem.rating>=5?Colors.yellow.shade800:Colors.grey,size: 12,),

                                                            ],
                                                          ),

                                                          Row(
                                                            children: [
                                                              Image.asset('images/rupees_icn.png',width: 16,height: 16,),
                                                              Text('${relitem.spRateAmt}',style: Theme.of(context).textTheme.bodyText2.copyWith( fontFamily: "Metropolis",),),
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
                                                    width: MediaQuery.of(context).size.width*.27,
                                                    padding: EdgeInsets.all(4),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(color: Colors.grey),
                                                      borderRadius:
                                                      new BorderRadius.circular(4.0),
                                                    ),

                                                    child:
                                                    InkWell(

                                                      onTap: (){
                                                        if(relitem.isDecimal==0)
                                                        {
                                                          if(!widget. allFrenchisiViewModel.itemsIds.contains(relitem.itemId)) {
                                                            CartItem cartItem = CartItem(
                                                                relitem.itemId, 1, 1,
                                                                relitem.itemName,
                                                                relitem.spRateAmt,
                                                                relitem.itemUom
                                                            );
                                                            widget.allFrenchisiViewModel.addCartItem(
                                                                cartItem);
                                                            // _showSnackbar("Item Added!", true);

                                                          }

                                                        }else{


                                                          String selected='100g';
                                                          double selectedQuestity=0.10;


                                                          scaffoldState.currentState.showBottomSheet((context) =>
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
                                                                                      selectedQuestity=0.25;
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

                                                                                    child: Text('1 kg',
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
                                                                                              widget.allFrenchisiViewModel.decreaseQuentityForDecimal(relitem.itemId,selectedQuestity);

                                                                                            });
                                                                                          },
                                                                                          child: Image.asset(
                                                                                            'images/minus_icn.png',
                                                                                            width: 16,
                                                                                            height: 16,)),
                                                                                      SizedBox(width: 2,),
                                                                                      Text("${widget.allFrenchisiViewModel.getQuantityData(selectedQuestity,relitem.itemId)} ",
                                                                                      ),
                                                                                      SizedBox(width: 2,),
                                                                                      InkWell(
                                                                                          onTap: () {
                                                                                            setState(() {
                                                                                              widget.allFrenchisiViewModel.increseQuentityForDecimal(relitem.itemId,selectedQuestity);

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
                                                                                    relitem.itemId, selectedQuestity, int.parse(widget.allFrenchisiViewModel.getQuantityData(selectedQuestity,relitem.itemId)),
                                                                                    relitem.itemName,
                                                                                    relitem.spRateAmt,
                                                                                    relitem.itemUom);
                                                                                widget.allFrenchisiViewModel.addCartItem(
                                                                                    cartItem);
                                                                                // _showSnackbar("Item Added!", true);
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

                                                            widget.allFrenchisiViewModel.itemsIds.contains(relitem.itemId)? Expanded(
                                                              child: InkWell(
                                                                  onTap: (){
                                                                    widget.allFrenchisiViewModel. items.forEach((element) {

                                                                      if(relitem.isDecimal==0) {
                                                                        if (element.itemId ==
                                                                            relitem.itemId) {
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


                                                                        String selected='100g';
                                                                        double selectedQuestity=0.10;

                                                                        scaffoldState.currentState.showBottomSheet((context) =>
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
                                                                                                    selectedQuestity=0.25;
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

                                                                                                  child: Text('1 kg',
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

                                                                                                            widget.  allFrenchisiViewModel.decreaseQuentityForDecimal(relitem.itemId,selectedQuestity);

                                                                                                          });
                                                                                                        },
                                                                                                        child: Image.asset(
                                                                                                          'images/minus_icn.png',
                                                                                                          width: 16,
                                                                                                          height: 16,)),
                                                                                                    SizedBox(width: 2,),
                                                                                                    Text("  ${ widget.allFrenchisiViewModel.itemsIds.contains(relitem.itemId)?
                                                                                                    widget. allFrenchisiViewModel.getQuantityData(selectedQuestity,relitem.itemId)??1:1} ",
                                                                                                    ),
                                                                                                    SizedBox(width: 2,),
                                                                                                    InkWell(
                                                                                                        onTap: () {
                                                                                                          setState(() {
                                                                                                            widget.   allFrenchisiViewModel.increseQuentityForDecimal(relitem.itemId,selectedQuestity);

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
                                                                                                  relitem.itemId, selectedQuestity, int.parse(widget.allFrenchisiViewModel.getQuantityData(selectedQuestity,relitem.itemId)),
                                                                                                  relitem.itemName,
                                                                                                  relitem.spRateAmt,
                                                                                                  relitem.itemUom);
                                                                                              widget.allFrenchisiViewModel.addCartItem(
                                                                                                  cartItem);

                                                                                              // _showSnackbar("Item Added!", true);
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
                                                                  child:relitem.isDecimal!=0?Container(): Image.asset('images/minus_icn.png',width: 16,height: 16,color: Colors.black,)),
                                                            ):Container(),

                                                            Padding(
                                                              padding: const EdgeInsets.only(left:8,right:8,top:2,bottom: 2),
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  Text(
                                                                    widget. allFrenchisiViewModel.itemsIds.contains(relitem.itemId)?relitem.isDecimal!=0?"Added":"${widget.allFrenchisiViewModel.getQuantity(relitem.itemId)}":"Add",style: Theme.of(context).textTheme.subtitle2.copyWith(color: Theme.of(context).primaryColor),),
                                                                  widget.allFrenchisiViewModel.itemsIds.contains(relitem.itemId)? Container():Padding(
                                                                    padding: const EdgeInsets.only(left:8.0),
                                                                    child: Image.asset('images/plus_icon.png',width: 12,height: 12,color: Colors.black,),
                                                                  ),

                                                                ],
                                                              ),
                                                            ),

                                                            widget.allFrenchisiViewModel.itemsIds.contains(relitem.itemId)?Expanded(
                                                              child: InkWell(
                                                                  onTap: () {
                                                                    if(relitem.isDecimal==0) {
                                                                      widget.allFrenchisiViewModel.items
                                                                          .forEach((element) {
                                                                        if (element.itemId ==
                                                                            relitem.itemId) {
                                                                          setState(() {
                                                                            element.qty++;
                                                                          });
                                                                        }
                                                                      });
                                                                    } else {
                                                                      String selected = '100g';
                                                                      double selectedQuestity = 0.10;

                                                                      scaffoldState.currentState
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
                                                                                                  '1 kg';
                                                                                                  selectedQuestity =
                                                                                                  1.0;
                                                                                                });
                                                                                              },
                                                                                              child: Container(

                                                                                                child: Text(
                                                                                                  '1 kg',
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
                                                                                                      color: Colors.grey),
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
                                                                                                          widget. allFrenchisiViewModel
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
                                                                                                        height: 16,color: Colors.black)),
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
                                                                                                    widget.allFrenchisiViewModel
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
                                                                                                          widget.  allFrenchisiViewModel
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
                                                                                                        height: 16,color: Colors.black)),


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
                                                                                                      widget.  allFrenchisiViewModel
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

                                                                                              // _showSnackbar(
                                                                                              //     "Item Added!",
                                                                                              //     true);
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
                                                                  child:relitem.isDecimal!=0?Container():Image.asset('images/plus_icon.png',width: 16,height: 16,color: Colors.black,)),
                                                            ):Container(),





                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),

                                                  Text(
                                                    relitem.isDecimal!=0?"Customizable":"",style: Theme.of(context).textTheme.caption.copyWith(color: Colors.orange),),

                                                ],
                                              )

                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ):Container(),

                                  // Container(
                                  //   child: Padding(
                                  //     padding: EdgeInsets.all(8.0),
                                  //     child: Row(
                                  //       mainAxisSize: MainAxisSize.min,
                                  //       crossAxisAlignment:  CrossAxisAlignment.center,
                                  //       children: <Widget>[
                                  //         Column(
                                  //           crossAxisAlignment: CrossAxisAlignment.start,
                                  //           mainAxisSize: MainAxisSize.min,
                                  //           children: <Widget>[
                                  //             Stack(
                                  //               children: <Widget>[
                                  //                 Container(
                                  //                   width: 100,
                                  //                   height: 100,
                                  //                   decoration: BoxDecoration(
                                  //                     image: DecorationImage(
                                  //                         image: AssetImage('images/loginbg.jpg'),
                                  //                         fit: BoxFit.cover),
                                  //                     borderRadius:
                                  //                     new BorderRadius.circular(10.0),
                                  //                   ),
                                  //                 ),
                                  //
                                  //                 Container(
                                  //                   alignment: Alignment.topLeft,
                                  //                   //padding: EdgeInsets.all(10),
                                  //                   margin: const EdgeInsets.all(8),
                                  //                   height: 20,
                                  //                   // width: 80,
                                  //                   child: Row(
                                  //                     mainAxisSize: MainAxisSize.min,
                                  //                     children: <Widget>[
                                  //                       Image.asset(
                                  //                         "images/veg_icn.png",
                                  //                         height: 10,
                                  //                         width: 10,
                                  //                       ),
                                  //                     ],
                                  //                   ),
                                  //                 ),
                                  //
                                  //
                                  //               ],
                                  //             ),
                                  //           ],
                                  //         ),
                                  //         Container(
                                  //           padding: EdgeInsets.symmetric(
                                  //               horizontal: 10.0, vertical: 10.0),
                                  //           child: new Column(
                                  //             mainAxisSize: MainAxisSize.min,
                                  //             mainAxisAlignment: MainAxisAlignment.start,
                                  //             crossAxisAlignment: CrossAxisAlignment.start,
                                  //             children: <Widget>[
                                  //
                                  //               Text(
                                  //                 "Veg Schezwan Noodles",
                                  //                 style: Theme.of(context).textTheme.subtitle1,
                                  //                 textAlign: TextAlign.start,
                                  //               ),
                                  //               SizedBox(
                                  //                 height: 4,
                                  //               ),
                                  //               Flexible(
                                  //                 child: Text(
                                  //                   "In Fried Rice and Noodles",
                                  //                   style: Theme.of(context).textTheme.bodyText2,
                                  //                   textAlign: TextAlign.start,
                                  //                   overflow: TextOverflow.ellipsis,
                                  //                 ),
                                  //               ),
                                  //
                                  //
                                  //               GestureDetector(
                                  //                 onTap: () {
                                  //                   // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                                  //                 },
                                  //                 child: Container(
                                  //                   decoration: BoxDecoration(
                                  //                     border: Border.all(
                                  //                       color: Colors.pink[100],
                                  //                       style: BorderStyle.solid,
                                  //                       width: 1.0,
                                  //                     ),
                                  //                     color:Theme.of(context).primaryColor.withOpacity(0.2),
                                  //                     borderRadius: BorderRadius.circular(4.0),
                                  //                   ),
                                  //                   child: Padding(
                                  //                     padding: const EdgeInsets.all(2.0),
                                  //                     child: Text(
                                  //                         "BEST SELLER",
                                  //                         style:Theme.of(context).textTheme.caption.copyWith(color:Colors.orange,fontSize: 10)),
                                  //                   ),
                                  //                 ),
                                  //               ),
                                  //
                                  //
                                  //
                                  //               new Row(
                                  //                 mainAxisSize: MainAxisSize.min,
                                  //                 children: <Widget>[
                                  //
                                  //                   Icon(Icons.star, color: Colors.yellow,size: 12,),
                                  //
                                  //                   SizedBox(
                                  //                     width: 4,
                                  //                   ),
                                  //
                                  //                   Icon(Icons.star, color: Colors.yellow,size: 12,),
                                  //
                                  //                   SizedBox(
                                  //                     width: 4,
                                  //                   ),
                                  //
                                  //                   Icon(Icons.star, color: Colors.yellow,size: 12,),
                                  //                   SizedBox(
                                  //                     width: 4,
                                  //                   ),
                                  //
                                  //                   Icon(Icons.star, color: Colors.yellow,size: 12,),
                                  //
                                  //                   SizedBox(
                                  //                     width: 4,
                                  //                   ),
                                  //
                                  //                   Icon(Icons.star, color: Colors.grey,size: 12,),
                                  //                   Text('170 Votes',style: Theme.of(context).textTheme.bodyText1,)
                                  //
                                  //                 ],
                                  //               ),
                                  //
                                  //               Text('Rs 170'),
                                  //
                                  //             ],
                                  //           ),
                                  //         ),
                                  //
                                  //         Container(
                                  //             padding: EdgeInsets.all(2),
                                  //             decoration: BoxDecoration(
                                  //                 border: Border.all(color: Colors.grey)
                                  //             ),
                                  //
                                  //             child: Row(
                                  //               mainAxisSize: MainAxisSize.min,
                                  //               children: [
                                  //
                                  //                 Icon(Icons.add,size: 16,),
                                  //                 SizedBox(width: 2,),
                                  //
                                  //                 Text("1",style: Theme.of(context).textTheme.caption.copyWith(color: Theme.of(context).primaryColor),),
                                  //                 SizedBox(width: 2,),
                                  //
                                  //                 Icon(Icons.linear_scale,size: 16,),
                                  //               ],
                                  //             )
                                  //         ),
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),

                                  SizedBox(height: 8,),

                                  Container(height: 1,
                                    color: Colors.grey[300],),
                                  SizedBox(height: 8,),


                                  Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                    //     Text('Rating and Review',style: Theme.of(context).textTheme.subtitle1,),
                                    //
                                    //     SizedBox(height: 8,),
                                    //     Row(
                                    //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    //       children: [
                                    //
                                    //   Text('5 star'),
                                    //   SizedBox(
                                    //     width: MediaQuery.of(context).size.width*.6,
                                    //     child: LinearProgressIndicator(
                                    //       value: 0.56,
                                    //       minHeight: 8,
                                    //       backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                                    //       valueColor: new AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                                    //
                                    //     ),
                                    //   ),
                                    //   Text('56%'),
                                    //
                                    // ],
                                    //     ),
                                    //
                                    //     SizedBox(height: 4,),
                                    //
                                    //     Row(
                                    //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    //
                                    //       children: [
                                    //
                                    //         Text('4 star'),
                                    //         SizedBox(
                                    //           width: MediaQuery.of(context).size.width*.6,
                                    //           child: LinearProgressIndicator(
                                    //             value: 0.23,
                                    //             minHeight: 8,
                                    //             backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                                    //             valueColor: new AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                                    //
                                    //           ),
                                    //         ),
                                    //         Text('23%'),
                                    //
                                    //       ],
                                    //     ),
                                    //
                                    //     SizedBox(height: 4,),
                                    //
                                    //
                                    //     Row(
                                    //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    //
                                    //       children: [
                                    //
                                    //         Text('3 star'),
                                    //         SizedBox(
                                    //           width: MediaQuery.of(context).size.width*.6,
                                    //           child: LinearProgressIndicator(
                                    //             value: 0.11,
                                    //             minHeight: 8,
                                    //             backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                                    //             valueColor: new AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                                    //           ),
                                    //         ),
                                    //         Text('11%'),
                                    //
                                    //       ],
                                    //     ),
                                    //
                                    //     SizedBox(height: 4,),
                                    //
                                    //
                                    //     Row(
                                    //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    //
                                    //       children: [
                                    //
                                    //         Text('2 star'),
                                    //         SizedBox(
                                    //           width: MediaQuery.of(context).size.width*.6,
                                    //           child: LinearProgressIndicator(
                                    //             value: 0.06,
                                    //             minHeight: 8,
                                    //             backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                                    //             valueColor: new AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                                    //           ),
                                    //         ),
                                    //         Text('6%'),
                                    //
                                    //       ],
                                    //     ),
                                    //
                                    //
                                    //     SizedBox(height: 4,),
                                    //
                                    //
                                    //     Row(
                                    //
                                    //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    //
                                    //       children: [
                                    //
                                    //         Text('1 star'),
                                    //         SizedBox(
                                    //           width: MediaQuery.of(context).size.width*.6,
                                    //           child: LinearProgressIndicator(
                                    //             value: 0.04,
                                    //             minHeight: 8,
                                    //             backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                                    //             valueColor: new AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                                    //           ),
                                    //         ),
                                    //         Text('4%'),
                                    //
                                    //       ],
                                    //     ),
                                    //
                                    //
                                    //     SizedBox(height: 8,),
                                    //
                                    //     Container(height: 1,
                                    //       color: Colors.grey[300],),
                                    //     SizedBox(height: 16,),




                                        Text('Rate The Product',style: Theme.of(context).textTheme.subtitle1.copyWith(fontFamily: 'Metropolis Semi Bold'),),
                                        SizedBox(height: 16,),

                                    Align(
                                      alignment: Alignment.center,
                                      child: SizedBox(
                                        width: MediaQuery.of(context).size.width*0.6,
                                        child: RatingBar(
                                          initialRating: rating,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 32,
                                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                          ratingWidget:RatingWidget(empty: Icon(Icons.star,color: Colors.grey,size: 16,),full:Icon(Icons.star,color: Colors.yellow.shade800,size: 16,), half: Icon(Icons.star,color: Colors.yellow.shade800,size: 16,)),
                                          onRatingUpdate: (rate) {
                                            setState(() {
                                              rating=rate;
                                            });
                                          },
                                        ),
                                      ),
                                    ),

                                        SizedBox(height: 16),

                                        TextFormField(
                                          maxLength: 100,
                                          maxLines: 3,
                                          controller: reviewController,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: 'Review',
                                            hintText: 'Enter your review',

                                          ),
                                        ),


                                        SizedBox(height: 16),

                                        Center(
                                          child: RaisedButton(
                                              child: Text('Submit',style: Theme.of(context).textTheme.button.copyWith(color: Colors.white),),
                                              color: Theme.of(context).primaryColor,
                                              onPressed: (){
                                              widget.allFrenchisiViewModel.productRatings('${widget.itemData.itemId}', rating, reviewController.text).then((value) =>
                                              {

                                                reviewController.text='',

                                              scaffoldState.currentState.showSnackBar(
                                              SnackBar(
                                              content: Text('Review Stored Successfully',style: TextStyle(color: Colors.white),),
                                              duration: Duration(seconds: 3),
                                              backgroundColor: Colors.green,
                                              )),

                                              });
                                              }

                                          ),
                                        ),

                                        SizedBox(height: 50,),


                                      ],
                                    ),
                                  )

                                ],
                              )
                          ),



                        ],
                      ),
                    ),
                  ),
                ),





                Positioned(
                  left: 5,
                  top: 5,
                  child: IconButton(icon: Icon(Icons.arrow_back_outlined,color: Colors.black,), onPressed: (){
                    Navigator.pop(context);
                  }),
                ),



                Positioned(
                  bottom: 0,
                  child: Observer(
                    builder:(_)=> Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
                      color: Theme.of(context).primaryColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Row(
                            children: [
                              Image.asset('images/rupees_icn.png',width: 16,height: 16,color: Colors.white,),
                              Text('${widget.itemData.spRateAmt}',style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.white)),
                            ],
                          ),

                          InkWell(
                            onTap: (){

                              if(widget.itemData.isDecimal!=0){
                                int quantity=1;
                                String selected='100g';
                                double selectedQuestity=0.10;

                                scaffoldState.currentState. showBottomSheet((context) =>
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
                                                          selectedQuestity=0.25;
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

                                                        child: Text('1 kg',
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
                                                          border: Border.all(color: Colors.grey),
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
                                                                height: 16,color: Colors.grey,)),
                                                          SizedBox(width: 2,),
                                                          Text("  ${ widget.allFrenchisiViewModel.itemsIds.contains(widget.itemData.itemId)?
                                                          widget.allFrenchisiViewModel.getQuantityData(selectedQuestity,widget.itemData.itemId)??quantity:quantity} ",
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
                                                                height: 16,color: Colors.grey)),


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

                                                    // _showSnackbar("Item Added!", true);

                                                    widget.allFrenchisiViewModel.setPage(1);
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
                              }else {
                                ItemData itemdata = widget.itemData;

                                if(!widget.allFrenchisiViewModel.itemsIds.contains(itemdata.itemId)){
                                widget.allFrenchisiViewModel.addCartItem(
                                    CartItem(
                                        itemdata.itemId,
                                        1.0,
                                        1,
                                        itemdata.itemName,
                                        itemdata.spRateAmt,
                                        itemdata.itemUom)
                                );


                              }
                            }},
                            child:  Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white)
                                ),
                                child:(!widget.allFrenchisiViewModel.itemsIds.contains(widget.itemData.itemId))? Text('Add to cart',style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.white))
                                    : Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [


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
                                            child: Image.asset('images/minus_icn.png',width: 16,height: 16,color: Colors.white,)):Container(),
                                        SizedBox(width: 4,),

                                        Padding(
                                          padding: const EdgeInsets.only(left:8,right:8),
                                          child: Row(
                                            children: [
                                              Text(
                                                widget. allFrenchisiViewModel.itemsIds.contains(widget.itemData.itemId)?"${widget.allFrenchisiViewModel.getQuantity(widget.itemData.itemId)}":"Add",style: Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.white),),
                                              widget.allFrenchisiViewModel.itemsIds.contains(widget.itemData.itemId)? Container():SizedBox(width: 4,),
                                              widget.allFrenchisiViewModel.itemsIds.contains(widget.itemData.itemId)? Container():Image.asset('images/plus_icon.png',width: 12,height: 12,color: Colors.black,),

                                            ],
                                          ),
                                        ),
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
                                      child: Image.asset('images/plus_icon.png',width: 16,height: 16,color: Colors.white,)):Container(),
                                      SizedBox(width: 4,),







                                      ],
                                      ),
                                      ),
                            ),




                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
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
