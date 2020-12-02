
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
          Card(child: Image.network('${imageUrl}${element.imageName}',fit: BoxFit.contain,))
      );
    });

    return widgets;
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldState,
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [


              SingleChildScrollView(
                child: Observer(
                  builder:(_)=> Container(

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [


                        new Positioned(
                          top: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: AppBar(
                            title: Text(''),// You can add title here
                            leading: new IconButton(
                              icon: new Icon(Icons.arrow_back_outlined, color: Colors.white),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                            backgroundColor: Colors.redAccent, //You can make this transparent
                          ),),


                        widget.itemData.imageList.isNotEmpty?        SizedBox(
                          height: 250,
                          child: PageView(

                            children: getSliderImages(),
                          ),
                        ):Container(),




                        Container(
                          padding: EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(4),
                                    padding: EdgeInsets.all(4),
                                    color:widget.itemData.rating>=1 ?Theme.of(context).primaryColor:Colors.grey,
                                    child: Icon(Icons.star,color: Colors.white,size: 16,),
                                  ),

                                  Container(
                                    margin: EdgeInsets.all(4),
                                    padding: EdgeInsets.all(4),
                                    color:widget.itemData.rating>=2 ?Theme.of(context).primaryColor:Colors.grey,
                                    child: Icon(Icons.star,color: Colors.white,size: 16,),
                                  ),

                                  Container(
                                    margin: EdgeInsets.all(4),
                                    padding: EdgeInsets.all(4),
                                    color:widget.itemData.rating>=3 ?Theme.of(context).primaryColor:Colors.grey,
                                    child: Icon(Icons.star,color: Colors.white,size: 16,),
                                  ),

                                  Container(
                                    margin: EdgeInsets.all(4),
                                    padding: EdgeInsets.all(4),
                                    color:widget.itemData.rating>=4 ?Theme.of(context).primaryColor:Colors.grey,
                                    child: Icon(Icons.star,color: Colors.white,size: 16,),
                                  ),

                                  Container(
                                    margin: EdgeInsets.all(4),
                                    padding: EdgeInsets.all(4),
                                    color:widget.itemData.rating>=5 ?Theme.of(context).primaryColor:Colors.grey,
                                    child: Icon(Icons.star,color: Colors.white,size: 16,),
                                  ),

                                  SizedBox(width: 8,),
                                  Text('${widget.itemData.rating}',style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold),)
                                ],
                              ),

                              Row(children: [
                                Text("${widget.itemData.spRateAmt}",style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold,color: Colors.redAccent),),
                                SizedBox(width: 4,),
                                Text("${widget.itemData.rateAmt}",style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold,color: Colors.grey,decoration: TextDecoration.lineThrough),),
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
                            Text('${widget.itemData.itemName}',style: Theme.of(context).textTheme.headline6,),
                             Text('${widget.itemData.itemDesc}',style: Theme.of(context).textTheme.subtitle2,),
                             Text('${widget.itemData.tasteName} - ${widget.itemData.tagName}',style: Theme.of(context).textTheme.caption,),

                          ],
                        )),

                          Container(
                            padding: EdgeInsets.only(left: 16,right: 16,top: 16),
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


                               /* ListView.separated(
                                  shrinkWrap: true,
                                  separatorBuilder: (context, index) => Divider(
                                    color: Colors.black,
                                  ),
                                  physics: ScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemCount: widget.itemData.relItemList.length,
                                  itemBuilder: (_, int index) {
                                    RelItemList relitem=widget.itemData.relItemList[index];
                                    return    Container(
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:  CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                Stack(
                                                  children: <Widget>[
                                                    Container(
                                                      width: 100,
                                                      height: 100,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          // image: NetworkImage('${imageUrl}${widget.itemData.imageList[0].}'),
                                                            image: AssetImage('images/loginbg.jpg'),
                                                            fit: BoxFit.cover),
                                                        borderRadius:
                                                        new BorderRadius.circular(4.0),
                                                      ),
                                                    ),

                                                    Container(
                                                      alignment: Alignment.topLeft,
                                                      //padding: EdgeInsets.all(10),
                                                      margin: const EdgeInsets.all(8),
                                                      height: 20,
                                                      // width: 80,
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: <Widget>[
                                                          Image.asset(
                                                            "images/veg_icn.png",
                                                            height: 10,
                                                            width: 10,
                                                          ),
                                                        ],
                                                      ),
                                                    ),


                                                  ],
                                                ),
                                              ],
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10.0, vertical: 10.0),
                                              child: new Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[

                                                  SizedBox(
                                                    width: MediaQuery.of(context).size.width*.40,
                                                    child: Text(
                                                      relitem.itemName,
                                                      style: Theme.of(context).textTheme.subtitle1,
                                                      textAlign: TextAlign.start,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  SizedBox(
                                                    width: MediaQuery.of(context).size.width*.40,
                                                    child: Text(
                                                      relitem.itemDesc,
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
                                                            relitem.productStatus,
                                                            style:Theme.of(context).textTheme.caption.copyWith(color:Colors.white,fontSize: 10)),
                                                      ),
                                                    ),
                                                  ),


                                                  new Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: <Widget>[

                                                      Icon(Icons.star, color:relitem.rating>=1?Colors.yellow:Colors.grey,size: 12,),

                                                      SizedBox(
                                                        width: 4,
                                                      ),

                                                      Icon(Icons.star, color:relitem.rating>=2?Colors.yellow:Colors.grey,size: 12,),

                                                      SizedBox(
                                                        width: 4,
                                                      ),

                                                      Icon(Icons.star, color: relitem.rating>=3?Colors.yellow:Colors.grey,size: 12,),
                                                      SizedBox(
                                                        width: 4,
                                                      ),

                                                      Icon(Icons.star, color: relitem.rating>=4?Colors.yellow:Colors.grey,size: 12,),

                                                      SizedBox(
                                                        width: 4,
                                                      ),

                                                      Icon(Icons.star, color: relitem.rating>=5?Colors.yellow:Colors.grey,size: 12,),

                                                    ],
                                                  ),

                                                  Row(
                                                    children: [
                                                      Image.asset('images/rupees_icn.png',width: 16,height: 16,),
                                                      Text('${relitem.spRateAmt}'),
                                                    ],
                                                  ),

                                                ],
                                              ),
                                            ),

                                            Column(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(4),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(color: Colors.grey),
                                                    borderRadius:
                                                    new BorderRadius.circular(8.0),
                                                  ),

                                                  child:
                                                  InkWell(

                                                    onTap: (){
                                                      if(relitem.isDecimal==1) {
                                                        if(!widget. allFrenchisiViewModel.itemsIds.contains(widget.itemData.itemId)) {
                                                          CartItem cartItem = CartItem(
                                                              relitem.itemId, 1, 1,
                                                              relitem.itemName,
                                                              relitem.spRateAmt,
                                                              relitem.itemUom
                                                          );
                                                          widget.allFrenchisiViewModel.addCartItem(
                                                              cartItem);
                                                          _showSnackbar("Item Added!", true);

                                                        }

                                                      }
                                                      else{

                                                        int quantity=1;
                                                        String selected='250g';
                                                        double selectedQuestity=0.25;
                                                        Scaffold.of(context).
                                                        showBottomSheet((context) =>
                                                            StatefulBuilder(
                                                                builder: (BuildContext context, StateSetter setState *//*You can rename this!*//*) {
                                                                  return
                                                                  Container(
                                                                    height: 185,
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
                                                                              padding: EdgeInsets.only(left:4,right:4),
                                                                              decoration: BoxDecoration(
                                                                                  border: Border.all(color: Theme.of(context).primaryColor),
                                                                                  shape: BoxShape.rectangle,
                                                                                  color: Colors.white,
                                                                                  borderRadius: BorderRadius.all(Radius.circular(8))

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
                                                                                  Text("  ${ widget.allFrenchisiViewModel.itemsIds.contains(relitem.itemId)?
                                                                                  widget.allFrenchisiViewModel.getQuantityData(selectedQuestity,relitem.itemId)??quantity:quantity} ",
                                                                                    style: TextStyle(
                                                                                        backgroundColor: Theme
                                                                                            .of(context)
                                                                                            .primaryColor
                                                                                            .withOpacity(
                                                                                            0.3)),),
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
                                                                                relitem.itemId, selectedQuestity, quantity,
                                                                                relitem.itemName,
                                                                                relitem.spRateAmt,
                                                                                relitem.itemUom);
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
                                                        crossAxisAlignment: CrossAxisAlignment.start,
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

                                                          Text(
                                                            widget. allFrenchisiViewModel.itemsIds.contains(widget.itemData.itemId)?"${widget.allFrenchisiViewModel.getQuantity(widget.itemData.itemId)}":"Add",style: Theme.of(context).textTheme.subtitle2.copyWith(color: Theme.of(context).primaryColor),),


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
                                    );
                                  },
                                ),
*/
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
                                      Text('Rating and Review',style: Theme.of(context).textTheme.subtitle1,),

                                      SizedBox(height: 8,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [

                                    Text('5 star'),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width*.6,
                                      child: LinearProgressIndicator(
                                        value: 0.56,
                                        minHeight: 8,
                                        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                                        valueColor: new AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),

                                      ),
                                    ),
                                    Text('56%'),

                                  ],
                                      ),

                                      SizedBox(height: 4,),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,

                                        children: [

                                          Text('4 star'),
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width*.6,
                                            child: LinearProgressIndicator(
                                              value: 0.23,
                                              minHeight: 8,
                                              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                                              valueColor: new AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),

                                            ),
                                          ),
                                          Text('23%'),

                                        ],
                                      ),

                                      SizedBox(height: 4,),


                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,

                                        children: [

                                          Text('3 star'),
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width*.6,
                                            child: LinearProgressIndicator(
                                              value: 0.11,
                                              minHeight: 8,
                                              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                                              valueColor: new AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                                            ),
                                          ),
                                          Text('11%'),

                                        ],
                                      ),

                                      SizedBox(height: 4,),


                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,

                                        children: [

                                          Text('2 star'),
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width*.6,
                                            child: LinearProgressIndicator(
                                              value: 0.06,
                                              minHeight: 8,
                                              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                                              valueColor: new AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                                            ),
                                          ),
                                          Text('6%'),

                                        ],
                                      ),


                                      SizedBox(height: 4,),


                                      Row(

                                        mainAxisAlignment: MainAxisAlignment.spaceAround,

                                        children: [

                                          Text('1 star'),
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width*.6,
                                            child: LinearProgressIndicator(
                                              value: 0.04,
                                              minHeight: 8,
                                              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                                              valueColor: new AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                                            ),
                                          ),
                                          Text('4%'),

                                        ],
                                      ),


                                      SizedBox(height: 8,),

                                      Container(height: 1,
                                        color: Colors.grey[300],),
                                      SizedBox(height: 16,),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Rate The Product',style: Theme.of(context).textTheme.subtitle1),
                                          Text('Top Rated',style: Theme.of(context).textTheme.caption.copyWith(color: Theme.of(context).primaryColor),),
                                        ],),



                                      SizedBox(height: 16,),

                                  Align(
                                    alignment: Alignment.center,
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width*0.6,
                                      child: RatingBar(
                                        initialRating: 3,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 32,
                                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                        ratingWidget:RatingWidget(empty: Icon(Icons.star,color: Colors.grey,size: 16,),full:Icon(Icons.star,color: Colors.amber,size: 16,)),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                    ),
                                  ),

                                      SizedBox(height: 16),

                                      Center(
                                        child: RaisedButton(
                                            child: Text('SUBMIT'),
                                            onPressed: (){}

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
                bottom: 1,
                child: Observer(
                  builder:(_)=> Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(left: 16,right: 16),
                    color: Theme.of(context).primaryColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Row(
                          children: [
                            Text('1 Item',style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.white),),
                            Container(height: 20,
                              margin: EdgeInsets.only(left: 8,right: 8),
                              color: Colors.blueGrey,
                              width: 1,
                            ),
                            Row(
                              children: [
                                Image.asset('images/rupees_icn.png',width: 16,height: 16,color: Colors.white,),
                                Text('${widget.itemData.spRateAmt}',style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.white)),
                              ],
                            ),
                            // Text('${widget.itemData.spRateAmt}',style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.white)),

                          ],
                        ),

                        InkWell(
                          onTap: (){

                            if(widget.itemData.isDecimal!=0){
                              int quantity=1;
                              String selected='250g';
                              double selectedQuestity=0.25;

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
                                    child: Image.asset('images/minus_icn.png',width: 16,height: 16,color: Colors.white,)):Container(),
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
