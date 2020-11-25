

import 'dart:convert';

import 'package:cloud_kitchen/local/prefs.dart';
import 'package:cloud_kitchen/network/model/httpresponce.dart';
import 'package:cloud_kitchen/network/model/request/PlaceOrder/OrderDetailList.dart';
import 'package:cloud_kitchen/network/model/request/PlaceOrder/PlaceOrder.dart';
import 'package:cloud_kitchen/network/model/request/purchase/cartitem.dart';
import 'package:cloud_kitchen/network/model/response/AddressBookModel.dart';
import 'package:cloud_kitchen/network/model/response/CustomerAddress.dart';
import 'package:cloud_kitchen/network/model/response/DeliveryInstruction.dart';
import 'package:cloud_kitchen/network/model/response/Franchise.dart';
import 'package:cloud_kitchen/network/model/response/FranchiseId.dart';
import 'package:cloud_kitchen/network/model/response/ItemData.dart';
import 'package:cloud_kitchen/network/model/response/OrderHistory.dart';
import 'package:cloud_kitchen/network/model/response/distancematrics/distancematricsone.dart';
import 'package:cloud_kitchen/network/model/response/franchiseMain.dart';
import 'package:cloud_kitchen/network/model/response/franchiseoffers/offersmain.dart';
import 'package:cloud_kitchen/network/model/response/placeorder/placeordermain.dart';
import 'package:cloud_kitchen/network/repository/additionalcharges/additionalchargesRepo.dart';
import 'package:cloud_kitchen/network/repository/allFranchiseRepo.dart';
import 'package:cloud_kitchen/network/repository/customerAddressRepo.dart';
import 'package:cloud_kitchen/network/repository/distancematrixrepo.dart';
import 'package:cloud_kitchen/network/repository/order/orderrepo.dart';
import 'package:cloud_kitchen/network/repository/orderHistoryRepo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
part 'frviewmodel.g.dart';


class AllFrenchisiViewModel = _AllFrenchisiViewModel with _$AllFrenchisiViewModel;


abstract class _AllFrenchisiViewModel with Store {


  OrderHistoryRepo orderHistoryRepo;
  AllFranchiseRepo allFranchiseRepo;
  MyLocalPrefes myLocalPrefes;
  DistancematrixRepo distancematrixRepo;
  CustomerAddressRepo customerAddressRepo;
  AdditionalChargesAndOffersRepo additionalChargesAndOffersRepo;


  @observable
  List<CartItem> items = [];

  @observable
  String selectedAddress = '';


  @observable
  List<ItemData> filterList = [];


  @observable
  bool isSerching = false;


  @observable
  bool isAddressLoading = false;


  @observable
  DeliveryInstruction deliveryInstruction = DeliveryInstruction(
    instruId: 1,
    instructnCaption: 'Leave outside my door (contact-less delivery)'
  );


  @observable
  bool isPlaceingOrder = false;


  @observable
  bool iPaymetnLading = false;


  @observable
  bool isChagesdataAvailable = false;

  @observable
  CustomerAddressMain adressesMain;


  @observable
 int selectedOutlet = 1;


  @observable
  int selectedDelMode = 2;


  @observable
  int currentIndex = 0;

  @observable
  List<int> itemsIds = [];


  @observable
  bool isLoading = false;

  @observable
  bool isLoadingForHistory = true;


  @observable
  bool isNoDataAvailable = false;


  @observable
  bool isLoadingForFranchiseData = true;


  @observable
  bool isLoadingForOffers = true;

  @observable
  bool initiatePayment = false;

  @observable
  PlaceOrderModel placeOrderModel;


 @observable
 OrderHistory  orderHistory;


 @observable
 Frainchise  selectedFranchise;


  @observable
  String loadingMessage = '';


  @observable
  int outletType = 1;


  @observable
  List<Frainchise> frainchise;

  @observable
  FranchiseId frainchiseHomeData;


  @observable
  DistanceMatrix distanceMatrix;


  @observable
  FranchiseMain frainchiseMain;

  @observable
  String error;

  @observable
  String custAdrress="";


  @observable
  String custName;

  @observable
  String custAdrressCaption="";

  @observable
  OffersMain offersMain;


  @observable
  String searchString='';

  List<String> selected;


