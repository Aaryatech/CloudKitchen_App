

import 'dart:convert';

import 'package:cloud_kitchen/local/prefs.dart';
import 'package:cloud_kitchen/network/model/httpresponce.dart';
import 'package:cloud_kitchen/network/model/request/PlaceOrder/OrderDetailList.dart';
import 'package:cloud_kitchen/network/model/request/PlaceOrder/PlaceOrder.dart';
import 'package:cloud_kitchen/network/model/request/purchase/cartitem.dart';
import 'package:cloud_kitchen/network/model/response/AddressBookModel.dart';
import 'package:cloud_kitchen/network/model/response/CustomerAddress.dart';
import 'package:cloud_kitchen/network/model/response/Franchise.dart';
import 'package:cloud_kitchen/network/model/response/FranchiseId.dart';
import 'package:cloud_kitchen/network/model/response/ItemData.dart';
import 'package:cloud_kitchen/network/model/response/distancematrics/distancematricsone.dart';
import 'package:cloud_kitchen/network/model/response/franchiseMain.dart';
import 'package:cloud_kitchen/network/model/response/franchiseoffers/offersmain.dart';
import 'package:cloud_kitchen/network/model/response/placeorder/placeordermain.dart';
import 'package:cloud_kitchen/network/repository/additionalcharges/additionalchargesRepo.dart';
import 'package:cloud_kitchen/network/repository/allFranchiseRepo.dart';
import 'package:cloud_kitchen/network/repository/customerAddressRepo.dart';
import 'package:cloud_kitchen/network/repository/distancematrixrepo.dart';
import 'package:cloud_kitchen/network/repository/order/orderrepo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
part 'frviewmodel.g.dart';


class AllFrenchisiViewModel = _AllFrenchisiViewModel with _$AllFrenchisiViewModel;


abstract class _AllFrenchisiViewModel with Store {


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
  bool isPlaceingOrder = false;


  @observable
  bool iPaymetnLading = false;


  @observable
  bool isChagesdataAvailable = false;

  @observable
  CustomerAddressMain adressesMain;


  @observable
  List<int> itemsIds = [];


  @observable
  bool isLoading = false;


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
  String loadingMessage = '';


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
  String custAdrress;


  @observable
  String custName;

  @observable
  String custAdrressCaption;

  @observable
  OffersMain offersMain;

  List<String> selected;


  @action
  Future searchList(String seacrh) {
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


  OrderRepo orderRepo;

  _AllFrenchisiViewModel() {
    allFranchiseRepo = AllFranchiseRepo();
    distancematrixRepo = DistancematrixRepo();
    orderRepo = OrderRepo();
    myLocalPrefes = MyLocalPrefes();
    customerAddressRepo = CustomerAddressRepo();
    additionalChargesAndOffersRepo = AdditionalChargesAndOffersRepo();
  }


  Future<String> fetchUserOrder() {
    Future.delayed(Duration(milliseconds: 300), () {

          getCustAddress();
          getCustAddressCaption();

           return 'Large Latte';
          }
    );
  }



  @action
  setDefAddress(String adress,String caption){
    custAdrress=adress;
    custAdrressCaption=caption;
    myLocalPrefes.setSelectedAddress(adress);
    myLocalPrefes.setSelectedAddressCaption(caption);
  }


  @action
  changeDefAddress(CustomerAddress customerAddress){
    custAdrress=customerAddress.landmark;
    custAdrressCaption=customerAddress.addressCaption;
    myLocalPrefes.setSelectedAddress(custAdrress);
    myLocalPrefes.setSelectedAddressCaption(custAdrressCaption);
    myLocalPrefes.setUserLatitude(customerAddress.latitude);
    myLocalPrefes.setUserLongitude(customerAddress.longitude);
    myLocalPrefes.setDefFranchiseRest(0);
    myLocalPrefes.setdefFranchiseDairy(0);
    getAllFranchise();
  }



  DateTime currentDateTime = DateTime.now();

  @action
 Future<HttpResponse> placeOrder(double itemTotal,int payMode,int offerId,double deliveryCharges,double descAmt)async{
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
          addressId:2, //,
          applicableFor: 2,
          custId: myLocalPrefes.getCustId(),
          deliveryCharges: deliveryCharges,
          discAmt: descAmt??0,
          itemTotal: itemTotal,
          deliveryDate: '${currentDateTime.year}-${currentDateTime.month}-${currentDateTime.day}',
          deliveryTime: '${currentDateTime.hour}-${currentDateTime.minute}',
          frId:79,
          wallet: 0,
          deliveryInstructionId: 4,
          deliveryInstructionText: "",
          deliveryType: 1,
          km: 5,
          offerId: 0,
          orderPlatform: 2,
          orderStatus:1,
          payMode: 2,);

  HttpResponse httpResponse = await orderRepo.placeOredr(placeOrder);
    isPlaceingOrder=false;
   if(httpResponse.status==200){
   placeOrderModel = httpResponse.data;
   initiatePayment=true;
   }
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

  @action String getCustAddressCaption(){
    custAdrressCaption=myLocalPrefes.getSelectedAddressCaption();

     return custAdrressCaption??"";
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
  lookforNearestFranchise(){
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
               myLocalPrefes.setdefFranchiseDairy(frainchise[index].frId);
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
                 myLocalPrefes.setDefFranchiseRest(frainchise[index].frId);
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
                 myLocalPrefes.setDefFranchiseRest(frainchise[index].frId);
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
                 myLocalPrefes.setdefFranchiseDairy(frainchise[index].frId);
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






  getNearestFranchiseById(){
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
      isLoadingForFranchiseData=false,


      if(value.status==200){
        frainchiseHomeData=value.data,
        print('${frainchiseHomeData.itemData[1].tagName}'),

        if(frainchiseHomeData==null){
          isNoDataAvailable=true,
        }
      },

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
    loadingMessage="Getting frinchise data";
    int id=0;
    if(myLocalPrefes.getSelectedOutletType()==1){
      id=myLocalPrefes.getdefFranchiseDairy();
    }else{
      id=myLocalPrefes.getDefFranchiseRest();
    }
    allFranchiseRepo.getFranchiseDetailsRating(id,rating).then((value) =>
    {
      print("slecetd franchisi data ${value.data.toString()}"),
      isLoadingForFranchiseData=false,

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


}