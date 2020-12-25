import 'dart:io';
import 'package:cashfree_pg/cashfree_pg.dart';
import 'package:cloud_kitchen/network/model/response/OfferList.dart';
import 'package:cloud_kitchen/ui/order/deliveryInstruction.dart';
import 'package:cloud_kitchen/ui/user/locationScreen.dart';
import 'package:cloud_kitchen/viewmodel/con/internet.dart';
import 'package:cloud_kitchen/viewmodel/franchisi/frviewmodel.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:date_time_picker/date_time_picker.dart';

class Cart extends StatefulWidget {
 final AllFrenchisiViewModel allFrenchisiViewModel;

  const Cart(this.allFrenchisiViewModel);


  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {

  bool isNetWorkAvailable=true;

  ReactionDisposer _disposer;
  ConnectivityStore connectivityStore=ConnectivityStore();
  @override
  void initState() {
    // TODO: implement initState

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

   widget.allFrenchisiViewModel.getOffersandAdditionalCharge();
   inAppReview = InAppReview.instance;


   WidgetsBinding.instance.addPostFrameCallback((_) {
     inAppReview
         .isAvailable()
         .then(
           (bool isAvailable) => setState(
             () =>    widget.allFrenchisiViewModel.isUpdateAvailable = isAvailable && Platform.isAndroid,
       ),
     )
         .catchError((error) => setState((){   widget.allFrenchisiViewModel.isUpdateAvailable = false;}));
   });

    super.initState();
  }
  final _textFieldController=TextEditingController();

  bool OffersOpen=false;
  bool isWalletBallenceSelected=false;
  bool isTwinWallet=false;

   InAppReview inAppReview ;
  double appliedDescunt=0;
  double appliedWalletAmount=0;
  String offerApplied='';
  String appliedCoupen="";
  bool isGstBill=false;
  String selecteddateTime='${DateTime.now().add(Duration(minutes: 40))}';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body:widget.allFrenchisiViewModel.items.isEmpty?
          Padding(
            padding: const EdgeInsets.only(left:24.0,right: 24),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Padding(
                  padding: const EdgeInsets.only(right:24.0),
                  child: Image.asset('images/cart.jpg',width: MediaQuery.of(context).size.width*.50,height: MediaQuery.of(context).size.width*.50),
                ),

                SizedBox(height: 8,width: 4,),
                Text('Your Cart Is Empty',style: Theme.of(context).textTheme.headline6.copyWith(fontFamily: 'Metropolis Semi Bold',), textAlign: TextAlign.center),
                SizedBox(height: 28,width: 4,),
                Padding(
                  padding: const EdgeInsets.only(left:24.0,right:24),
                  child: Text('Looks like you havn\'t added anything to your cart yet' ,style: Theme.of(context).textTheme.subtitle2,textAlign: TextAlign.center),
                ),
                SizedBox(height: 28,width: 4,),
                InkWell(
                  onTap: (){
                    widget.allFrenchisiViewModel.setPage(0);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        style: BorderStyle.solid,
                        width: 1.0,
                      ),
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(8.0),

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 28,width: 4,),
                        Expanded(
                          child: Text( "Browse Menu",textAlign: TextAlign.center,
                              style:Theme.of(context).textTheme.button.copyWith(fontWeight: FontWeight.normal).copyWith(color:Colors.white)),
                        )
                      ],
                    ),
                  ),
                )

              ],
            ),
          ): Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Observer(
                builder:(_)=> Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.greenAccent.withOpacity(0.17),
                      padding: EdgeInsets.all(16),
                      child: Row(

                        mainAxisAlignment:MainAxisAlignment.spaceBetween  ,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [


                       Row(
                         crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.check_circle,color: Theme.of(context).primaryColor,size: 32,),

                              SizedBox(width: 12,),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*.60,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Delivery at',style: Theme.of(context).textTheme.subtitle1.copyWith(fontFamily: 'Metropolis Semi Bold'),),
                                    // Text('${widget.allFrenchisiViewModel.isLoading?"":widget.allFrenchisiViewModel.custAdrressCaption}',style: Theme.of(context).textTheme.bodyText2),
                                     Text('${widget.allFrenchisiViewModel.isLoading?"":widget.allFrenchisiViewModel.custAdrress}',style: Theme.of(context).textTheme.caption),
                                  ],
                                ),
                              )
                            ],
                          ),

                          InkWell(

                            onTap: (){
                              openAddressedBottomSheet();
                            },

                              child: Text('Change',style: Theme.of(context).textTheme.caption.copyWith(fontFamily: 'Metropolis',fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,decoration: TextDecoration.underline,) ,))

                        ],
                      ),
                    ),
                     Observer(
                       builder: (_)=>   widget.allFrenchisiViewModel.items.isEmpty?Container():Container(
                        padding: EdgeInsets.all(16),
                        child:
                        ListView.separated(
                          scrollDirection: Axis.vertical,
                          separatorBuilder: (context, index) =>  Divider(
                            color: Colors.grey[300],
                          ),
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: widget.allFrenchisiViewModel.items.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset('images/veg_icn.png',width: 12,height: 12,),

                                      SizedBox(width: 24,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('${widget.allFrenchisiViewModel.items[index].name}[${widget.allFrenchisiViewModel.items[index].selectedQty} ${widget.allFrenchisiViewModel.items[index].itemUom}]',style: Theme.of(context).textTheme.bodyText1,)
                                          ,Row(
                                            children: [
                                              Image.asset('images/rupees_icn.png',width: 16,height: 16,),
                                              Text('${(widget.allFrenchisiViewModel.items[index].prize*widget.allFrenchisiViewModel.items[index].selectedQty).toStringAsFixed(2)} x ${widget.allFrenchisiViewModel.items[index].qty}',style: Theme.of(context).textTheme.bodyText2.copyWith( fontFamily: "Metropolis",),),
                                            ],
                                          )
                                        ],
                                      ),


                                    ],


                                  ),
                                 Container(
                                    padding: EdgeInsets.only(left:4,right:4,top: 4,bottom: 4),
                                   width: MediaQuery.of(context).size.width*.20,
                                   decoration: BoxDecoration(
                                     border: Border.all(color: Colors.grey),
                                     borderRadius:
                                     new BorderRadius.circular(4.0),
                                   ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [

                                        InkWell(
                                            onTap:(){
                                              setState(() {
                                                if(widget.allFrenchisiViewModel.items[index].qty>1) {
                                                  widget.allFrenchisiViewModel
                                                      .items[index].qty--;
                                                  applyDiscount();
                                                }else{
                                                  widget.allFrenchisiViewModel.removeItem(widget.allFrenchisiViewModel.items[index]);
                                                }
                                              });
                                            },
                                            child: Image.asset('images/minus_icn.png',width: 16,height: 16,color:Colors.black)),
                                        SizedBox(width: 2,),
                                        Text("  ${widget.allFrenchisiViewModel.items[index].qty}  ",),
                                        SizedBox(width: 2,),
                                        InkWell(
                                            onTap: (){
                                              setState(() {
                                                widget.allFrenchisiViewModel.items[index].qty++;
                                                applyDiscount();
                                              });
                                            },
                                            child: Image.asset('images/plus_icon.png',width: 16,height: 16,color:Colors.black)),

                                      ],
                                    ),
                                  )

                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    widget.allFrenchisiViewModel.frainchiseHomeData.franchise?.frName==null?Container():Container(
                      padding: EdgeInsets.only(left: 16,right: 16,top: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${widget.allFrenchisiViewModel.frainchiseHomeData.franchise?.frName??""}',style: Theme.of(context).textTheme.subtitle1.copyWith(fontFamily: 'Metropolis Semi Bold'),),
                          SizedBox(height: 4,),
                          Text('${widget.allFrenchisiViewModel.frainchiseHomeData.franchise?.frAddress??""}',style: Theme.of(context).textTheme.bodyText2,),
                        ],
                      ),
                    ),
                   // Text('Add Cooking Instructions [Optional]',style: Theme.of(context).textTheme.caption.copyWith(decoration: TextDecoration.underline),),
                    widget.allFrenchisiViewModel.isLoadingForOffers?LinearProgressIndicator(): widget.allFrenchisiViewModel.offersMain.offerList.isNotEmpty?    Observer(
                      builder:(_)=> AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        color: Colors.blue.withOpacity(0.08),
                        padding: EdgeInsets.only(left:16,right: 16,top: 8,bottom: 4),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [

                        Image.asset('images/offer_percentage.png',width: 16,height: 16,),

                      SizedBox(width: 4,),

                             Text('Offers',style: Theme.of(context).textTheme.subtitle1.copyWith(fontFamily: 'Metropolis Semi Bold'),),
                                      SizedBox(width: 16,),

                                      Column(
                                        children: [
                                          SizedBox(height: 3,),
                                          Text('Select Promo Code',style: Theme.of(context).textTheme.caption.copyWith(fontFamily: 'Metropolis'),),
                                        ],
                                      ),
                                    ],
                                  ),


                                ],
                              ),
                              ],
                            ),

                             widget.allFrenchisiViewModel.isLoadingForOffers?Container(child: LinearProgressIndicator(
                               valueColor:AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor) ,

                             ),) :Container(
                              child:

                              widget.allFrenchisiViewModel.offersMain.offerList.isNotEmpty? Column(
                                children: [
                                  SizedBox(height: 4,),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: 70,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: widget.allFrenchisiViewModel.offersMain.offerList.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          return Observer(
                                            builder:(_)=> InkWell(
                                              onTap: (){
                                                setState(() {
                                                  selectedOffer=widget.allFrenchisiViewModel.offersMain.offerList[index];
                                                  applyDiscount();
                                                });

                                              },
                                              child: Container(
                                                  margin: EdgeInsets.all(8),
                                                  padding: EdgeInsets.all(4),
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(8.0),
                                                      border: Border.all(color: Theme.of(context).primaryColor)
                                                  ),
                                                  child: Row(
                                                    children: [

                                                      Icon(Icons.local_offer_outlined,color: Theme.of(context).primaryColor,),
                                                      SizedBox(width: 8,),

                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Text('${widget.allFrenchisiViewModel.offersMain.offerList[index].offerName}', style: Theme.of(context).textTheme.bodyText1.copyWith(fontFamily: 'Metropolis',fontWeight: FontWeight.w600,color:Theme.of(context).primaryColor)),
                                                          SizedBox(height: 4,),
                                                          Text('${widget.allFrenchisiViewModel.offersMain.offerList[index].offerDetailList[0].discPer} % off upto ${widget.allFrenchisiViewModel.offersMain.offerList[index].offerDetailList[0].offerLimit}',style: Theme.of(context).textTheme.caption.copyWith(fontFamily: 'Metropolis')),
                                                        ],
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                          );
                                        }

                                    ),
                                  ),
                                ],
                              ):Container(),
                            )

                          ],
                        ),
                      ),
                    ):Container(),

                    widget.allFrenchisiViewModel.isLoadingForOffers?Container():
                      widget.allFrenchisiViewModel.offersMain.custWalletTotal.total==0?Container():
                    AnimatedContainer(
                      height: isWalletBallenceSelected?0:120,
                      duration:Duration(milliseconds: 500),
                      padding: EdgeInsets.only(left: 16,right:16,top: 8,bottom: 8),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color:getItemTotal()>= widget.allFrenchisiViewModel.offersMain.custWalletTotal.walletLimitRs? Colors.green:Theme.of(context).primaryColor,

                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text("Madhvi Credits Balance :",style: Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.white),),
                                  Image.asset('images/rupees_icn.png',width: 16,height: 16,color: Colors.white,),
                                  Text('${widget.allFrenchisiViewModel.offersMain.custWalletTotal.total}',style: Theme.of(context).textTheme.subtitle1.copyWith(color:Colors.white),),   ],
                              ),
                              FlatButton(
                                onPressed: (){
                                 if(getItemTotal()>= widget.allFrenchisiViewModel.offersMain.custWalletTotal.walletLimitRs){
                                  setState(() {
                                    isWalletBallenceSelected=true;
                                  });
                                 }
                                  Future.delayed(Duration(milliseconds: 500)).then((value) =>
                                  setState((){
                                    isTwinWallet=true;
                                  }),
                                  );
                                },
                               child: Container(
                                 padding: EdgeInsets.fromLTRB(12,4,12,4),
                                   decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(4),
                                       border: Border.all(color: Colors.white)
                                   ),
                                   child: Text( getItemTotal()>= widget.allFrenchisiViewModel.offersMain.custWalletTotal.walletLimitRs?"Apply":'Add ${getItemTotal()- widget.allFrenchisiViewModel.offersMain.custWalletTotal.walletLimitRs} More',style: Theme.of(context).textTheme.bodyText1.copyWith(color:Colors.white))),
                              )
                            ],
                          ),
                          Text('Note - Madhvi credit amount will be applicable only when order amount is greater than Rs.${widget.allFrenchisiViewModel.offersMain.custWalletTotal.walletLimitRs}/-',style: Theme.of(context).textTheme.caption.copyWith(color: Colors.white),)
                        ],
                      ),
                    ),


                    Observer(
                      builder:(_)=> Container(
                        padding: EdgeInsets.only(top:8,left: 16,right: 16),
                        child: Column(
                          children: [
                            Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Items Total',style: Theme.of(context).textTheme.caption,),
                              Row(
                                children: [
                                   Image.asset('images/rupees_icn.png',width: 16,height: 16,),
                                  Text('${getItemTotal().toStringAsFixed(2)}',style: Theme.of(context).textTheme.caption,),
                                ],
                              )
                            ],
                          ),


                            // SizedBox(height: 12,),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Text('Delivery Charge',style: Theme.of(context).textTheme.caption,),
                            //     Row(
                            //       children: [
                            //         Image.asset('images/rupees_icn.png',width: 16,height: 16,),
                            //         Text('${widget.allFrenchisiViewModel.isLoadingForOffers?0:getDeliverCharges()}' ,style: Theme.of(context).textTheme.caption,),
                            //       ],
                            //     )
                            //   ],
                            // ),

                            SizedBox(height: 4,),
                            (!widget.allFrenchisiViewModel.isLoadingForOffers && getDeliverCharges()!=0)?  Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text('Additional Charges',style: Theme.of(context).textTheme.caption,),SizedBox(width: 4,),
                                    getDeliverCharges()==0?Container():     InkWell(
                                    onTap: (){
                                      showDialog(context: context,
                                        child: AlertDialog(
                                          title: new Text("Additional Charges",style: Theme.of(context).textTheme.subtitle1,),
                                          contentPadding: EdgeInsets.only(left:24,right: 16,top: 4,bottom: 4),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children:widget.allFrenchisiViewModel.selectedDelMode==1?0:getAdditionalCharges()
                                          ),
                                          actions: [
                                            FlatButton(onPressed: (){

                                              Navigator.pop(context);
                                            }, child: Text("Ok")),

                                          ],
                                        ),
                                      );
                                    },
                                     child: Icon(Icons.info_outline,size: 16,)

                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset('images/rupees_icn.png',width: 16,height: 16,),
                                    Text('${widget.allFrenchisiViewModel.isLoadingForOffers?0:widget.allFrenchisiViewModel.selectedDelMode==1?0:getDeliverCharges()}' ,style: Theme.of(context).textTheme.caption,),
                                  ],
                                )
                              ],
                            ):Container(),

                          ]
                        ),
                      ),
                    ),
                    appliedDescunt==0?Container(): Container(
                      padding: EdgeInsets.only(left:16,right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text('Discount',style: Theme.of(context).textTheme.caption,),
                                 SizedBox(width: 8,),
                                  Text('($offerApplied)',style: Theme.of(context).textTheme.caption),
                                ],
                              ),

                              Row(
                                children: [
                                  Image.asset('images/rupees_icn.png',width: 16,height: 16,),
                                  Text('- ${appliedDescunt}',style: Theme.of(context).textTheme.subtitle2,),

                                ],
                              ),


                            ],
                          ),

                        ],
                      ),
                    ),

                    (!widget.allFrenchisiViewModel.isLoadingForOffers  && isTwinWallet)?  Padding(
                      padding: const EdgeInsets.only(left:16,right:16,top: 4,bottom: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text('Madhvi Credit Amount',style: Theme.of(context).textTheme.caption,),SizedBox(width: 4,),
                              getDeliverCharges()==0?Container():     InkWell(
                                  onTap: (){
                                  },
                                  child: Icon(Icons.info_outline,size: 16,)

                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text('-' ,style: Theme.of(context).textTheme.caption,),
                              Image.asset('images/rupees_icn.png',width: 16,height: 16,),
                              Text('${widget.allFrenchisiViewModel.isLoadingForOffers?0:getWalletAmount()}' ,style: Theme.of(context).textTheme.caption,),
                            ],
                          )
                        ],
                      ),
                    ):Container(),

                    SizedBox(height: 8,),

                    Container(
                      padding: EdgeInsets.only(left:16,right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Grand Total',style: Theme.of(context).textTheme.subtitle2.copyWith(fontFamily: 'Metropolis Semi Bold'),),
                          Row(
                            children: [
                              Image.asset('images/rupees_icn.png',width: 16,height: 16,),
                              Text('${getGrandTotal().toStringAsFixed(2)}',style: Theme.of(context).textTheme.subtitle2.copyWith(fontFamily: 'Metropolis Semi Bold'),),
                            ],
                          ),


                        ],
                      ),
                    ),

                    SizedBox(height: 8,),
                    Padding(
                      padding: const EdgeInsets.only(left:16.0,right:16),
                      child:  Divider(
                        color: Colors.grey[300],
                        height: 1,
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left:16.0,right:16,top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Order Mode',style: Theme.of(context).textTheme.caption,),
                            Text('${widget.allFrenchisiViewModel.selectedDelMode==1?'Take Away':"Home Delivery"}' ,style: Theme.of(context).textTheme.caption,),

                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 4,),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left:16.0,right:16),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width*6,
                          child: DateTimePicker(
                            type: DateTimePickerType.dateTime,
                            use24HourFormat: false,
                            decoration:  InputDecoration(
                              prefixIcon: Icon(Icons.calendar_today),
                              labelText: 'Schedule Delivery'
                              ),
                            initialValue: '${DateTime.now().add(Duration(minutes: 40))}',
                            firstDate: DateTime.now().add(Duration(minutes: 40)),
                            lastDate: DateTime.now().add(Duration(days: 8)),
                            dateLabelText: 'Schedule Delivery',
                            style: Theme.of(context).textTheme.caption,
                            onChanged: (val) {
                              selecteddateTime=val;
                            },
                            validator: (val) {
                              print(val);
                              return null;
                            },
                            onSaved: (val) => print(val),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8,),
                    Container(
                      color: Colors.white,
                      padding:  EdgeInsets.only(left:16,right:16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Payment Modes",style: Theme.of(context).textTheme.caption,),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              Row(
                                children: [

                                  Radio(
                                    value:  selectedPayMode,
                                    groupValue: 1,
                                    activeColor: Theme.of(context).primaryColor,
                                  onChanged: (flag){
                                        setState(() {
                                          selectedPayMode=1;
                                        });
                                      },
                                    toggleable: true,
                                  ),

                                  Text('Cash on Delivery',style: Theme.of(context).textTheme.caption ,),

                                ],
                              ),


                              Row(
                                children: [

                                  Radio(
                                    value:  selectedPayMode,
                                    groupValue: 2,
                                    activeColor: Theme.of(context).primaryColor,
                                    onChanged: (flag){
                                      setState(() {
                                        selectedPayMode=2;
                                      });
                                    },
                                    toggleable: true,

                                  ),

                                  Text('Pay Online',style: Theme.of(context).textTheme.caption ,),

                                ],
                              ),


                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      padding:  EdgeInsets.only(left:16,right:16),
                      child: Column(
                        children: [

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Business Invoice',style: Theme.of(context).textTheme.caption,),
                              Switch.adaptive(

                                onChanged: (vl){
                                setState(() {
                                  isGstBill=!isGstBill;
                                });
                                },

                                activeColor: Theme.of(context).primaryColor,
                                value: isGstBill,
                              ),
                            ],
                          ),

                          isGstBill?
                          TextField(
                            textAlign: TextAlign.start,

                            keyboardType: TextInputType.streetAddress,
                            maxLength: 15,
                            controller: _textFieldController,
                            decoration: new InputDecoration(
                              hintText: "Enter GST Number",
                              labelText: 'GST Number',

                              prefixIcon: Icon(Icons.money),
                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(2.0),
                                ),
                                borderSide: new BorderSide(
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                              ),
                            ),
                          )

                          // TextField(
                          //   onChanged: (value) {
                          //
                          //   },
                          //   maxLength: 15,
                          //   controller: _textFieldController,
                          //   keyboardType: TextInputType.name,
                          //
                          //   decoration: InputDecoration(hintText: "Enter GST Number",
                          //  isDense: true,
                          //
                          //   labelText: 'GST Number',
                          //   border: OutlineInputBorder()
                          //   ),
                          // )

                              :Container(),
                        ],
                      ),
                    ),

                    Observer(
                      builder:(_)=> Container(
                        color: Colors.white,
                        padding: EdgeInsets.only(left:16,right:16,top:8,bottom:8),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Delivery Instructions',style: Theme.of(context).textTheme.caption.copyWith(letterSpacing: 2),),

                                InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> DeliveryInstruction(allFrenchisiViewModel: widget.allFrenchisiViewModel,)));

                                    },
                                    child: Text('Change',style: Theme.of(context).textTheme.button.copyWith(color: Theme.of(context).primaryColor),)),


                              ],
                            ),

                            Row(
                              children: [

                                Icon(Icons.check_circle,color: Theme.of(context).primaryColor,size: 16,),
                              SizedBox(width: 8,)
                              , Text('${widget.allFrenchisiViewModel.deliveryInstruction.instructnCaption??""} ${widget.allFrenchisiViewModel.valueC?"\n Don't ring the bell":""}',style: Theme.of(context).textTheme.caption.copyWith(color: Colors.black),overflow: TextOverflow.ellipsis),

                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 60,),

                  ],
                ),
              ),
            ),
            ),

            Positioned(
              bottom: 0,
              child: Observer(
                builder:(_)=> Column(
                  children: [

                    widget.allFrenchisiViewModel.isPlaceingOrder?SizedBox(

                      child: LinearProgressIndicator(
                        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.5),
                        valueColor:AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor) ,

                      ),
                      height: 4,
                      width: MediaQuery.of(context).size.width,
                    ):Container(),

                    Container(
                      // margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                      height: 50.0,
                      padding: EdgeInsets.all(6),
                      width: MediaQuery.of(context).size.width,
                      color:  widget.allFrenchisiViewModel.items.isNotEmpty?  widget.allFrenchisiViewModel.cartValueMin?Colors.grey: Theme.of(context).primaryColor:Colors.grey,
                      child: InkWell(

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset('images/rupees_icn.png',width: 16,height: 16,color: Colors.white,),
                                Text('${getGrandTotal()}',style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.white),),
                              ],
                            ),

                            Row(
                              children: [
                                Text("Proceed To Checkout",style: Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.white),),
                                SizedBox(width: 8,),
                                Icon(Icons.arrow_forward,color: Colors.white,)
                              ],
                            ),

                          ],
                        ),

                        onTap: () {

                          if(isNetWorkAvailable){

                            if(!widget.allFrenchisiViewModel.isPlaceingOrder) {
                              if (widget.allFrenchisiViewModel.items
                                  .isNotEmpty) {
                                if (!widget.allFrenchisiViewModel
                                    .cartValueMin) {
                                  String gst = isGstBill
                                      ? (_textFieldController
                                      .text == "" ? widget.allFrenchisiViewModel
                                      .gstNo() : _textFieldController.text)
                                      : "";

                                  setState(() {
                                    widget.allFrenchisiViewModel.setCartValue(true) ;
                                    widget.allFrenchisiViewModel
                                        .isPlaceingOrder = true;
                                  });


                                  widget.allFrenchisiViewModel.placeOrder
                                    (
                                      getItemTotal(),
                                      selectedPayMode,
                                      0,
                                      getDeliverCharges(),
                                      appliedDescunt,
                                      selecteddateTime,
                                      gst).then((value) {
                                    if (value.status == 200) {
                                      Scaffold.of(context).showSnackBar(
                                          SnackBar(
                                              backgroundColor: Colors.green,
                                              content: Text(
                                                  "Order Placed Successfully")));

                                      print('${widget.allFrenchisiViewModel
                                          .placeOrderModel.payMode}');


                                      if (widget.allFrenchisiViewModel
                                          .placeOrderModel
                                          .payMode == 2) {
                                        _doPayment();
                                      } else {
                                        // Scaffold.of(context).showSnackBar(SnackBar(content: Text("Oredr Successfull"))),
                                        widget.allFrenchisiViewModel.emtyCart();
                                        widget.allFrenchisiViewModel.setPage(0);

                                        // Navigator.pushReplacementNamed(context,'/home'),}
                                      }
                                    }
                                  });
                                } else {
                                  Scaffold.of(context).showSnackBar(
                                      SnackBar(backgroundColor: Colors.red,
                                          content: Text(
                                              "Minimum order amount should be ${widget
                                                  .allFrenchisiViewModel
                                                  .offersMain.deliveryCharges
                                                  .minAmt}/-")));
                                }
                              }
                            }else{
                              Scaffold.of(context).showSnackBar(
                                  SnackBar(backgroundColor: Colors.red,content: Text("Please wait while placing order")));

                            }
                        }else{
                      Scaffold.of(context).showSnackBar(
                      SnackBar(backgroundColor: Colors.red,content: Text("Network not available")));

                      }},
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),

      ),

    );
  }

  bool blockOrder=true;
  int selectedPayMode=1;




  double getDeliverCharges(){
   if(widget.allFrenchisiViewModel.isLoadingForOffers){
     return 0.0;
   }else{

     print(widget.allFrenchisiViewModel.offersMain.additionalCharges.toJson());

     double amount=widget.allFrenchisiViewModel.offersMain.additionalCharges.handlingChg

     +widget.allFrenchisiViewModel.offersMain.additionalCharges.packingChg

     +widget.allFrenchisiViewModel.offersMain.additionalCharges.surchargeFee
     +widget.allFrenchisiViewModel.offersMain.additionalCharges.extraChg
     +widget.allFrenchisiViewModel.offersMain.additionalCharges.roundOffAmt;

     print('*********$amount********');

    if(( widget.allFrenchisiViewModel.offersMain.deliveryCharges.minAmt??0)<=getItemTotal()
        &&(widget.allFrenchisiViewModel.offersMain.deliveryCharges.freeDelvLimit??9999)>=getItemTotal()){
      print('if less${widget.allFrenchisiViewModel.offersMain.deliveryCharges.amt1+amount}');

      return (widget.allFrenchisiViewModel.offersMain.deliveryCharges.amt1+amount);
    }else if((widget.allFrenchisiViewModel.offersMain.deliveryCharges.freeDelvLimit??9999)<getItemTotal()){
      print(' if more${widget.allFrenchisiViewModel.offersMain.deliveryCharges.amt2+amount}');
      return (widget.allFrenchisiViewModel.offersMain.deliveryCharges.amt2+amount);
    }

   }
   return 0.0;

  }


  void onPaymentFailed(){
    showDialog(context: context,
        child: AlertDialog(
          title: new Text("Order Status"),
          content: Text('Your order place successfully but online payment failed please try again '),
         actions: [
           FlatButton(onPressed: (){
             _doPayment();
             Navigator.pop(context);
           }, child: Text("Retry")),
           FlatButton(onPressed: (){
             // initiateHelpCall();

             widget.allFrenchisiViewModel.postPaymentService(
             widget.allFrenchisiViewModel.placeOrderModel.uuidNo, "1",
    "0", '').then((value){
               widget.allFrenchisiViewModel.emtyCart();
               widget.allFrenchisiViewModel.setPage(0);


               widget.allFrenchisiViewModel.emtyCart();
                 widget.allFrenchisiViewModel.setPage(0);
               Navigator.pop(context);

             }).catchError((onError){
               Navigator.pop(context);
             });

    }, child: Text("COD")),
         ],
        ),
    );

  }



  List<Widget> getAdditionalCharges(){
    List<Widget> list=[];


    double diliveryCharges=0.0;
    double amount=widget.allFrenchisiViewModel.offersMain.additionalCharges.handlingChg

        +widget.allFrenchisiViewModel.offersMain.additionalCharges.packingChg

        +widget.allFrenchisiViewModel.offersMain.additionalCharges.surchargeFee
        +widget.allFrenchisiViewModel.offersMain.additionalCharges.extraChg
        +widget.allFrenchisiViewModel.offersMain.additionalCharges.roundOffAmt;


    if(( widget.allFrenchisiViewModel.offersMain.deliveryCharges.minAmt??0)<=getItemTotal()
        &&(widget.allFrenchisiViewModel.offersMain.deliveryCharges.freeDelvLimit??9999)>=getItemTotal()){
      diliveryCharges= widget.allFrenchisiViewModel.offersMain.deliveryCharges.amt1??0+amount;
    }else if((widget.allFrenchisiViewModel.offersMain.deliveryCharges.freeDelvLimit??9999)<getItemTotal()){
      diliveryCharges= widget.allFrenchisiViewModel.offersMain.deliveryCharges.amt2??0+amount;
    }



    if(diliveryCharges!=0){
      list.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Delivery Charge",style: Theme.of(context).textTheme.caption),
              Row(
                children: [
                  Image.asset('images/rupees_icn.png',width: 16,height: 16,),
                  Text('${diliveryCharges}' ,style: Theme.of(context).textTheme.caption,),

                ],
              )
            ],
          )
      );
    }


    if(widget.allFrenchisiViewModel.offersMain.additionalCharges.handlingChg!=0){
      list.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Handling Charge",style: Theme.of(context).textTheme.caption),
              Row(
                children: [
                  Image.asset('images/rupees_icn.png',width: 16,height: 16,),
                  Text('${widget.allFrenchisiViewModel.offersMain.additionalCharges.handlingChg}' ,style: Theme.of(context).textTheme.caption,),

                ],
              )
            ],
          )
      );
    }

    if(widget.allFrenchisiViewModel.offersMain.additionalCharges.packingChg!=0){
      list.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Packaging Charge",style: Theme.of(context).textTheme.caption),
              Row(
                children: [
                  Image.asset('images/rupees_icn.png',width: 16,height: 16,),
                  Text('${widget.allFrenchisiViewModel.offersMain.additionalCharges.packingChg}' ,style: Theme.of(context).textTheme.caption,),

                ],
              )
            ],
          )
      );
    }


    if(widget.allFrenchisiViewModel.offersMain.additionalCharges.surchargeFee!=0){
      list.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Surcharge",style: Theme.of(context).textTheme.caption),
              Row(
                children: [
                  Image.asset('images/rupees_icn.png',width: 16,height: 16,),
                  Text('${widget.allFrenchisiViewModel.offersMain.additionalCharges.surchargeFee}' ,style: Theme.of(context).textTheme.caption,),

                ],
              )
            ],
          )
      );
    }


    if(widget.allFrenchisiViewModel.offersMain.additionalCharges.extraChg!=0){
      list.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Extra Charge",style: Theme.of(context).textTheme.caption),
              Row(
                children: [
                  Image.asset('images/rupees_icn.png',width: 16,height: 16,),
                  Text('${widget.allFrenchisiViewModel.offersMain.additionalCharges.extraChg}' ,style: Theme.of(context).textTheme.caption,),

                ],
              )
            ],
          )
      );
    }


    if(widget.allFrenchisiViewModel.offersMain.additionalCharges.roundOffAmt!=0){
      list.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Round Off Charge",style: Theme.of(context).textTheme.caption),
              Row(
                children: [
                  Image.asset('images/rupees_icn.png',width: 16,height: 16,),
                  Text('${widget.allFrenchisiViewModel.offersMain.additionalCharges.roundOffAmt}' ,style: Theme.of(context).textTheme.caption,),

                ],
              )
            ],
          )
      );
    }

   return list;

  }

  void initiateHelpCall(){
   launch('tel:8260060046');

  }


  double getWalletAmount(){
  double walletAmount=  widget.allFrenchisiViewModel.offersMain.custWalletTotal.total;
  double walletMinAmount=  widget.allFrenchisiViewModel.offersMain.custWalletTotal.walletMinAmt;

     if((double.parse(((getItemTotal()+ (widget.allFrenchisiViewModel.selectedDelMode==1?0: widget.allFrenchisiViewModel.isLoadingForOffers?0:getDeliverCharges()))-appliedDescunt).toStringAsFixed(2)))>=widget.allFrenchisiViewModel.offersMain.custWalletTotal.walletLimitRs){

       double percentageAmount=getGrandTotal()*(widget.allFrenchisiViewModel.offersMain.custWalletTotal.walletPercent/100);

       if(percentageAmount<=walletMinAmount){
         if(walletMinAmount>walletAmount){
           appliedWalletAmount=walletAmount;
           return walletAmount;
         }else{
           appliedWalletAmount= walletMinAmount;
           return walletMinAmount;
         }
       }else{
         if(walletMinAmount>walletAmount){
           appliedWalletAmount= walletAmount;
           return walletAmount;
         }else{
           appliedWalletAmount= walletMinAmount;
           return walletMinAmount;
         }
       }
     }else{
       appliedWalletAmount= 0;
       return 0;
     }



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
                      .height*.7,
                  padding: EdgeInsets.all(16),


                  child: Observer(
                    builder:(_)=>

                        Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                      width: MediaQuery.of(context).size.width,
                                      child: Text('If you change your current address cart will be empty.',style: Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.red),)),

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
                                    height: MediaQuery.of(context).size.height*.25,
                                    child: ListView.separated(
                                        itemCount:  widget.allFrenchisiViewModel.adressesMain.addressList.length,
                                        separatorBuilder: (context, index) => Divider(
                                          color: Colors.grey[300],
                                          height: 1,
                                        ),
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            onTap: (){

                                              widget.allFrenchisiViewModel.emtyCart();
                                              widget.allFrenchisiViewModel.changeDefAddress(widget.allFrenchisiViewModel.adressesMain.addressList[index]);
                                              Navigator.pop(context);
                                              Navigator.pushReplacementNamed(context,'/home');

                                            },
                                            title: Text(widget.allFrenchisiViewModel
                                                .adressesMain
                                                .addressList[index]
                                                .addressCaption,style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.w500),softWrap: true,overflow: TextOverflow.fade,),

                                            subtitle: Text(widget.allFrenchisiViewModel
                                                .adressesMain
                                                .addressList[index]
                                                .landmark,style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.grey)),

                                            leading:  getLogo(widget.allFrenchisiViewModel
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




  void _doPayment() {

    Map<String, dynamic> inputParams = {
      "orderId": widget.allFrenchisiViewModel.placeOrderModel.uuidNo,
      "orderAmount": getGrandTotal(),
      "customerName": widget.allFrenchisiViewModel.getCustName(),
      "orderCurrency": "INR",
      "color1":'#FFFFFF',
      "appId": '7233535973c0dcc4f58af274653327',
      "customerPhone": widget.allFrenchisiViewModel.getCustMobile(),
      "customerEmail": 'madhviweb@gmail.com',
     "stage" : "PROD",
      "tokenData":widget.allFrenchisiViewModel.placeOrderModel.paymentResponse.cftoken,

    };


    try {
      CashfreePGSDK.doPayment(inputParams)
          .then((value) =>
          value?.forEach((key, value) {
            print("-------$key : $value");
            //Do something with the result
            if (key == "txStatus") {
              if (value == 'SUCCESS') {


                Scaffold.of(context).showSnackBar(
                    SnackBar(backgroundColor: Colors.green,content: Text("Order Successful")));
                widget.allFrenchisiViewModel.postPaymentService(
                    widget.allFrenchisiViewModel.placeOrderModel.uuidNo, "1",
                    "1", value).then((value){

                    widget.allFrenchisiViewModel.emtyCart();
                    widget.allFrenchisiViewModel.setPage(0);


                }


                );
              } else {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(backgroundColor: Colors.red,content: Text("Payment failed")));
                onPaymentFailed();

                // });
              }
            }
          })
      ).catchError((onError) {
        onPaymentFailed();
      });
    }catch(error){
      onPaymentFailed();
    }
  }
  double getItemTotal(){

    double prise=0;
    widget.allFrenchisiViewModel.items.forEach((element) {
      prise=(element.qty*  (element.prize*element.selectedQty))+prise;
    });

    if(!widget.allFrenchisiViewModel.isLoadingForOffers) {
      if (prise >=
          widget.allFrenchisiViewModel.offersMain.deliveryCharges?.minAmt ??
          0) {
        widget.allFrenchisiViewModel.setCartValue(false);
      } else {
        widget.allFrenchisiViewModel.setCartValue(true);
      }
    }else{
      widget.allFrenchisiViewModel.setCartValue(true);
    }
   return prise;
  }


  OfferList selectedOffer;

  // Future<String> fetchUserOrder() {
  //   Future.delayed(Duration(milliseconds: 3000), () {
  //
  //     Navigator.pushReplacementNamed(context, '/home');
  //
  //
  //     return 'Large Latte';
  //   }
  //   );
  // }

 void applyDiscount() {

    double calculateDiscount=0.0;



    if(selectedOffer!=null) {
      if (getItemTotal() != 0.0) {
        calculateDiscount =
        (getItemTotal() * (selectedOffer.offerDetailList[0].discPer/100));

        if (calculateDiscount <= selectedOffer.offerDetailList[0].offerLimit) {

          setState(() {
            offerApplied = selectedOffer.offerName;
            appliedDescunt =double.parse(calculateDiscount.toStringAsFixed(2)) ;
            appliedCoupen = selectedOffer.offerDetailList[0].couponCode;

          });

        } else {

          setState(() {
            appliedCoupen = selectedOffer.offerDetailList[0].couponCode;
            appliedDescunt = selectedOffer.offerDetailList[0].offerLimit;

          });

        }
      } else {
        appliedDescunt = 0.0;
      }
    }else{
      appliedDescunt=0.0;
    }

  }




  double getGrandTotal(){



    if(getItemTotal()+getDeliverCharges()==0){
      appliedDescunt=0;
      return 0;
    }

    return double.parse(((getItemTotal()+ (widget.allFrenchisiViewModel.selectedDelMode==1?0: widget.allFrenchisiViewModel.isLoadingForOffers?0:getDeliverCharges()))-appliedDescunt-(isTwinWallet?appliedWalletAmount:0)).toStringAsFixed(2));
  }


}