  @action
  Future searchList(String seacrh) {
    searchString=seacrh;
    List<ItemData> tempItems = [];
    if (seacrh
        .trim()
        .isEmpty || seacrh.trim() == "") {
      isSerching = false;
    } else {
      if (!(isLoading && isLoadingForFranchiseData)) {
        frainchiseHomeData.itemData.forEach((element) {
          if (element.itemName.toLowerCase().contains(seacrh.toLowerCase())) {
            tempItems.add(element);
          }
        }
        );
        filterList = tempItems;
        isSerching = true;
      }
    }
  }


  @action
  setDeliveryInstruction(DeliveryInstruction deliveryInstructiona){
    deliveryInstruction=deliveryInstructiona;
  }

  OrderRepo orderRepo;

  _AllFrenchisiViewModel() {
    allFranchiseRepo = AllFranchiseRepo();
    distancematrixRepo = DistancematrixRepo();
    orderRepo = OrderRepo();
    myLocalPrefes = MyLocalPrefes();
    orderHistoryRepo=OrderHistoryRepo();
    customerAddressRepo = CustomerAddressRepo();
    additionalChargesAndOffersRepo = AdditionalChargesAndOffersRepo();
  }



  void setPage(int){
    currentIndex=int;
  }


  Future<bool> addAllItemsInCart(OrderHistoryItem orderHistoryItem){
   final future =Future((){

     List<CartItem> tempItems=[];
     List<int> tempIds=[];

     orderHistoryItem.detailList.forEach((element) {

       tempIds.add(element.orderId);
       tempItems.add(
           CartItem(
               element.itemId,
               element.exFloat2,
               element.exInt1,
               element.itemName,
               element.mrp,
               "${element.exVar1}"));

     });

     items=tempItems;
     itemsIds=tempIds;
     return true;
   });
  }

  Future<String> fetchUserOrder() {
    Future.delayed(Duration(milliseconds: 1000), () {

          getCustAddress();
          getCustAddressCaption();
          getSelectedOutlet();
          getSelectedDelMode();
          getCustName();
          getCustMobile();
          // outletType=myLocalPrefes.getSelectedOutletType();

           return 'Large Latte';
          }
    );
  }


 @action getSelectedOutlet(){
    outletType=myLocalPrefes.getSelectedOutletType();
  }


   @action getSelectedDelMode(){
    selectedDelMode=myLocalPrefes.getDefType();
  }

   @action setDelMode(int mode){
    selectedDelMode=mode;
    myLocalPrefes.setDefType(mode);
  }






  setOutletType(int type)async{
    await myLocalPrefes.setSelectedOutletType(type);
    outletType=type;
  }



  @action
  setDefAddress(String adress,String caption){
    custAdrress=adress;
    custAdrressCaption=caption;
    myLocalPrefes.setSelectedAddress(adress);
    myLocalPrefes.setSelectedAddressCaption(caption);
  }


  @action
  changeDefAddress(CustomerAddress customerAddress) async{
    custAdrress=customerAddress.landmark;
    custAdrressCaption=customerAddress.addressCaption;
    await myLocalPrefes.setdefFranchiseDairy(0);
    await myLocalPrefes.setSelectedAddress(custAdrress);
    await myLocalPrefes.setSelectedAddressCaption(custAdrressCaption);
    await myLocalPrefes.setAddressId(customerAddress.custAddressId);
    await myLocalPrefes.setUserLatitude(customerAddress.latitude);
    await myLocalPrefes.setUserLongitude(customerAddress.longitude);
    await myLocalPrefes.setDefFranchiseRest(0);


    getAllFranchise();
  }



  DateTime currentDateTime = DateTime.now();

