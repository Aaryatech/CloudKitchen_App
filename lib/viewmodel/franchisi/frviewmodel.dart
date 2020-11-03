

import 'package:cloud_kitchen/local/prefs.dart';
import 'package:cloud_kitchen/network/model/httpresponce.dart';
import 'package:cloud_kitchen/network/model/response/Franchise.dart';
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
  bool isLoading=false;


  @observable
  List<Frainchise> frainchise;


  @observable
  FranchiseMain frainchiseMain;

  @observable
  String error;



  _AllFrenchisiViewModel(){
    allFranchiseRepo=AllFranchiseRepo();
    distancematrixRepo=DistancematrixRepo();
    myLocalPrefes=MyLocalPrefes();
  }


  @action
  Future getAllFranchise()async{



      isLoading = true;
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
      }

  }



  @action
  Future sortFranchiseByKm(){

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


    myLocalPrefes.setDefFranchise('${frainchise[1].frId}-${frainchise[1].frType}-${frainchise[1].compId}');
    myLocalPrefes.setFrSelected(true);
    distancematrixRepo.DistanceMatrix('${myLocalPrefes.getUserLatitude()} ,${myLocalPrefes.getUserLongitude()}', buffer.toString());



  }





}