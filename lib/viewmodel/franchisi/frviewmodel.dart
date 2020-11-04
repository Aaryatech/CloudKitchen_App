

import 'package:cloud_kitchen/local/prefs.dart';
import 'package:cloud_kitchen/network/model/httpresponce.dart';
import 'package:cloud_kitchen/network/model/request/purchase/cartitem.dart';
import 'package:cloud_kitchen/network/model/response/Franchise.dart';
import 'package:cloud_kitchen/network/model/response/FranchiseId.dart';
import 'package:cloud_kitchen/network/model/response/distancematrics/distancematricsone.dart';
import 'package:cloud_kitchen/network/model/response/franchiseMain.dart';
import 'package:cloud_kitchen/network/repository/allFranchiseRepo.dart';
import 'package:cloud_kitchen/network/repository/distancematrixrepo.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'frviewmodel.g.dart';


class AllFrenchisiViewModel = _AllFrenchisiViewModel with _$AllFrenchisiViewModel;


abstract class _AllFrenchisiViewModel with Store {


  AllFranchiseRepo allFranchiseRepo;
  MyLocalPrefes myLocalPrefes;
  DistancematrixRepo distancematrixRepo;



  @observable
  List<CartItem> items=[];


  @observable
  List<int> itemsIds=[];



  @observable
  bool isLoading=false;

  @observable
  bool isLoadingForFranchiseData=true;


  @observable
  String loadingMessage='';


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

  List<String> selected;



  _AllFrenchisiViewModel(){
    allFranchiseRepo=AllFranchiseRepo();
    distancematrixRepo=DistancematrixRepo();
    myLocalPrefes=MyLocalPrefes();
  }



  @action
  addCartItem(CartItem item){
    List<int> tempitemsids=itemsIds;
    List<CartItem> tempitems=items;
    tempitemsids.add(item.itemId);
    tempitems.add(item);

    itemsIds=tempitemsids;
    items=tempitems;
  }


  @action
  Future getAllFranchise()async{



      isLoading = true;
      loadingMessage='Fetching nearest franchise';
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
    if(distanceMatrix.status=="OK"){
       for(int index=0;index < distanceMatrix.elements.length;index++) {


         if(distanceMatrix.elements[index].status=="OK"){
           if(frainchise[index].frType==1){

             if(selectedDistanceDairy>distanceMatrix.elements[index].distance.value) {
               selectedDistanceDairy = distanceMatrix.elements[index].distance.value;
               selectedFranchiseId=frainchise[index].frId;
               print('selected dairy $selectedDistanceDairy');
             }

           }
           if(frainchise[index].frType==2){
             if(selectedDistanceRest>distanceMatrix.elements[index].distance.value) {
               selectedDistanceRest = distanceMatrix.elements[index].distance.value;
               selectedFranchiseId=frainchise[index].frId;
               print('selected restaurent $selectedDistanceRest');
             }
             }

           if(frainchise[index].frType==3){
             if(selectedDistanceRest>distanceMatrix.elements[index].distance.value) {
               selectedDistanceRest =
                   distanceMatrix.elements[index].distance.value;
               selectedFranchiseId=frainchise[index].frId;
               print('selected restaurent $selectedDistanceRest');
             }
               if(selectedDistanceDairy>distanceMatrix.elements[index].distance.value) {
                  selectedDistanceDairy=distanceMatrix.elements[index].distance.value;
                  selectedFranchiseId=frainchise[index].frId;
                  print('selected dairy $selectedDistanceDairy');
               }

               }
         }


        }

       isLoading = false;
       getNearestFranchiseById();


    }
  }



  getNearestFranchiseById(){
    isLoadingForFranchiseData=true;
    loadingMessage="Getting frinchise data";
    allFranchiseRepo.getFranchiseDetailsById('79').then((value) =>
    {
      print("slecetd franchisi data ${value.data.toString()}"),
      isLoadingForFranchiseData=false,

      if(value.status==200){
        frainchiseHomeData=value.data,
        print('${frainchiseHomeData.itemData[1].tagName}'),
      },

    }).catchError((onError){
      isLoadingForFranchiseData=false;


    });
  }
  @action
  Future getOffersandAdditionalCharge(){



  }


}