  @action
 Future<HttpResponse> placeOrder(double itemTotal,int payMode,int offerId,double deliveryCharges,double descAmt,String dateTime)async{
    int id=0;
    if(myLocalPrefes.getSelectedOutletType()==1){
      id=myLocalPrefes.getdefFranchiseDairy();
    }else{
      id=myLocalPrefes.getDefFranchiseRest();
    }

    print('${dateTime.trim().split(' ')[1].substring(0,7)} -- ${dateTime.trim().split(' ')[0]}');


    isPlaceingOrder=true;
    List<OrderDetailList> orderDetailedList=[];
    items.forEach((element) {
      orderDetailedList.add(OrderDetailList(
        itemId: element.itemId,
        qty: element.qty,
        selectedQty: element.selectedQty
      ));
    });


  PlaceOrder placeOrder=  PlaceOrder(
      orderDetailParamList: orderDetailedList,
          addressId: myLocalPrefes.getAddressId(), //,
          applicableFor: 2,
          custId: myLocalPrefes.getCustId(),
          deliveryCharges: deliveryCharges,
          discAmt: descAmt??0,
          itemTotal: itemTotal,
          deliveryDate: '${dateTime.trim().split(' ')[0]}',
          deliveryTime: '${dateTime.trim().split(' ')[1].substring(0,7)}',
          frId:id,
          wallet: 0,
          deliveryInstructionId: deliveryInstruction.instruId,
          deliveryInstructionText: deliveryInstruction.instructnCaption,
          deliveryType: selectedDelMode,
          km: 5,
          offerId: offerId,
          orderPlatform: 2,
          orderStatus:1,
          payMode: payMode,);

  HttpResponse httpResponse = await orderRepo.placeOredr(placeOrder);
    isPlaceingOrder=false;
   if(httpResponse.status==200){
   placeOrderModel = httpResponse.data;
   initiatePayment=true;

   }
    return httpResponse;
  }


  @action
  addCartItem(CartItem item){
    // getOffersandAdditionalCharge();
    List<int> tempitemsids=itemsIds;
    List<CartItem> tempitems=items;
    tempitemsids.add(item.itemId);
    tempitems.add(item);
    itemsIds=tempitemsids;
    items=tempitems;
  }

  @action
  emtyCart(){
    itemsIds=[];
    items=[];
  }

  @action
  String getQuantityData(double decimal,int itemIdcurrent){
    String qty=null;
    items.forEach((element) {
      if(element.itemId==itemIdcurrent && element.selectedQty==decimal){
        qty= '${element.qty}';
      }
    });
    return qty;
  }


  @action
  String getQuantity(int itemIdcurrent){
    String qty='1';
    items.forEach((element) {
      if(element.itemId==itemIdcurrent){
        qty= '${element.qty}';
      }
    });

    return qty;
  }


  @action
  removeItem(CartItem item){
    // getOffersandAdditionalCharge();
    List<CartItem> tempList=items;
    List<int> tampitemsIds=itemsIds;
    tempList.remove(item);
    tampitemsIds.remove(item.itemId);
    items=tempList;
    tampitemsIds=                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    itemsIds;
  }


  @action
  String increseQuentity(int itemIdcurrent){
    // getOffersandAdditionalCharge();

    items.forEach((element) {
      if(element.itemId==itemIdcurrent){
        element.qty++;

      }
    });
  }

  @action
  String decreseQuentity(int itemIdcurrent){
    items.forEach((element) {
      if(element.itemId==itemIdcurrent){
       if(element.qty>1)
        {
          element.qty--;
        }

      }
    });
    // getOffersandAdditionalCharge();
  }


  @action
  Future getAddress()async{
    isAddressLoading=true;
    HttpResponse httpResponse= await customerAddressRepo.getCustomerAddresss(myLocalPrefes.getCustId());
    isAddressLoading=false;
    if(httpResponse.status==200){
      adressesMain=httpResponse.data;
    }else {
      error = httpResponse.message;
      isAddressLoading = false;
    }
  }


  @action
  Future<HttpResponse> postPaymentService(String orderId,String status,String paid,dynamic txStatus)async{
    iPaymetnLading=true;
    HttpResponse httpResponse= await orderRepo.updatePaymentStatus(orderId,status,paid,txStatus);
    iPaymetnLading=false;
    if(httpResponse.status==200){
     return httpResponse;
    }
  }



  @action String getCustAddress(){

    custAdrress=myLocalPrefes.getSelectedAddress();

    return custAdrress??"";
  }


  @action String getCustMobile(){
    return myLocalPrefes.getCustPhone();
  }

  @action String getCustName(){
    custName=myLocalPrefes.getCustName();

    return custName;
  }

  @action setCustName(String name)async{
   await myLocalPrefes.setCustName(name);

    custName=name;

  }


  @action setCustNumber(String name)async{
    await myLocalPrefes.setCustPhone(name);
  }


  @action String getCustAddressCaption(){
    custAdrressCaption=myLocalPrefes.getSelectedAddressCaption();

     return custAdrressCaption??"";
  }


  @action String getFrAddress(){
    return myLocalPrefes.getdefFranchiseAddrress();
}

@action String getFrName(){
    return myLocalPrefes.getdefFranchiseName();
}



