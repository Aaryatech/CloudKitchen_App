import 'package:cashfree_pg/cashfree_pg.dart';
import 'package:cloud_kitchen/network/model/httpresponce.dart';
import 'package:cloud_kitchen/network/model/response/OfferList.dart';
import 'package:cloud_kitchen/network/model/response/placeorder/placeordermain.dart';
import 'package:cloud_kitchen/ui/AddressBook.dart';
import 'package:cloud_kitchen/ui/deliveryInstruction.dart';
import 'package:cloud_kitchen/ui/locationScreen.dart';
import 'package:cloud_kitchen/viewmodel/franchisi/frviewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Cart extends StatefulWidget {
 final AllFrenchisiViewModel allFrenchisiViewModel;

  const Cart(this.allFrenchisiViewModel);


  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {

  @override
  void initState() {
    // TODO: implement initState
   widget.allFrenchisiViewModel.getOffersandAdditionalCharge();
    super.initState();
  }


  bool OffersOpen=false;


  double appliedDescunt=0;
  String offerApplied='';
  String appliedCoupen="";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
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
                                Text('Delivery at',style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold),),
                                Text('${widget.allFrenchisiViewModel.isLoading?"":widget.allFrenchisiViewModel.custAdrressCaption}',style: Theme.of(context).textTheme.bodyText2),
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

                          child: Text('Change',style: Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,decoration: TextDecoration.underline,) ,))

                    ],
                  ),
                ),


                Observer(
                   builder: (_)=> Container(
                    padding: EdgeInsets.all(16),
                    child:
                    ListView.separated(
                      scrollDirection: Axis.vertical,
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.black45,
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
                                  Image.asset('images/veg_icn.png',width: 16,height: 16,),

                                  SizedBox(width: 24,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('${widget.allFrenchisiViewModel.items[index].name}[${widget.allFrenchisiViewModel.items[index].selectedQty} ${widget.allFrenchisiViewModel.items[index].itemUom}]',style: Theme.of(context).textTheme.subtitle1,)
                                      ,Row(
                                        children: [
                                          Image.asset('images/rupees_icn.png',width: 16,height: 16,),
                                          Text('${widget.allFrenchisiViewModel.items[index].prize*widget.allFrenchisiViewModel.items[index].selectedQty} x ${widget.allFrenchisiViewModel.items[index].qty}',style: Theme.of(context).textTheme.caption,),
                                        ],
                                      )
                                    ],
                                  ),


                                ],


                              ),
                              Container(
                                padding: EdgeInsets.only(left:4,right:4,top: 4,bottom: 4),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Theme.of(context).primaryColor),
                                      shape: BoxShape.rectangle,
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(8))
                                  ),
                        child: Row(
                                  children: [

                                    InkWell(
                                        onTap:(){
                                          setState(() {
                                            if(widget.allFrenchisiViewModel.items[index].qty>1) {
                                              widget.allFrenchisiViewModel
                                                  .items[index].qty--;
                                            }else{
                                              widget.allFrenchisiViewModel.removeItem(widget.allFrenchisiViewModel.items[index]);
                                            }
                                          });
                                        },
                                        child: Image.asset('images/minus_icn.png',width: 16,height: 16,)),
                                    SizedBox(width: 2,),
                                    Text("  ${widget.allFrenchisiViewModel.items[index].qty}  ",),
                                    SizedBox(width: 2,),
                                    InkWell(
                                        onTap: (){
                                          setState(() {
                                            widget.allFrenchisiViewModel.items[index].qty++;

                                          });

                                        },
                                        child: Image.asset('images/plus_icon.png',width: 16,height: 16,)),



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

                Text('Add Cooking Instructions [Optional]',style: Theme.of(context).textTheme.caption.copyWith(decoration: TextDecoration.underline),),

                SizedBox(height: 16,),
                Observer(
                  builder:(_)=> AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    color: Colors.blue.withOpacity(0.1),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Offers',style: Theme.of(context).textTheme.headline6,),
                              Row(
                                children: [
                                  Icon(Icons.local_offer_outlined),
                                  SizedBox(width: 12,),
                                  Text('Select Promo Code',style: Theme.of(context).textTheme.caption,),
                                ],
                              ),

                            ],
                          ),
                          ],
                        ),

                         widget.allFrenchisiViewModel.isLoadingForOffers?Container(child: LinearProgressIndicator(),) :Container(
                          child:

                          widget.allFrenchisiViewModel.offersMain.offerList.isNotEmpty? Column(
                            children: [
                              SizedBox(height: 16,),
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


                                            applyDiscount(widget.allFrenchisiViewModel.offersMain.offerList[index]);
                                          },
                                          child: Container(
                                              margin: EdgeInsets.all(4),
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                  border: Border.all(color: Colors.grey)
                                              ),
                                              child: Row(
                                                children: [

                                                  Icon(Icons.local_offer_outlined,color: Theme.of(context).primaryColor,),
                                                  SizedBox(width: 8,),

                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text('${widget.allFrenchisiViewModel.offersMain.offerList[index].offerName}', style: Theme.of(context).textTheme.headline6.copyWith()),
                                                      Text('${widget.allFrenchisiViewModel.offersMain.offerList[index].offerDetailList[0].discPer} % off ', style: TextStyle()),
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
                ),



                Observer(
                  builder:(_)=> Container(
                    padding: EdgeInsets.only(top:16,left: 16,right: 16),
                    child: Column(
                      children: [
                        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Item Total',style: Theme.of(context).textTheme.caption,),
                          Row(
                            children: [
                               Image.asset('images/rupees_icn.png',width: 16,height: 16,),
                              Text('${getItemTotal()}',style: Theme.of(context).textTheme.caption,),
                            ],
                          )
                        ],
                      ),

                        SizedBox(height: 12,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Additional Charge',style: Theme.of(context).textTheme.caption,),
                            Row(
                              children: [
                                Image.asset('images/rupees_icn.png',width: 16,height: 16,),
                                Text('${widget.allFrenchisiViewModel.isLoadingForOffers?0:getDeliverCharges()}' ,style: Theme.of(context).textTheme.caption,),
                              ],
                            )
                          ],
                        ),
                      ]
                    ),
                  ),
                ),


                appliedDescunt==0?Container(): Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Discount',style: Theme.of(context).textTheme.subtitle2,),
                          Row(
                            children: [
                              Image.asset('images/rupees_icn.png',width: 16,height: 16,),
                              Text('- ${appliedDescunt}',style: Theme.of(context).textTheme.subtitle2,),

                            ],
                          ),


                        ],
                      ),
                      Text(offerApplied),
                    ],
                  ),
                ),




                Container(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Grand Total',style: Theme.of(context).textTheme.subtitle2,),
                      Row(
                        children: [
                          Image.asset('images/rupees_icn.png',width: 16,height: 16,),
                          Text('${getGrandTotal()}',style: Theme.of(context).textTheme.subtitle2,),
                        ],
                      ),


                    ],
                  ),
                ),

                Container(
                  color: Colors.grey[100],
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Payment Modes",style: Theme.of(context).textTheme.subtitle2,),
                      RadioListTile(
                        title: Text("Cash on Delivery"),
                        dense: true,
                        value:  selectedPayMode,
                        groupValue: 1,
                        activeColor: Theme.of(context).primaryColor,
                        onChanged: (flag){
                          setState(() {

                            selectedPayMode=1;
                          });
                        },
                        toggleable: true,
                        selected: selectedPayMode==1,
                      ),

                      RadioListTile(
                        title: Text("Pay Online"),
                        dense: true,
                        toggleable: true,

                        onChanged: (flag){
                          setState(() {
                            selectedPayMode=2;
                          });
                        },
                        activeColor: Theme.of(context).primaryColor,
                       selected: selectedPayMode==2,
                        value:  selectedPayMode,
                        groupValue: 2,
                      ),

                    ],
                  ),
                ),

                Container(
                  color: Colors.grey[100],
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Delivery Instructions',style: Theme.of(context).textTheme.caption.copyWith(letterSpacing: 2),),

                          InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> DeliveryInstruction()));

                              },
                              child: Text('CHANGE',style: Theme.of(context).textTheme.button.copyWith(color: Theme.of(context).primaryColor),)),


                        ],
                      ),

                      Row(
                        children: [

                          Icon(Icons.check_circle,color: Theme.of(context).primaryColor,size: 16,),
                        SizedBox(width: 8,)
                        ,  Text('Hand me the order',style: Theme.of(context).textTheme.caption.copyWith(color: Colors.black),),

                        ],
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                  //height: 50.0,
                  child: GestureDetector(
                    onTap: () {

                      widget.allFrenchisiViewModel.placeOrder
                        (getItemTotal(), selectedPayMode,  0,getDeliverCharges(), 0).then((value) => {

                          if(value.status==200){

                            if(   widget.allFrenchisiViewModel.placeOrderModel.payMode==2){
                              _doPayment(),
                            }else{
                               Scaffold.of(context).showSnackBar(SnackBar(content: Text("Oredr Successfull"))),
                               widget.allFrenchisiViewModel.emtyCart(),
                               Navigator.pushReplacementNamed(context,'/home'),}
                              }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          style: BorderStyle.solid,
                          width: 1.0,
                        ),
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            widget.allFrenchisiViewModel.isPlaceingOrder?LinearProgressIndicator():Container(),
                            Row(

                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Container(),
                                Center(
                                  child: Text(
                                      "Checkout",
                                      style:Theme.of(context).textTheme.button.copyWith(color:Colors.white)),

                                ),
                                Align(

                                    alignment: Alignment.centerRight,
                                    child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,))


                              ],
                            ),
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
      ),

    );
  }

  bool blockOrder=true;
  int selectedPayMode=2;

  double getDeliverCharges(){
   if(widget.allFrenchisiViewModel.isLoadingForOffers){
     return 0.0;
   }else{

     double amount=widget.allFrenchisiViewModel.offersMain.additionalCharges.handlingChg

     +widget.allFrenchisiViewModel.offersMain.additionalCharges.packingChg

     +widget.allFrenchisiViewModel.offersMain.additionalCharges.surchargeFee
     +widget.allFrenchisiViewModel.offersMain.additionalCharges.extraChg
     +widget.allFrenchisiViewModel.offersMain.additionalCharges.roundOffAmt;


    if(( widget.allFrenchisiViewModel.offersMain.deliveryCharges.minAmt??0)<=getItemTotal()
        &&(widget.allFrenchisiViewModel.offersMain.deliveryCharges.freeDelvLimit??9999)>=getItemTotal()){
      return widget.allFrenchisiViewModel.offersMain.deliveryCharges.amt1??0+amount;
    }else if((widget.allFrenchisiViewModel.offersMain.deliveryCharges.freeDelvLimit??9999)<getItemTotal()){
      return widget.allFrenchisiViewModel.offersMain.deliveryCharges.amt2??0+amount;
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
           }, child: Text("Retry")),
           FlatButton(onPressed: (){
             initiateHelpCall();

           }, child: Text("Help")),
         ],

              ),


    );

  }


  void initiateHelpCall(){

  }

  void openAddressedBottomSheet(){
    widget.allFrenchisiViewModel.getAddress();
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        enableDrag: true,
        builder: (BuildContext bc){
          return StatefulBuilder(
              builder: (context, setState) {

                return Container(
                  color: Colors.white.withOpacity(0.5),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height*.45,
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.only(top: 24),

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

                                  SizedBox(height: 8,),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width*.8,
                                      child: Text('If you change your current address cart will be empty.',style: Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.red),)),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Text('Available Addresses',style: Theme.of(context).textTheme.subtitle2,),
                                      InkWell(

                                          onTap: (){
                                            Navigator.pop(context);
                                          },
                                          child: Icon(Icons.close))
                                    ],
                                  ),

                                  SizedBox(height: 8,),

                                  widget.allFrenchisiViewModel.isAddressLoading?Container( height: 2, child: LinearProgressIndicator()):

                                  SizedBox(
                                    height: MediaQuery.of(context).size.height*.25,
                                    child: ListView.separated(
                                        itemCount:  widget.allFrenchisiViewModel.adressesMain.addressList.length,
                                        separatorBuilder: (context, index) => Divider(
                                          color: Colors.black,
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




  void _doPayment() {

    Map<String, dynamic> inputParams = {
      "orderId": widget.allFrenchisiViewModel.placeOrderModel.uuidNo,
      "orderAmount": getItemTotal()+getDeliverCharges(),
      "customerName": widget.allFrenchisiViewModel.getCustName(),
      "orderNote": "Madhvi",
      "orderCurrency": "INR",
      "appId": '2800447959f7f92f77608613b40082',
      "customerPhone": widget.allFrenchisiViewModel.getCustMobile(),
      "customerEmail": 'thoratsagar87@gmail.com',
     "stage" : "TEST",
      "tokenData":widget.allFrenchisiViewModel.placeOrderModel.paymentResponse.cftoken,
      "notifyUrl":"https://test.gocashfree.com/notify"
    };


    CashfreePGSDK.doPayment(inputParams)
        .then((value) => value?.forEach((key, value) {
      print("-------$key : $value");
      //Do something with the result
      if(key=="txStatus"){
        if(value=='SUCCESS'){

          Scaffold.of(context).showSnackBar(SnackBar(content: Text("Oredr Successfull")));
          widget.allFrenchisiViewModel.postPaymentService(widget.allFrenchisiViewModel.placeOrderModel.uuidNo, "1", "1", value).then((value){

              widget.allFrenchisiViewModel.emtyCart();
              Navigator.pushReplacementNamed(context,'/home');}
          );
        }else{
          Scaffold.of(context).showSnackBar(SnackBar(content: Text("Payment faild")));
          widget.allFrenchisiViewModel.postPaymentService(widget.allFrenchisiViewModel.placeOrderModel.uuidNo, "1", "2", value).then((value) {
            // widget.allFrenchisiViewModel.emtyCart();

            onPaymentFailed();

      });
          }
        }

    }));
  }
  double getItemTotal(){
    double prise=0;
    widget.allFrenchisiViewModel.items.forEach((element) {
      prise=(element.qty*element.prize)+prise;
    });
return prise;
  }

  void applyDiscount(OfferList offerList) {
    double calculateDiscount=0.0;
    calculateDiscount=(getItemTotal()*offerList.offerDetailList[0].discPer)/100;

    if(calculateDiscount<getItemTotal()*offerList.offerDetailList[0].offerLimit){
      setState(() {
        offerApplied=offerList.offerName;
        appliedDescunt=calculateDiscount;
        appliedCoupen=offerList.offerDetailList[0].couponCode;
      });
    }else{

      setState(() {
        appliedCoupen=offerList.offerDetailList[0].couponCode;
        appliedDescunt=getItemTotal()*offerList.offerDetailList[0].offerLimit;

      });

    }




  }


  double getGrandTotal(){
    return getItemTotal()+getDeliverCharges()-appliedDescunt;
  }


}