  @action
  Future getOrderHistory()async{
    await fetchUserOrder();
    if(myLocalPrefes.getCustId()!=0) {
      isLoadingForHistory = true;
      loadingMessage = 'Fetching nearest franchise';
      HttpResponse httpResponse = await orderHistoryRepo.orderHistory('${myLocalPrefes.getCustId()}');
      isLoadingForHistory = false;

      if (httpResponse.status == 200) {

            orderHistory= httpResponse.data;


      } else {
        error = httpResponse.message;
        isLoadingForHistory = false;
      }
    return httpResponse;
    }

  }


  @action
  Future getAllFranchise()async{
   await fetchUserOrder();
    if(myLocalPrefes.getdefFranchiseDairy()==0) {
      isLoading = true;
      loadingMessage = 'Fetching nearest franchise';
      HttpResponse httpResponse = await allFranchiseRepo.allFranchise();
      isLoading = false;

      if (httpResponse.status == 200) {
        if (httpResponse.info.error) {
          error = httpResponse.info.messege;
        } else {
          frainchiseMain = httpResponse.data;

          print(frainchiseMain.franchiseList[1].toString());

          frainchise = frainchiseMain.franchiseList;

          sortFranchiseByKm();
        }
      } else {
        error = httpResponse.message;
        isLoading = false;
      }
    }else{
      getNearestFranchiseById();
    }

  }



  @action
  Future sortFranchiseByKm()async{

    List<String> locations=[];
    StringBuffer buffer=StringBuffer();

    bool bar=false;
    frainchise.forEach((element) {
      if (bar)
     {
       buffer.write('|${element.fromLatitude},${element.fromLongitude}');
    } else
      {
    buffer.write('${element.fromLatitude},${element.fromLongitude}');
    bar=true;
    }
        // ('${element.fromLatitude},${element.fromLongitude}|');
    });
    // myLocalPrefes.setDefFranchise('${frainchise[1].frId}-${frainchise[1].frType}-${frainchise[1].compId}');
    // myLocalPrefes.setFrSelected(true);

    isLoading = true;
    loadingMessage='Fetching nearest franchise';

    HttpResponse httpResponse= await  distancematrixRepo.DistanceMatrixApi('${myLocalPrefes.getUserLatitude()} ,${myLocalPrefes.getUserLongitude()}', buffer.toString());
    distanceMatrix=httpResponse.data;
    isLoading = false;
    lookforNearestFranchise();


  }

  int selectedDistanceRest=9999999,selectedDistanceDairy=9999999;
  int selectedFranchiseId=0;

  @action
  lookforNearestFranchise() async{

    selectedDistanceRest=999999;
    selectedDistanceDairy=9999999;

    isLoading = true;
    isNoDataAvailable=false;
    bool isSelected=false;
    if(distanceMatrix.status=="OK"){
       for(int index=0;index < distanceMatrix.elements.length;index++) {


         if(distanceMatrix.elements[index].status=="OK"){
           if(frainchise[index].frType==1){

             if(selectedDistanceDairy>distanceMatrix.elements[index].distance.value) {
               selectedDistanceDairy = distanceMatrix.elements[index].distance.value;

               if (((frainchise[index].kmAreaCovered)*1000 )>=
                   distanceMatrix.elements[index].distance.value) {
                 selectedFranchiseId = frainchise[index].frId;
               isSelected=true;
               print('selected dairy $selectedDistanceDairy');
             await  myLocalPrefes.setdefFranchiseDairy(frainchise[index].frId);
                 await  myLocalPrefes.setdefFranchiseAddrress(frainchise[index].frAddress);
                 await    myLocalPrefes.setdefFranchiseName(frainchise[index].frName);
             }
             }

           }
           if(frainchise[index].frType==2) {
               if (selectedDistanceRest >
                   distanceMatrix.elements[index].distance.value) {
                 if (((frainchise[index].kmAreaCovered)*1000 ) >=
                     distanceMatrix.elements[index].distance.value) {
                   isSelected=true;

                   selectedDistanceRest =
                     distanceMatrix.elements[index].distance.value;
                 selectedFranchiseId = frainchise[index].frId;
                 print('selected restaurent $selectedDistanceRest');
                   await myLocalPrefes.setDefFranchiseRest(frainchise[index].frId);
                   await myLocalPrefes.setdefFranchiseAddrress(frainchise[index].frAddress);
                   await myLocalPrefes.setdefFranchiseName(frainchise[index].frName);
               }
             }
           }
           if(frainchise[index].frType==3) {
               if (selectedDistanceRest >
                   distanceMatrix.elements[index].distance.value) {
                 if (((frainchise[index].kmAreaCovered)*1000) >=
                     distanceMatrix.elements[index].distance.value) {

                   isSelected=true;
                 selectedDistanceRest =
                     distanceMatrix.elements[index].distance.value;
                 selectedFranchiseId = frainchise[index].frId;
                 print('selected restaurent $selectedDistanceRest');
                   await  myLocalPrefes.setDefFranchiseRest(frainchise[index].frId);
                   await   myLocalPrefes.setdefFranchiseAddrress(frainchise[index].frAddress);
                   await myLocalPrefes.setdefFranchiseName(frainchise[index].frName);
               }
               if (selectedDistanceDairy >
                   distanceMatrix.elements[index].distance.value) {
                 if (((frainchise[index].kmAreaCovered)*1000) >=
                     distanceMatrix.elements[index].distance.value) {
                 selectedDistanceDairy =
                     distanceMatrix.elements[index].distance.value;
                 selectedFranchiseId = frainchise[index].frId;
                 isSelected=true;
                 print('selected dairy $selectedDistanceDairy');
                 await myLocalPrefes.setdefFranchiseDairy(frainchise[index].frId);
                 await myLocalPrefes.setdefFranchiseAddrress(frainchise[index].frAddress);
                 await myLocalPrefes.setdefFranchiseName(frainchise[index].frName);
               }
             }
               }
           }
         }

         if(!isSelected){
           isNoDataAvailable=true;
         }


        }

       isLoading = false;
       getNearestFranchiseById();


    }
  }




  @action
  changeOutlet(Frainchise frainchise)async{

    selectedFranchiseId = frainchise.frId;

    if(frainchise.frType==1){
      await  myLocalPrefes.setdefFranchiseDairy(frainchise.frId);
    }else if(frainchise.frType==2){
      await  myLocalPrefes.setDefFranchiseRest(frainchise.frId);

    }else{
      await  myLocalPrefes.setdefFranchiseDairy(frainchise.frId);
      await  myLocalPrefes.setDefFranchiseRest(frainchise.frId);
    }

    await  myLocalPrefes.setdefFranchiseAddrress(frainchise.frAddress);
    await  myLocalPrefes.setdefFranchiseName(frainchise.frName);
    await fetchUserOrder();
    getNearestFranchiseById();

  }



  getNearestFranchiseById() async{
    await fetchUserOrder();
    isLoadingForFranchiseData=true;

    loadingMessage="Getting frinchise data";
    int id=0;
    if(myLocalPrefes.getSelectedOutletType()==1){
      id=myLocalPrefes.getdefFranchiseDairy();
    }else{
      id=myLocalPrefes.getDefFranchiseRest();
    }


    allFranchiseRepo.getFranchiseDetailsById('$id').then((value) =>
    {
      print("slecetd franchisi data $id  ${value.data.toString()}"),



      if(value.status==200){
        frainchiseHomeData=value.data,
        print('${frainchiseHomeData.itemData[1].tagName}'),
        
        // myLocalPrefes.setdefFranchiseName(frainchiseHomeData)

        if(frainchiseHomeData==null){
          isNoDataAvailable=true,
        }
      },
      isLoadingForFranchiseData=false,
    }).catchError((onError){
      isLoadingForFranchiseData=false;



    });
  }


  @action
  getSortedFranchiseBySort(int sort){
    isLoadingForFranchiseData=true;
    loadingMessage="Getting frinchise data";

    int id=0;
    if(myLocalPrefes.getSelectedOutletType()==1){
      id=myLocalPrefes.getdefFranchiseDairy();
    }else{
      id=myLocalPrefes.getDefFranchiseRest();
    }

    allFranchiseRepo.getFranchiseDetailsSorted(id,sort).then((value) =>
    {
      print("slecetd franchisi data ${value.data.toString()}"),

      if(value.status==200){
        frainchiseHomeData=value.data,
        print('${frainchiseHomeData.itemData[1].tagName}'),
      },

      isLoadingForFranchiseData=false,
    }).catchError((onError){
      isLoadingForFranchiseData=false;


    });
  }

  @action
  getSortedFranchiseByRating(String rating){
    isLoadingForFranchiseData=true;
    loadingMessage="Getting frinchise data $rating";
    int id=0;
    if(myLocalPrefes.getSelectedOutletType()==1){
      id=myLocalPrefes.getdefFranchiseDairy();
    }else{
      id=myLocalPrefes.getDefFranchiseRest();
    }
    allFranchiseRepo.getFranchiseDetailsRating(id,rating).then((value) =>
    {
      print("slecetd franchisi data ${value.data.toString()}"),

      if(value.status==200){
        frainchiseHomeData=value.data,
        print('${frainchiseHomeData.itemData[1].tagName}'),
      },
      isLoadingForFranchiseData=false,
    }).catchError((onError){
      isLoadingForFranchiseData=false;


    });
  }

  @action
  Future getOffersandAdditionalCharge() async{
    int id=0;
    if(myLocalPrefes.getSelectedOutletType()==1){
      id=myLocalPrefes.getdefFranchiseDairy();
    }else{
      id=myLocalPrefes.getDefFranchiseRest();
    }
   isLoadingForOffers=true;
   HttpResponse httpResponse= await additionalChargesAndOffersRepo.getAdditionChargesAnadOffers('$id',myLocalPrefes.getCustId() , 2);
   isLoadingForOffers=false;
   offersMain=httpResponse.data;

  }



  getSelectedFranchise(){

   frainchise.forEach((element) {
      int id=0;
      if(myLocalPrefes.getSelectedOutletType()==1){
        id=myLocalPrefes.getdefFranchiseDairy();
      }else{
        id=myLocalPrefes.getDefFranchiseRest();
      }
      if(element.frId==id){

        selectedFranchise=element;

      }

    });


  }



 Future<List<Frainchise>>  getFranchise()async{
    List<Frainchise> filterid=[];
    await getAllFranchiseForTackAway();

      frainchise.forEach((element) {
        if(element.frType==outletType || element.frType==3){
          filterid.add(element);
        }
      });
      filterid.sort((a, b) => a.distance.compareTo(b.distance));
      isLoading=false;
      return filterid;
  }

  @action
  Future getAllFranchiseForTackAway()async{
    await fetchUserOrder();
      isLoading = true;
      loadingMessage = 'Fetching nearest franchise';
      HttpResponse httpResponse = await allFranchiseRepo.allFranchise();


      if (httpResponse.status == 200) {
        if (httpResponse.info.error) {
          error = httpResponse.info.messege;
        } else {
          frainchiseMain = httpResponse.data;

          print(frainchiseMain.franchiseList[1].toString());

          frainchise = frainchiseMain.franchiseList;

         await sortFranchiseByKmForTakeAway();
          getSelectedFranchise();
          isLoading = false;
        }
      } else {
        error = httpResponse.message;
        isLoading = false;
      }
    }


  @action
  Future sortFranchiseByKmForTakeAway()async{

    List<String> locations=[];
    StringBuffer buffer=StringBuffer();

    bool bar=false;
    frainchise.forEach((element) {
      if (bar)
      {
        buffer.write('|${element.fromLatitude},${element.fromLongitude}');
      } else
      {
        buffer.write('${element.fromLatitude},${element.fromLongitude}');
        bar=true;
      }
      // ('${element.fromLatitude},${element.fromLongitude}|');
    });
    // myLocalPrefes.setDefFranchise('${frainchise[1].frId}-${frainchise[1].frType}-${frainchise[1].compId}');
    // myLocalPrefes.setFrSelected(true);

    isLoading = true;
    loadingMessage='Fetching nearest franchise';

    HttpResponse httpResponse= await  distancematrixRepo.DistanceMatrixApi('${myLocalPrefes.getUserLatitude()} ,${myLocalPrefes.getUserLongitude()}', buffer.toString());
    distanceMatrix=httpResponse.data;
    isLoading = false;
    lookforNearestFranchiseForTakAway();


  }


  @action
  lookforNearestFranchiseForTakAway() {
    isLoading = true;
    isNoDataAvailable = false;
    bool isSelected = false;
    if (distanceMatrix.status == "OK") {
      for (int index = 0; index < distanceMatrix.elements.length; index++) {
        if (distanceMatrix.elements[index].status == "OK") {
          frainchise[index].distance =
              distanceMatrix.elements[index].distance.value / 1000;
          frainchise[index].duration =
              distanceMatrix.elements[index].duration.text;
        }


        isLoading = false;
        // getNearestFranchiseById();


      }
    }
  }



}